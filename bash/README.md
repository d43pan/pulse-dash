# Pulse Dash Animation Scripts

This directory contains various implementations of a pulsing dash animation that can be used for loading indicators, progress bars, or other visual feedback.

## Bash Implementation

### Usage

1. Make the script executable:

    `chmod +x pulse_dash.sh`

2. Run the script:
   - Default (single repeat pattern):
   
    `./pulse_dash.sh`
    
   - With specific animation style:
   
    `./pulse_dash.sh --style repeat`  # or -s repeat
    `./pulse_dash.sh --style snake`   # or -s snake
    
   - With repeat count:
   
    `./pulse_dash.sh --style repeat --count 10`  # or -s repeat -c 10
    `./pulse_dash.sh -s snake -c 5`              # shows 5 characters snaking together
    
   - With custom wait time:
   
    `./pulse_dash.sh -w 0.1`                     # faster animation
    `./pulse_dash.sh -s snake -c 5 -w 0.5`       # slower animation
    
   - With phase delay (creates wave effect):
   
    `./pulse_dash.sh -c 10 -p 0.1`               # wave effect
    `./pulse_dash.sh -s snake -c 5 -w 0.3 -p 0.1` # snake wave
    
   - Show help:
   
    `./pulse_dash.sh --help`  # or -h

### Features
- Simple pulsing animation using proper typographic dashes
- Two animation styles:
  - `repeat`: Cycles through hyphen, en dash, em dash repeatedly
  - `snake`: Snakes back and forth through the dash sizes
- Configurable repeat count for multiple characters
- Adjustable animation speed
- Phase delay for wave-like effects
- Named parameters for easy usage
- Minimal resource usage
- Works in any terminal that supports UTF-8 and ANSI escape codes

### How it Works
The script cycles through different dash characters (hyphen `-`, en dash `–`, em dash `—`) to create a pulsing effect. It uses:
- `echo -ne`: Prints without a newline (`-n`) and interprets escape sequences (`-e`)
- `\r`: Carriage return to overwrite the previous line
- `sleep`: Creates a configurable delay between transitions
- Phase delay: Creates wave-like effects by offsetting the start time of each character

### Stopping the Script
Press `Ctrl+C` to stop the animation.

## Additional Implementations

More implementations in other languages (HTML/CSS, JavaScript, Vue, React, etc.) will be added to sibling directories. 