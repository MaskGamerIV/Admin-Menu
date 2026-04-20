#! /bin/bash

#Ernest La Mertha, Mark Higdon, CI 201 Section 01
#This program


#Main Menu
function main_Menu()
{
    echo "---------- Main Menu ----------"

    select option in "Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit Program"
    do
        case "$option" in
            "Disk Management") 
                Disk_management;;
            "File Management") 
                file_Management;;
            "Network Management") 
                Network_management;;
            "Process Management") 
                process_Management;;
            "User Account Management") 
                UserAccount_Management;;
            "Utilities") 
                Utilities;;
            "Exit Program") 
                echo "Exiting program..."
                exit 0;;
            *)
                echo
                echo "Invalid Option"
                main_Menu;;
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
        case "$option" in
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
                findmnt
                Disk_management;;
            "Return to Main Menu" )
                echo
                main_Menu;;
            *)
                echo
                echo "Invalid Option"
                Disk_management;;
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
        case "$option" in
        "Present Working Directory")
            echo
            pwd
            file_Management;;
        "List Directory Contents")
            echo
            ls -la
            file_Management;;
        "Create a File")
            echo
            read -p "Enter file name (include file extension (i.e. .txt)): " file
            touch "$file"
            file_Management;;
        "Change File Permissions")
            echo
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
            echo
            read -p "Enter file name: " file
            rm "$file"
            file_Management;;
        "Read a File")
            echo
            read -p "Enter file name: " file

            cat "$file"
            file_Management;;
        "Return to Main Menu")
            echo
            main_Menu;;
        *)
            echo
            echo "Invalid Option"
            file_Management;;
        esac
    done
}


#Network Management
function Network_management()
{
    echo
    echo "---------- Network Management ----------"
    
    select option in "ifconfig" "ping" "traceroute" "nslookup" "View Network Interfaces" "View Network Routing Table" "View current system users" "View client machine information" "Return to main menu"
    do    
        case "$option" in 
            "ifconfig" )
                echo
                ifconfig
                Network_management;;
            "ping" )
                echo
                read -p "Enter IP address (i.e. 123.45.67.890): " ip
                ping -c 1 -i 1 -w 2 "$ip"
                Network_management;;
            "traceroute" )
                echo
                read -p "Enter IP address (i.e. 123.45.67.890): " ip
                traceroute -d -e "$ip"
                Network_management;;
            "nslookup")
                read -p "Enter domain name (i.e. google.com): " domain
                nslookup "$domain"           
                Network_management;;
            "View Network Interfaces" )
                netstat -i    
                Network_management;;
            "View Network Routing Table" )
                netstat -r             
                Network_management;;
            "View current system users" )
                finger     
                Network_management;;
            "View client machine information" )
                uname -a        
                Network_management;;
            "Return to main menu" )
                echo
                main_Menu;;
            *)
                echo
                echo "Invalid Input"
                Network_management;;
        esac

    done

}

#Process Management
function process_Management()
{
    echo ""
    
    echo "---------- Process Management ----------"

    select option in "Display Process" "Display Process by usage" "Terminate a Process" "Display Disk Usage" "Display Free Disk Space" "Display System Uptime" "Return to Main Menu"
    do
        case "$option" in
            "Display Process")
                echo
                ps aux
                process_Management;;
            "Display Process by usage")
                echo
                top
                process_Management;;
            "Terminate a Process")
                echo
                read -p "Enter the process ID (PID): " id
                kill "$id"
                echo "Process terminated"
                process_Management;;
            "Display Disk Usage")
                echo
                du -sh
                process_Management;;
            "Display Free Disk Space")
                echo
                df -h
                process_Management;;
            "Display System Uptime")
                echo
                uptime
                process_Management;;
            "Return to Main Menu")
                echo
                main_Menu;;
            *)
                echo "Invalid Input"
                process_Management;;
        esac
    done
}


#User Account Management
function UserAccount_Management()
{
    echo
    echo "---------- User Account Management ----------"
    
    select option in "Add user" "Delete user" "Lock user password" "Get information on user" "Add group" "Delete group" "Find user" "Find group" "Return to main menu"
    do
    case "$option" in 
        "Add user" )
            echo
            read -p "enter username: " username
            sudo useradd "$username"
            UserAccount_Management;;
        "Delete user" )
            read -p "who would you like to remove? " username
            sudo userdel "$username"
            UserAccount_Management;;
        "Lock user password" )
           read -p "enter username: " username
           sudo passwd -l  "$username"
           USerAccount_Management;;
        "Get information on user" )
            read -p "enter username: " username
            id "$username"
            UserAccount_Management;;
        "Add group" )
            read -p "enter group name: " groupname
            sudo groupadd "$groupname"
            UserAccount_Management;;
        "Delete group" )
            read -p "enter group name: " groupname
            sudo groupdel "$groupname"
            UserAccount_Management;;
        "Find user" )
            read -p "enter username: " username
            finger "$username"
            UserAccount_Management;;
        "Find group" )
            read -p "what group do you want me to find? " groupname
            grep "$groupname" /etc/group
            UserAccount_Management;;
        "Return to main menu" )
            main_Menu;;
        *)
            echo "Invalid Input"
            UserAccount_Management;;
        esac
    done
}

#Utilities
function utilities()
{
    echo
    
    echo "---------- Utilities ----------"

    select option in "Date/Time" "Calendar" "View Manual (man) Pages" "Determine File Type" "Determine Command Type" "Sort File" "Search file" "Return to Main Menu"
    do
        case $option in
            "Date/Time")
                echo
                date
                utilities;;
            "Calendar")
                echo
                cal
                utilities;;
            "View Manual (man) Pages")
                echo
                read -p "Enter command to view man page: " command
                man "$command"
                utilities;;
            "Determine File Type")
                echo
                read -p "Enter name of file (include file extension (i.e. .txt)): " file
                file -b "$file"
                utilities;;
            "Determine Command Type")
                echo
                read -p "Enter the command: " command
                type -t "$command"
                utilities;;
            "Sort File")
                echo
                read -p "Enter name of input file (include file extension (i.e. .txt)): " input
                read -p "Enter name of output file (include file extension): " output
                sort "$input" > "$output"
                cat "$output"
                utilities;;
            "Search file")
                echo
                read -p "Enter name of input file (include file extension (i.e. .txt)): " input
                read -p "Enter name of output file (include file extension): " output
                read -p "Enter search paramaters: " search
                
                grep "$search" "$input" > "$output"
                utilities;;
            "Return to Main Menu")
                echo
                main_Menu;;
            *)
                echo
                echo "Invalid Option"
                utilities;;
        esac
    done
}


main_Menu
