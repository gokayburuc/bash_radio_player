#!/usr/bin/env bash

row_remover() {
    selected_line=$(cat ./src/radyodelisi.csv | fzf --reverse) 
    filtered_output=$(grep -vF "$selected_line" ./src/radyodelisi.csv)
    echo "$filtered_output" > input.csv
}

# function 
row_remover
