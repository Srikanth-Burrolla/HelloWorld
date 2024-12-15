#!/bin/bash
read -p "Please enter The valid User Name:" USER_NAME
echo $USER_NAME
if [ -z "$USER_NAME" ]; then
    echo "Its Not a valid User $USER_NAME"
else
    echo "The Username is $USER_NAME"
    EX_USER=$(cat /etc/passwd | cut -d ":" -f 1 | grep -w $USER_NAME)
    if [ "$USER_NAME" = "EX_USER" ]; then
	    echo "User $USER_NAME Exists. Please Select a Different Username.."
	else
        echo "Lets Creat User $USER_NAME"
		#read -s -p "Please Enter The Password:" Password
		SPEC=$(echo '@$%^&*_' | fold -w1 | shuf | head -1)
		PASSWORD="India@${RANDOM}${SPEC}"
		echo $PASSWORD
		useradd -m $USER_NAME
		echo "$USER_NAME:$PASSWORD" | sudo chpasswd
		passwd -e "${USER_NAME}"
    fi
fi
