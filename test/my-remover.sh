#!/usr/bin/env bash

# # selected lines 
# selected_line=$(cat input.csv | fzf --reverse) # FIX: change input.csv 
#
# # filter with grep 
# filtered_output=$(grep -vF "$selected_line" input.csv)
# echo "$filtered_output" > input.csv
#

row_remover() {
    selected_line=$(cat input.csv | fzf --reverse) # FIX: change input.csv 
    filtered_output=$(grep -vF "$selected_line" input.csv)
    echo "$filtered_output" > input.csv
}

row_remover
