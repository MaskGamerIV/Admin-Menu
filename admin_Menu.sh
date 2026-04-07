#! /bin/bash

#Ernest La Mertha, Mark Higdon, CI 201 Section 01
#This program


function main_Menu()
{
    echo "---------- Main Menu ----------"

    select option in "Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit Program"
    do
        case $option in
            "Disk Management") echo "Disk Management";;
            "File Management") echo "File Management";;
            "Network Management") echo "Network Management";;
            "Process Managment") echo "Process Management";;
            "User Account Management") echo "User Account Management";;
            "Utilities") echo "Utilities";;
            "Exit Program") echo "Exiting program..."
            exit 0;;
        esac
    done
}


#Disk Management


#File Management


#Network Management


#Process Management


#User Account Management


#Utilities


main_Menu
