#!/bin/bash

# Function to display ASCII art with gradient color in a box
display_ascii_art() {
    local text="$1"
    local color1="$2"
    local color2="$3"

    # Define color codes
    local color_start="\e[${color1}m"
    local color_end="\e[0m"

    # Create ASCII art with gradient color
    local ascii_art="${color_start}   ${text}   ${color_end}"

    # Calculate padding for centering the box
    local term_width=$(tput cols)
    local padding=$(( (term_width - ${#ascii_art}) / 2 ))

    # Display the ASCII art in a box at the center
    printf '\e[1;1H' # Move cursor to the top-left corner
    printf '\e[K'    # Clear the line
    printf '%*s\n' "${padding}" " " # Add left padding
    echo "${ascii_art}" # Display ASCII art
    printf '%*s\n' "${padding}" " " # Add right padding
}

# Prompt the user for a custom name
read -p "Enter custom name for Termux header: " custom_name

# Convert the custom name to ASCII art with gradient color
ascii_art_color1="38;5;208" # Orange
ascii_art_color2="38;5;214" # Light orange
ascii_art=$(toilet -f future -F metal --gay "${custom_name}")

# Display ASCII art in a box at the center
display_ascii_art "${ascii_art}" "${ascii_art_color1}" "${ascii_art_color2}"
