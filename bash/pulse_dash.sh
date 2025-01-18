#!/bin/bash

# Base characters
d="-"
n="–"
m="—"

# Default values
style="repeat"
count=1
wait=0.3
phase=0  # Phase delay between characters (0 means all in sync)

# Function to cleanup on exit
cleanup() {
    tput cnorm  # Show cursor
    exit 0
}

# Trap cleanup function for script interruption
trap cleanup INT TERM

# Function to print usage
print_usage() {
    echo "Usage: $0 [-s|--style repeat|snake] [-c|--count NUMBER] [-w|--wait SECONDS] [-p|--phase SECONDS]"
    echo "Options:"
    echo "  -s, --style   Animation style: repeat (default) or snake"
    echo "  -c, --count   Number of characters to display (default: 1)"
    echo "  -w, --wait    Wait time between frames in seconds (default: 0.3)"
    echo "  -p, --phase   Phase delay between characters in seconds (default: 0)"
    echo "  -h, --help    Show this help message"
    tput cnorm  # Show cursor before exiting
    exit 1
}

# Hide cursor
tput civis

# Parse named parameters
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -s|--style) style="$2"; shift ;;
        -c|--count) count="$2"; shift ;;
        -w|--wait) wait="$2"; shift ;;
        -p|--phase) phase="$2"; shift ;;
        -h|--help) print_usage ;;
        *) echo "Unknown parameter: $1"; print_usage ;;
    esac
    shift
done

# Set characters based on style
case $style in
    "repeat")
        characters=("$d" "$n" "$m")
        ;;
    "snake")
        characters=("$d" "$n" "$m" "$n" "$m" "$n")  # Modified sequence for smoother pulsing
        ;;
    *)
        echo "Error: Invalid style. Must be 'repeat' or 'snake'"
        print_usage
        ;;
esac

# Validate numeric parameters
if ! [[ "$count" =~ ^[0-9]+$ ]]; then
    echo "Error: count must be a number"
    print_usage
fi

if ! [[ "$wait" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: wait must be a number"
    print_usage
fi

if ! [[ "$phase" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: phase must be a number"
    print_usage
fi

# Calculate total cycle length for phase timing
cycle_length=${#characters[@]}

# Initialize frame counter
frame=0

# Infinite loop to keep the pulse running
while true; do
    # Clear the line
    echo -ne "\r"
    # Print each character
    for ((i=1; i<=$count; i++)); do
        # All characters show the same frame when phase is 0
        char_index=$(( frame % cycle_length ))
        echo -n "${characters[$char_index]}"
    done
    # Wait for specified interval
    sleep $wait
    # Increment frame counter
    frame=$(( (frame + 1) % cycle_length ))
done 