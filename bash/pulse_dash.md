# pulse_dash

## NAME
pulse_dash - animate dashes in the terminal

## SYNOPSIS
`pulse_dash.sh` [`-s`|`--style` repeat|snake] [`-c`|`--count` NUMBER] [`-w`|`--wait` SECONDS]

## DESCRIPTION
Creates an animated dash that pulses through different dash characters (-, –, —). Can be used for loading indicators, progress bars, or visual feedback.

## OPTIONS
* `-s`, `--style` <style>:
    Animation style (default: repeat)
    - `repeat`: Cycles through dash characters (-, –, —)
    - `snake`: Creates a snake-like motion (-, –, —, –)

* `-c`, `--count` <number>:
    Number of characters to display (default: 1)

* `-w`, `--wait` <seconds>:
    Wait time between frames in seconds (default: 0.3)

* `-h`, `--help`:
    Display help message

## EXAMPLES
Basic usage:
    `pulse_dash.sh`

Snake style with 20 characters:
    `pulse_dash.sh -s snake -c 20`

Fast repeating pattern:
    `pulse_dash.sh -w 0.1`

Multiple characters with custom speed:
    `pulse_dash.sh -s repeat -c 10 -w 0.2`

## EXIT STATUS
Returns 0 on normal termination (Ctrl+C), 1 on error.

## NOTES
Requires a terminal that supports UTF-8 for proper dash character display.

## AUTHOR
Written by Matt Nicole.

## BUGS
Report bugs to: https://github.com/username/pulse-dash/issues

## COPYRIGHT
MIT License - See LICENSE file for details 