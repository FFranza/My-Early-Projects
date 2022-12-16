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
    echo "║                Secure that Computer ⌐■_■                  ║⠀⠀ ⠀⠈⢿⣷⠀⠀⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢇⠈⣷⠀⠈⢦⡈⢳⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣦⡀"⠀⠀
    echo "═════════════════════════════════════════════════════════════⠀ ⢀⣤⣶⡿⠀⠀⠀⠀⡼⠇⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣆⠈⢣⡘⡆⠀⠀⠙⡆⡙⢆⠀⠀⠀⠀⠈⠩⢍⡉⠉⠓"⠀⠀
    echo "║                                                           ║ ⣠⣿⠿⡿⠁⠀⠀⠀⣰⠁⠀⢰⠻⣄⡀⠀⠀⠀⠀⠀⣸⡇⢀⣿⠁⠀⠀⠙⣿⠀⠀⠀⢱⠐⠀⠳⣄⠀⠐⠒⠒⠂⠠⠔⠂"⠀⠀
    echo "║                                                           ║ ⠉⠀⡼⢁⠆⡆⠀⡴⠋⠀⣷⠏⠉⠹⡷⡄⢀⠀⠀⢀⠏⣇⣜⡇⠀⠀⣀⣀⣸⡆⠀⠀⢸⣾⠀⢺⣄⠙⢦⣀⣀⠀⠀⢢"⠀⠀⠀
    echo "║       [1] Packages                  [3] Firewall          ║⠀ ⠈⠀⣜⡼⣡⣾⠀⢺⠀⡏⠀⠀⠀⠁⠈⢺⣧⠀⢸⢀⡿⠙⠡⣴⣿⣿⣿⡟⡿⠁⠀⠀⣷⡇⢸⢿⠀⠀⠻⡍⠙⠷⢀⠃"⠀⠀
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
            while [ "$user_response_to_MainAPG_menu" != "3" ] # Sets variable to exit while statement to return to the main menu or inputs a invalid option and loops option
            do
                clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║             Welcome to the APG install Menu               ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║      [1][APGINSTALL]                 [2][APGREMOVE]       ║"
                echo "║                        [3][ExitAPG]                       ║"
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
                        apt install update && apt upgrade
                        echo ""
                        echo -e "${GREENCOLOR}║    Updates and Upgrade have been fully implemented   ║${NOCOLOR}"
                        echo -e "${YELLOWCOLOR}║ Would you like to install additional security tools? ║${NOCOLOR}"
                        echo -e "${YELLOWCOLOR}║            Yes                       No              ║${NOCOLOR}"    
                        read user_response_to_APGInstall_menu # Reads case statement for sub APG choice

                            case $user_response_to_APGInstall_menu in # Case statement for installing or not installing security packages

                                Y) # Install Additional Security Tools
                                clear
                                echo -e "${REDCOLOR}║ Security Updates are now being installed, please wait for a moment ║${NOCOLOR}"
                                echo ""
                                apt install ufw && echo "${GREENCOLOR}║   Firewall has been installed   ║${NOCOLOR}" && apt install libpam-pwquality && echo "${GREENCOLOR}║   PWQuality has been installed   ║${NOCOLOR}" && apt install auditd && echo "${GREENCOLOR}║   Daemon has been installed   ║${NOCOLOR}"
                                echo ""
                                echo -e " ${GREENCOLOR}║   Updates and Upgrade have been fully implemented   ║${NOCOLOR}"
                                echo ""
                                echo -e "${YELLOWCOLOR}║ Press Enter to leave this menu ║${NOCOLOR}"
                                read;;

                                N) # Not cause you don't have time
                                clear
                                echo -e "${YELLOWCOLOR}║ Press Enter to leave this menu ║${NOCOLOR}"
                                read;;

                                *) # Invalid Option
                                clear
                                echo -e "${REDCOLOR}║ Invalid Option, press enter to leave the menu ║${NOCOLOR}"
                                read;;
                            esac
                        echo -e "${YELLOWCOLOR}║ Press Enter to leave this menu ║${NOCOLOR}"
                        read;;

                        2) # Remove Samba related 
                        clear
                        echo -e "${REDCOLOR}║ Removing all Samba related files, please wait for a moment ║${NOCOLOR}"
                        echo ""
                        apt-get remove .*samba.* .*smb.*
                        echo ""
                        echo -e "${GREENCOLOR}║ All Samba files have been removed ║${NOCOLOR}" 
                        echo ""
                        echo -e "${YELLOWCOLOR}║ Press enter to levae this menu ║${NOCOLOR}"
                        read;;
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
                echo "║                                                           ║"
                echo " $(grep "PASS_MIN_DAYS" /etc/login.defs | cut -d " " -f 2) "
                echo "║                                                           ║"
                echo " $(grep "PASS_MAX_DAYS" /etc/login.defs | cut -d " " -f 2) "
                echo "║                                                           ║"
                echo " $(grep "PASS_WARN_DAYS" /etc/login.defs | cut -d " " -f 2)"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                 [Current PAM Settings]                    ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo " $(grep "minlen" /etc/login.defs | cut -d "=" -f 2)        "
                echo "║                                                           ║"
                echo " $(grep "dcredit" /etc/login.defs | cut -d "=" -f 2)       "
                echo "║                                                           ║"
                echo " $(grep "ucredit" /etc/login.defs | cut -d "=" -f 2)       "
                echo "║                                                           ║"
                echo " $(grep "ocredit" /etc/login.defs | cut -d "=" -f 2)       "
                echo "║                                                           ║"
                echo " $(grep "lcredit" /etc/login.defs | cut -d "=" -f 2)       "
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                
                
                # Read input from user and store it in the RPAP variable
                
                read user_response_to_PassPol
                
                if [ "$user_response_to_PassPol" = "1" ]; then

                    # Set password policy parameters
                    password_min_age=10
                    password_max_age=90
                    password_warn_age=7
                    pam_pwquality_try_first_pass
                    pam_pwquality_minlen=16
                    pam_pwquality_dcredit=-1
                    pam_pwquality_ucredit=-1
                    pam_pwquality_ocredit=-1
                    pam_pwquality_lcredit=-1 
                    
                    # Get list of all users on the system
                    users=$(cut -d: -f1 /etc/passwd)
                    
                    # Configure password policy for each user
                    echo -e "${REDCOLOR}║ Setting password policy for the system, please wait ║${NOCOLOR}"
                    sed -i "s/PASS_MAX_DAYS.*$/PASS_MAX_DAYS=$password_max_age/" /etc/login.defs
                    sed -i "s/PASS_MIN_DAYS.*$/PASS_MIN_DAYS=$password_min_age/" /etc/login.defs
                    sed -i "s/PASS_WARN_AGE.*$/PASS_WARN_AGE=$password_warn_age/" /etc/login.defs
                    sed -i '/pam_pwquality.so/ s/$/ try_first_pass/' /etc/pam.d/system-auth
                    sed -i "s/\(pam_pwquality\.so.*\)\(minlen=[0-9]\+\)/\1 minlen=$pam_pwquality_minlen/" /etc/pam.d/common-password
                    sed -i "s/\(pam_pwquality\.so.*\)\(dcredit=[-0-9]\+\)/\1 dcredit=$pam_pwquality_dcredit/" /etc/pam.d/common-password
                    sed -i "s/\(pam_pwquality\.so.*\)\(ucredit=[-0-9]\+\)/\1 ucredit=$pam_pwquality_ucredit/" /etc/pam.d/common-password
                    sed -i "s/\(pam_pwquality\.so.*\)\(ocredit=[-0-9]\+\)/\1 ocredit=$pam_pwquality_ocredit/" /etc/pam.d/common-password
                    sed -i "s/\(pam_pwquality\.so.*\)\(lcredit=[-0-9]\+\)/\1 lcredit=$pam_pwquality_lcredit/" /etc/pam.d/common-password                        
                    echo -e "${GREENCOLOR}║ Password policy set successfully for user ║${NOCOLOR}"
                fi
            done
            user_response_to_PassPol="dwajndwdsacoejrnqsdwq"
            ;;

        3) # Display Firewall
            clear
            echo "═════════════════════════════════════════════════════════════" 
            echo "║                  Please select an option                  ║"
            echo "═════════════════════════════════════════════════════════════"
            read;;

        4) # Display User Configuration
            while [ "$user_response_to_user_management" != "ExitUSR" ]
            do 
            clear
                echo "═════════════════════════════════════════════════════════════" 
                echo "║              Welcome to the USR Config Menu               ║"
                echo "═════════════════════════════════════════════════════════════"
                echo "║                                                           ║"
                echo "║     [1] Create New Users           [2] Remove Users       ║"
                echo "║                                                           ║"
                echo "║ [3] Disabling Guest User        [4] +/- Users From Group  ║"
                echo "║                                                           ║"
                echo "║    [5] Lock Root User                                     ║"
                echo "║                                                           ║"
                echo "║                         [ExitUSR]                         ║"
                echo "║                                                           ║"
                echo "═════════════════════════════════════════════════════════════"
                read USRANSWR

                case $USRANSWR in

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
                    echo "Hello4"
                    read;;

                    3) # Disable Guest User
                    clear
                    echo "Hello5"
                    read;;

                    4) # Add or Remove New Users from group
                    clear
                    echo "Hello6"
                    read;;
                esac
            done
            USRANSWR="SADNiacxzcwqieuasd" # Variable reset to reset script from main USR Menu
            ;;
        
        EXM)
        clear
        echo -e "${GREENCOLOR}Thank you for using my Security Script ʕっ•ᴥ•ʔっ${NOCOLOR}"
        echo -e "${GREENCOLOR}-FF"
        exit
        ;;
    esac

