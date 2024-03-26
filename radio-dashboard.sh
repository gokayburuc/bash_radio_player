#!/bin/bash

# Function to display the menu
display_menu() {
    clear 
    echo " 
 ┌─┐┌─┐┬┌─┌─┐┬ ┬┌┐ ┬ ┬┬─┐┬ ┬┌─┐
 │ ┬│ │├┴┐├─┤└┬┘├┴┐│ │├┬┘│ ││  
 └─┘└─┘┴ ┴┴ ┴ ┴ └─┘└─┘┴└─└─┘└─┘
    "
    echo "================="
    echo "
 ┬─┐┌─┐┌┬┐┬┌─┐  ┌─┐┬  ┌─┐┬ ┬┌─┐┬─┐
 ├┬┘├─┤ ││││ │  ├─┘│  ├─┤└┬┘├┤ ├┬┘
 ┴└─┴ ┴─┴┘┴└─┘  ┴  ┴─┘┴ ┴ ┴ └─┘┴└─
    "
    echo "=== Dashboard ==="
    echo "1. Add a new station"
    echo "2. Remove a station"
    echo "3. View all stations"
    echo "4. Listen Radio"
    echo "5. Exit"
    echo "================="
}

# Function to add a new station
add_station() {
    echo "=== Add a new station ==="
    echo "Enter the station name:"
    read station_name
    echo "Enter the station URL:"
    read station_url
    echo "$station_name,$station_url" >> ./src/radyodelisi.csv
    echo "Station added successfully!"
    read -n 1 -s -r -p "Press any key to continue..."
}

# FIX: remove stati
remove_station() {
    selected_line=$(cat ./src/radyodelisi.csv | fzf --reverse)
    filtered_output=$(grep -vF "$selected_line" ./src/radyodelisi.csv)
    echo "$filtered_output" > ./src/radyodelisi.csv
    echo "Station removed successfully!"
    read -n 1 -s -r -p "Press any key to continue..."
}


# TODO: add listener here 
listen_radio(){
    selected_station=$(awk -F ',' '{ print $1 }' ./src/radyodelisi.csv | fzf --prompt="Select a radio station: ")
    if [ -n "$selected_station" ]; then
        station=$(awk -F ',' -v station="$selected_station" '$1 == station { print $2 }' ./src/radyodelisi.csv)
        mpv "$station"
    fi
}

# Function to view all stations
view_stations() {
    echo "=== All Stations ==="
    cat ./src/radyodelisi.csv
    read -n 1 -s -r -p "Press any key to continue..."
}

# Main loop
while true; do
    display_menu
    read -p "Enter your choice: " choice
    case $choice in
        1)
            add_station
            ;;
        2)
            remove_station
            ;;
        3)
            view_stations
            ;;
# FIX: add listener as option 
        4)
            listen_radio
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
    esac
done
