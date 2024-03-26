#!/bin/bash

# FIX:  input.csv => radyodelisi.csv
# TEST: create a csv file and test the code 

# Step 1: Interactively select row
selected_row=$(fzf)

# Step 2: Filter out selected row
awk -v pattern="$selected_row" 'NR == 1 || $0 != pattern' input.csv > temp.csv && mv temp.csv input.csv

# Optional: Confirmation message
echo "Row removed successfully."
