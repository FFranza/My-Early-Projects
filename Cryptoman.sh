#!/bin/bash
clear
echo "Hello and welcome to Cryptoman, please enter the encrypted value" 
echo "Note: a temporary text file is created for reading arrays and allowing for longer strings to be read"
read cr_user_value # This reads user input, then clears, and continue to the next menu
echo $cr_user_value > /tmp/cryptomantempfile.txt
readarray cr_uservalue_array < /tmp/cryptomantempfile.txt
clear
echo "Select Option for decryption"
echo "[1] ROT13 Cipher"
echo "[2] Base64"
echo "[3] Modular Cryptography"
read cr_usermenu_select
case $cr_usermenu_select in
    1)  
      echo $cr_uservalue_array | tr 'N-ZA-Mn-za-m''A-Za-z'
      rm -f /tmp/cryptomantempfile.txt
       exit
       ;;
    
    2) echo $cr_uservalue_array | base64 -d
       rm -f /tmp/cryptomantempfile.txt
       exit
       ;;
    
    3) echo "Welcome to the modular menu"
       echo "Enter the modular number
       read cr_user_modulo
       echo "Will this be inverse?"
       echo "[1] Yes"
       echo "[2] No"
       read cr_user_inverse_or_not
       if [ "$cr_user_inverse_or_not = "2" ]
         then modular_value=$(($cr_uservalue_array%$cr_user_modulo))
         else 

esac
