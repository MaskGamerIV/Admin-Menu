#! /bin/bash

#Ernest La Mertha, Mark Higdon, CI 201 Section 01
#This program


#Main Menu
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
function Disk_management()
{
    select option in "Display device information" "Display disk partition information" "Display block device information" "Display mounted disk information" "Return to Main Menu"
    do
        case $option in
            "Display device information" )
                cd /dev
                ls -l
                Disk_management;;
            "Display disk partition information" )
                sudo fdisk -l
                Disk_management;;
            "Display block device information" )
                lsblk
                Disk_management;;
            "Display mounted disk information" )
                df sdb
                Disk_management;;
            "Return to Main Menu" )
                echo "main menu"
                exit 0;;
        esac
done
}


#File Management


#Network Management


#Process Management


#User Account Management


#Utilities


main_Menu