done

#_________________CAPTURE THE FLAG BABY___________________#
echo " (_)"
echo "<___>"
echo " | |______"
echo " | |      )"
echo " | |      (_________"
echo " | |      |         )"
echo " | |      |         (________________"
echo " | |      |          |              |"
echo " | |      |          |              |"
echo " | |      |          |              |"
echo " | |      |          |              |"
echo " | |      |          |              |"
echo " | |~~~~~~|          |              |"
echo " | |      |          |              |"
echo " | |      '~~~~~~~~~~|              |" 
echo " | |                 |              |"
echo " | |                 '~~~~~~~~~~~~~~|"
echo " | |                                '"
echo " | |"
echo " | |"
echo " | |"
echo " | |"
echo "  - "
#!/bin/bash

# Set the directory to search
dir="/path/to/directory"

# Set the list of hazardous file types
hazardous_types=(".exe" ".bat" ".com" ".vbs" ".cmd" ".scr" ".pif" ".lnk")

# Iterate over each file in the directory
for file in "$dir"/*; do
  # Get the file extension
  extension="${file##*.}"
  
  # Check if the file extension is in the list of hazardous types
  if [[ " ${hazardous_types[@]} " =~ " ${extension} " ]]; then
    # Remove the file if it is hazardous
    rm "$file"
  fi
done
