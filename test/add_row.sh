#!/usr/bin/env bash

# echo "Station Name:"
# read station_name
#
# echo "Station URL:"
# read station_url 
#
# new_station="$station_name,$station_url"
#
# # # Define the new row data
# # new_row="value1,value2,value3"
#
# # Append the new row to the CSV file
# # echo "$new_station" >> ../src/radyodelisi.csv
# echo "$new_station" >> input.csv
#

add_station_to_csv(){
    echo "Station Name:"
    read station_name
    echo "Station URL:"
    read station_url 
    new_station="$station_name,$station_url"
    echo "$new_station" >> input.csv
}

add_station_to_csv
