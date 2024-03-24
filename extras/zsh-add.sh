#!/bin/bash

# Define the function

# FIX: add your own function into zsh

my_function() {
    echo "This is my function!"
    # HACK: get stations names from anywhere in system 
}

# Define the path to your .zshrc file
zshrc_file="$HOME/.zshrc"

# Check if the function is already defined in .zshrc
if ! grep -qF "my_function() {" "$zshrc_file"; then
    # Append the function definition to .zshrc
    echo "my_function() {" >> "$zshrc_file"
    echo "    echo 'This is my function!'" >> "$zshrc_file"
    echo "}" >> "$zshrc_file"
    echo "Function added to .zshrc"
else
    echo "Function already exists in .zshrc"
fi
