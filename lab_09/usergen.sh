#!/bin/bash

SHELL_LIST=$(cat /etc/shells | awk -F '/' '{ print $NF }' | sort | uniq);

read -p "Enter Username : " USERNAME

if [ -z $USERNAME ]; then
	echo "Please enter username"
	exit 1
fi

echo -n "Enter Password : " 
read -s PASSWORD
echo
echo -n "Confirm Password : "
read -s CPASSWORD
echo

if [ $PASSWORD != $CPASSWORD ]; then
	echo "Both Password doesn't match each other"
	exit 1
fi

# Set homepath for directory

read -p "Enter home directory path (default home will be /home) : " HOMEPATH

if [ -z $HOMEPATH ]; then
	HOMEPATH="/home"
else
	HOMEPATH="/$HOMEPATH"
fi

# Select default shell for user

echo "Available shells on this machine"
for s in $SHELL_LIST; do
	echo $s
done

read -p "Enter default shell for user : " SELECT_SHELL
printf "%s\0" "${SHELL_LIST[@]}" | grep -Fqx -- "$SELECT_SHELL"

if [[ $? != 0 ]]; then
	echo "Invalid shell selected"
	exit 1
fi

# Number of user to create

read -p "Enter number of user you want to create : " N_USER

if [ -z $N_USER ]; then
	N_USER=1
fi

if [ $N_USER -lt 0 ]; then
	echo "Number can't be negative"
	exit 1
fi

for (( i=1 ; i<=$N_USER ; i++ )); do
	INDEX=$(printf "%02d" $i)
	# Create User
	echo "${USERNAME}${INDEX}-s"
	# Change password
	echo "${USERNAME}:${PASSWORD}-x"
	# Create home for user
	echo "${HOMEPATH}/${USERNAME}${INDEX}-s"
	sudo chown ${USERNAME} "${HOMEPATH}/${USERNAME}${INDEX}-s"
	# Set default shell
	sudo usermod -s $(which ${SELECT_SHELL}) ${USERNAME}
done

