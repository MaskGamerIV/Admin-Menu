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
            "Disk Management") 
                Disk_management;;
            "File Management") 
                file_Management;;
            "Network Management") 
                echo "Network Management";;
            "Process Management") 
                echo "Process Management";;
            "User Account Management") 
                echo "User Account Management";;
            "Utilities") 
                echo "Utilities";;
            "Exit Program") 
                echo "Exiting program..."
                exit 0;;
        esac
    done
}


#Disk Management
function Disk_management()
{
    echo ""

    echo "---------- Disk Management ----------"

    select option in "Display device information" "Display disk partition information" "Display block device information" "Display mounted disk information" "Return to Main Menu"
    do
        case $option in
            "Display device information" )
                ls -l /dev
                Disk_management;;
            "Display disk partition information" )
                sudo fdisk -l
                Disk_management;;
            "Display block device information" )
                lsblk
                Disk_management;;
            "Display mounted disk information" )
                df -h
                Disk_management;;
            "Return to Main Menu" )
                echo ""
                main_Menu;;
        esac
done
}


#File Management
function file_Management()
{
    echo ""
    echo "---------- File Management ----------"

    select option in "Present Working Directory" "List Directory Contents" "Create a File" "Change File Permissions" "Remove a File" "Read a File" "Return to Main Menu"
    do
        case $option in
        "Present Working Directory")
            echo ""
            pwd
            file_Management;;
        "List Directory Contents")
            echo ""
            ls -la
            file_Management;;
        "Create a File")
            echo ""
            read -p "Enter file name (include file type): " file
            touch "$file"
            file_Management;;
        "Change File Permissions")
            echo ""
            read -p "Enter file name: " file
            read -p "Enter user permissions (i.e. r w x): " -a user
            read -p "Enter group permissions (i.e. r w): " -a group
            read -p "Enter others permissions (i.e. r x): " -a other

            pUser=0
            pGroup=0
            pOther=0

            for permission in "${user[@]}"
            do
                if [ "$permission" = "r" ]; then
                    ((pUser += 4))
                elif [ "$permission" = "w" ]; then
                    ((pUser += 2))
                elif [ "$permission" = "x" ]; then
                    ((pUser += 1))
                fi
            done

            for permission in "${group[@]}"
            do
                if [ "$permission" = "r" ]; then
                    ((pGroup += 4))
                elif [ "$permission" = "w" ]; then
                    ((pGroup += 2))
                elif [ "$permission" = "x" ]; then
                    ((pGroup += 1))
                fi
            done

            for permission in "${other[@]}"
            do
                if [ "$permission" = "r" ]; then
                    ((pOther += 4))
                elif [ "$permission" = "w" ]; then
                    ((pOther += 2))
                elif [ "$permission" = "x" ]; then
                    ((pOther += 1))
                fi
            done

            chmod "$pUser$pGroup$pOther" "$file"
            file_Management;;
        "Remove a File")
            echo ""
            read -p "Enter file name: " file
            rm "$file"
            file_Management;;
        "Read a File")
            echo ""
            read -p "Enter file name: " file
            cat "$file"
            file_Management;;
        "Return to Main Menu")
            echo ""
            main_Menu;;
        esac
    done
}


#Network Management


#Process Management


#User Account Management


#Utilities


main_Menu
