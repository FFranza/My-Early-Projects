#!/bin/bash

# Sudo is required for this script to run, if the script is not runned with sudo it will run a exit command
# Table of Contents for Configuration #
# Line 89 for Security Tools using apt command (Comment: May want to add extra tools specificed on the read me)
# Line 114 for Remvoing Samba Related Files (Comment: Use Wildcards to remove extra files, may want to add apt autoremove for unneeded packages)
# Line 170 - 177 for Password Policy through PAM config (Comment: Edit the Variables on those lines then run command)

# Use $ and open curved brackets to use these colors, use line 11 as an example
REDCOLOR='\033[1;31m'
GREENCOLOR='\033[1;32m'
YELLOWCOLOR='\033[1;33m'
NOCOLOR='\033[0m'
if [ "$EUID" != "0" ]
    then clear && echo -e "${REDCOLOR}How the hell did you even get here? Run the script with sudo dumb dumb 𓃰"
    exit
fi

###########################################################################
# Main Script                                                             #
###########################################################################



while [ "$user_response_to_main_menu" != "FDWA" ] # This while while statement allows the script to run a loop when returning from sub menues
do
    clear
    echo "                                                             ⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⢤⡈⢦⡈⠙⠢⣀⠀⠀⠀⣠⣴⣾⡇"⠀⠀⠀⠀⠀⠀
    echo "                                                             ⠀⠀ ⠀⠀⠀⠀⠀⠀⢀⣴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢆⠀⠀⠀⠐⡝⢄⠙⢄⠀⠈⠢⡀⣼⣿⡃⢘⣿"⠀⠀⠀⠀⠀⠀# Astolfo
    echo "                                                             ⠀ ⠀⣾⡳⠶⣤⣀⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠈⡄⠙⠪⣳⠀⠀⠹⣿⣿⣿⣿⣿"⠀⠀⠀⠀⠀⠀# Bulge Bulge
    echo "                                                             ⠀ ⠀⢸⣧⣴⣿⢿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⡄⢳⡄⠀⠀⠘⣆⠀⠀⠑⢄⠀⢸⣿⣿⣿⡟"⠀⠀⠀⠀⠀⠀
    echo "═════════════════════════════════════════════════════════════⠀⠀ ⠀⢿⣿⡟⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠀⢹⡀⢻⡀⠀⠀⠘⢦⠀⠀⠀⠳⣼⣿⣿⣿⣧⣄"⠀⠀⠀⠀⠀ 
    echo "║                Secure that Computer ʕง•ᴥ•ʔง               ║⠀⠀ ⠀⠈⢿⣷⠀⠀⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢇⠈⣷⠀⠈⢦⡈⢳⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣦⡀"⠀⠀
    echo "═════════════════════════════════════════════════════════════⠀ ⢀⣤⣶⡿⠀⠀⠀⠀⡼⠇⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣆⠈⢣⡘⡆⠀⠀⠙⡆⡙⢆⠀⠀⠀⠀⠈⠩⢍⡉⠉⠓"⠀⠀
    echo "║                                                           ║ ⣠⣿⠿⡿⠁⠀⠀⠀⣰⠁⠀⢰⠻⣄⡀⠀⠀⠀⠀⠀⣸⡇⢀⣿⠁⠀⠀⠙⣿⠀⠀⠀⢱⠐⠀⠳⣄⠀⠐⠒⠒⠂⠠⠔⠂"⠀⠀
    echo "║                                                           ║ ⠉⠀⡼⢁⠆⡆⠀⡴⠋⠀⣷⠏⠉⠹⡷⡄⢀⠀⠀⢀⠏⣇⣜⡇⠀⠀⣀⣀⣸⡆⠀⠀⢸⣾⠀⢺⣄⠙⢦⣀⣀⠀⠀⢢"⠀⠀⠀
    echo "║       [1] Package Management        [3] Firewall          ║⠀ ⠈⠀⣜⡼⣡⣾⠀⢺⠀⡏⠀⠀⠀⠁⠈⢺⣧⠀⢸⢀⡿⠙⠡⣴⣿⣿⣿⡟⡿⠁⠀⠀⣷⡇⢸⢿⠀⠀⠻⡍⠙⠷⢀⠃"⠀⠀
    echo "║                                                           ║⠠⠀⠀⠀⠨⠀⡇⢸⠀⠘⡄⣇⣠⣴⣶⣶⣿⣄⡘⢷⣼⡖⠃⠀⠘⠉⠿⠛⠛⠁⠁⠀⠀⠀⣿⣷⠈⣯⠀⠀⠀⡌⢆⠀⠀⠁"⠀⠀
    echo "║                                                           ║⠀⠀⠀⠀⠀⠀⠃⢸⡆⠀⢹⣿⡿⠁⠙⠿⠟⠛⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⢠⡀⢠⠁⠀⣿⣩⣧⢻⠣⡀⠀⢱⠀⡧"⠀⠀⠀⠀
    echo "║                                                           ║⠀⠀⠀⠀⠀⠀⠀⡏⢣⠀⢸⣹⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡼⠀⣼⣿⠁⠈⢫⣇⣹⣷⡦⣷⡖⠤⣄"⠀⠀
    echo "║       [2] PassPol                   [4] User              ║⠀⠀⠀⠀⠀⠀⣾⡇⠈⡆⢸⠟⠋⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⢹⡇⢠⣿⠛⡀⠀⠈⣿⣿⠈⠒⠺⣽⢷⣄⣳⡀"
    echo "║                                                           ║⠀⠀⠀⠀⠀⠀⠈⢳⠀⢸⣏⠀⠐⣿⣆⠀⠀⠀⠀⠀⢀⣀⡤⠄⠀⠀⢀⠀⠈⠀⡿⠀⣼⡇⢀⣿⣄⣇⢻⢿⣳⠀⠀⠘⣆⠀⢻⡇"
    echo "║                                                           ║⠀⠀⠀⠀⢀⡠⢚⣿⣆⡞⢿⡀⠀⠉⠛⠳⢄⡀⠀⠀⠘⠿⢀⣀⡀⠤⠊⠀⢀⣼⠃⢰⣿⠀⣾⣿⣌⣿⡾⠀⠙⢳⡀⠀⠈⣆⠀⠇"
    echo "║                    [EXM] Exit Script                      ║⠀⠀⠀⡰⠋⡠⠋⢀⡟⢹⠀⢿⠒⣤⡀⠀⠀⠈⠑⠒⠤⢄⠀⠀⠀⠀⣠⡶⢛⡏⢠⣿⢻⡾⠃⠈⡟⢿⠃⢀⢱⡀⢧⠀⠀⠘⡆"⠀
    echo "═════════════════════════════════════════════════════════════⠀⠀⢰⢃⡎⠀⠀⠀⢳⠈⡇⠈⢣⡸⡉⢦⣀⠀⠀⠀⠀⠀⠑⣦⣴⣿⡿⠁⣼⡴⠋⠏⣼⡇⠀⠀⢳⢸⣧⠸⠀⠳⣼⡆⠀⠀⡟"⠀
    echo "║                  Please select an option                  ║⠀⠀⠸⠀⠱⡄⠀⠀⠈⣇⢹⡀⠀⣿⣽⣄⣿⢷⡄⠀⠀⠀⠀⣿⣿⠏⠀⣰⠏⠀⠀⠘⢁⠇⠀⠀⢸⠄⢻⣦⡇⠀⡟⢳⠀⠸⠁"⠀
    echo "═════════════════════════════════════════════════════════════⠀⠀⠀⠀⠀⠘⢆⠀⠀⠘⡄⢧⠀⢸⣦⠉⢻⡏⠀⠀⠀⠀⢰⡿⡏⠀⠐⠁⠀⠀⠀⠀⢸⠀⠀⠀⡼⠀⢘⣿⠁⠠⠀⡎⣰⠂"⠀⠀

    read user_response_to_main_menu # Variable is read to respond to case menu running after echo script clearing previous menu after user input
    clear

    ###########################################################################
    # Main Case                                                               #
    ###########################################################################

    case $user_response_to_main_menu in

        1) # Display Apt Packages
            while [ "$user_response_to_MainAPG_menu" != "6" ] # Sets variable to exit while statement to return to the main menu or inputs a invalid option and loops option
            do
                clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║          Welcome to the Package Management Menu           ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║    [1] Install Updates               [2] Remove .smb      ║"
                echo "║                                                           ║"
                echo "║    [3] Install Security Tools        [4] Remove Mp3 Files ║"
                echo "║                                                           ║"
                echo "║    [5] Remove Hacking Tools          [6] Exit             ║"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║        These are the current packages installed           ║"
                echo "═════════════════════════════════════════════════════════════"
                read user_response_to_MainAPG_menu
                
                case $user_response_to_MainAPG_menu in

                        1) # Install all needed and security updates
                        clear
                        echo -e "${REDCOLOR}║ Updates are now being installed, please wait for a moment ║${NOCOLOR}"
                        echo ""
                        apt-get update && apt-get upgrade && apt-get dist-upgrade
                        echo ""
                        echo -e "${GREENCOLOR}║    Updates and Upgrade have been fully implemented   ║${NOCOLOR}"  
                        read;;

                        2) # Install Additional Security Tools
                        clear
                        echo -e "${REDCOLOR}║ Security Updates are now being installed, please wait for a moment ║${NOCOLOR}"
                        echo ""
                        apt-get install ufw && echo -e "${GREENCOLOR}║   Firewall has been installed   ║${NOCOLOR}" && apt-get install libpam-cracklib && echo -e "${GREENCOLOR}║   Cracklib has been installed   ║${NOCOLOR}" && apt-get install auditd && echo -e "${GREENCOLOR}║   Daemon has been installed   ║${NOCOLOR}" && apt-get install chkrootkit && echo -e "${GREENCOLOR}║   chkrootkit has been installed   ║${NOCOLOR}" && apt-get install rkhunter && echo -e "${GREENCOLOR}║   rkhunter has been installed   ║${NOCOLOR}" && apt-get install fail2ban && echo -e "${GREENCOLOR}║   Fail2Ban has been installed   ║${NOCOLOR}" && ufw enable && auditctl -e 1 && chkrootkit && rkhunter --update && rkhunter --check  
                        echo ""
                        echo -e " ${GREENCOLOR}║   Updates and Upgrade have been fully implemented   ║${NOCOLOR}"
                        echo ""
                        echo -e "${YELLOWCOLOR}║ Press Enter to leave this menu ║${NOCOLOR}"
                        read;;

                        3) # Remove Samba related 
                        clear
                        echo -e "${REDCOLOR}║ Removing all Samba related files, please wait for a moment ║${NOCOLOR}"
                        echo ""
                        apt-get remove .*samba.* .*smb.*
                        echo ""
                        echo -e "${GREENCOLOR}║ All Samba files have been removed ║${NOCOLOR}" 
                        echo ""
                        echo -e "${YELLOWCOLOR}║ Press enter to levae this menu ║${NOCOLOR}"
                        read;;

                        4) # Remove mp3 files
                        clear
                        echo -e "${REDCOLOR}║ Removing all Samba related files, please wait for a moment ║${NOCOLOR}"
                        find /home/ -type f \( -name "*.mp3" -o -name "*.mp4" \)
                        echo ""
                        echo -e "${GREENCOLOR}║ All Samba files have been removed ║${NOCOLOR}"
                        echo ""
                        echo -e "${YELLOWCOLOR}║ Press enter to levae this menu ║${NOCOLOR}"
                        read;;

                        5) # Remove hacking tools
                        clear
                        echo -e "${REDCOLOR}║ Removing all Samba related files, please wait for a moment ║${NOCOLOR}"
                        find /home/ -type f \( "*.tar.gz" -o -name "*.tgz" -o -name "*.zip" -o -name "*.deb" \)
                        echo ""
                        echo -e "${GREENCOLOR}║ All Samba files have been removed ║${NOCOLOR}"
                        echo ""
                        echo -e "${YELLOWCOLOR}║ Press enter to levae this menu ║${NOCOLOR}"
                esac
            done
            user_response_to_MainAPG_menu="ADIasdwkandias" # SET THIS FOR EVERY CASE TO RESET VARIABLE PLEASE DO NOT FORGET TO RESET YOUR VARIABLE YOU SEE THIS I KNOW YOU DO
            ;;
        
        2) # Display Password Policy
            while [ "$user_response_to_PassPol" != "2" ] # Allows user to loop this section until certain word is ran to exit this section and return to main menu
            do
                clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║           Welcome to the Password Policy Menu             ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║   [1] Run Password Policy          [2] Exit Menu          ║"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║               [Current Policies Settings]                 ║"
                echo "═════════════════════════════════════════════════════════════"              
                # Read input from user and store it in the RPAP variable
                
                read user_response_to_PassPol
                
                if [ "$user_response_to_PassPol" = "1" ]; then
                    
                    # Configure password policy for each user
                    echo -e "${REDCOLOR}║ Setting password policy for the system, please wait ║${NOCOLOR}"
                    sed -i 's/PASS_MAX_DAYS.*$/PASS_MAX_DAYS 90/;s/PASS_MIN_DAYS.*$/PASS_MIN_DAYS 10/;s/PASS_WARN_AGE.*$/PASS_WARN_AGE 7/' /etc/login.defs
                    sed -i 's/\(pam_unix\.so.*\)$/\1 remember=5 minlen=8/' /etc/pam.d/common-password
                    sed -i 's/\(pam_cracklib\.so.*\)$/\1 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/common-password
                    echo -e "${GREENCOLOR}║ Password policy set successfully for users ║${NOCOLOR}"
                    read
                fi
            done
            user_response_to_PassPol="dwajndwdsacoejrnqsdwq"
            ;;

        3) # Display Firewall
            while [ "$user_response_to_firewall" != "4" ]
            do 
                clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║           Welcome to the Firewall Config Menu             ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║   [1] Block All Traffic      [2] Allow SSH Port 22        ║"
                echo "║                                                           ║"
                echo "║   [3] Log Dropped Packets    [4] Exit                     ║"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                read user_response_to_main_firewall_menu

                case $user_response_to_main_firewall_menu in

                    1) # Blocks all incoming Traffic to ensure no traffic should go into the firewall
                    clear
                    echo -e "${YELLOWCOLOR}║ Denying all incoming traffic ║${NOCOLOR}"
                    ufw default deny incoming
                    echo -e "${GREENCOLOR} ║       All Traffic has been denied     ║${NOCOLOR}"
                    echo ""
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;; 

                    2) # Allows SSH traffic on port 22
                    clear
                    echo -e "${YELLOWCOLOR}║ Allowing SSH traffic on port 22 ║${NOCOLOR}"
                    ufw allow 22/tcp
                    echo -e "${GREENCOLOR} ║ SSH Traffic is now allowed on port 22 ║${NOCOLOR}"
                    echo ""
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;;

                    3) # It logs all dropped packets
                    clear
                    echo -e "${YELLOWCOLOR}║ Allowing SSH traffic on port 22 ║${NOCOLOR}"
                    ufw logging on
                    echo -e "${GREENCOLOR} ║ SSH Traffic is now allowed on port 22 ║${NOCOLOR}"
                    echo ""                   
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;;
            done
            user_response_to_firewall="saudnawkdnaskdnaisncxiASNDikasd"
            ;;

        4) # Display User Configuration
            while [ "$user_response_to_user_management" != "6" ]
            do 
            clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║              Welcome to the USR Config Menu               ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║     [1] Create New Users           [2] Remove Users       ║"
                echo "║                                                           ║"
                echo "║ [3] Disabling Guest User           [4] Lock Root User     ║"
                echo "║                                                           ║"
                echo "║ [6] Add a User into                [6] Exit               ║"
                echo "║     into Sudo Group                                       ║"
                echo "║                                                           ║"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║            These are all the users currently              ║"
                echo "═════════════════════════════════════════════════════════════"
                awk -F: ' { print $1}' /etc/passwd
                read user_response_to_user_management

                case $user_response_to_user_management in

                    1) # Create New Users
                    clear
                    echo -e "${YELLOWCOLOR}║ Please enter a username ║${NOCOLOR}" # Prompt for username
                    read username
                    if id "$username" >/dev/null 2>&1; then
                        echo -e "${REDCOLOR}║ User $username already exists ║${NOCOLOR}"
                    fi
                    echo -e "${YELLOWCOLOR}║ Please enter a password ║${NOCOLOR}"
                    read -s password
                    echo

                    useradd -m "$username"

                    echo "$username:$password" | chpasswd

                    echo -e "${GREENCOLOR}║ User $username created succesfully ║${NOCOLOR}"
                    read;;

                    2) # Remove Users
                    clear
                    whitelist_file="/home/$USER/Desktop/whitelist.txt" # Configure file path when command is ran
                    readarray -t whitelist < "$whitelist_file"
                    echo -e "${YELLOWCOLOR}║ Usernames in the whitelist are now being read ║${NOCOLOR}"
                    for user in $(awk -F: ' { print $1}' /etc/passwd); do
                        if '[[ " ${whitelist[@]} " =~ " ${user} "]]'; then
                        continue
                    fi
                    userdel "$user"
                    done
                    echo -e "${GREENCOLOR}║ Users not in the white list have now been deleted ║${NOCOLOR}"
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;;
                
                    3) # Disable Guest User
                    clear
                    echo -e "${YELLOWCOLOR}║ Removing Guest Account ║${NOCOLOR}" # Check this line to change if module is different
                    sed -i 's/allow-guest=true/allow-guest=false/g' /etc/gdm3/gdm.conf
                    echo -e "${GREENCOLOR} ║     Guest Account has been removed    ║${NOCOLOR}"
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;;

                    4) # Lock Root User
                    clear
                    echo -e "${YELLOWCOLOR}║ Locking Root Account ║${NOCOLOR}"
                    passwd -l root
                    echo -e "${GREENCOLOR} ║          Root account locked          ║${NOCOLOR}"
                    echo -e "${YELLOWCOLOR}║ Please press enter to leave this menu ║${NOCOLOR}"
                    read;;

                    5) # Add a user to the sudo group
                    clear
                    echo -e "${YELLOWCOLOR}║ Please enter a Username: ║${NOCOLOR}"
                    read Username
                    echo ""
                    usermod -aG sudo $Username
                    echo -e "${GREENCOLOR} ║ $Username has been added to the sudo group ║${NOCOLOR}"
                    echo -e "${YELLOWCOLOR}║   Please press enter to leave this menu    ║${NOCOLOR}"

                esac
            done
            user_response_to_user_management="SADNiacxzcwqieuasd" # Variable reset to reset script from main USR Menu
            ;;
        
        EXM)
        clear
        echo -e "${GREENCOLOR}Thank you for using my Security Script ʕっ•ᴥ•ʔっ${NOCOLOR}"
        echo -e "${GREENCOLOR}-FF"
        exit
        ;;
    esac

done
