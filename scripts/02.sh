#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'
YELLOW='\033[0;33m'

read -p 'Type a user :' Userk

while [ ! $(cat "/etc/passwd" | grep "^$Userk" | grep "home" | awk -F ':' '{print $1}') >/dev/null 2>&1 ]
do
	read -p 'Type a real user or "exit":' Userk
	if [ $Userk = "exit" ] || [ $Userk = "EXIT" ]
	then
		printf "See you soon! ^-^\n"
		exit 0
	fi
done

YN='ss'
while [ $YN != "Y" ] && [ $YN != "y" ] && [ $YN != "N" ] && [ $YN != "n" ]
do
	printf "$RED Are you sure to delete $Userk ?!$WHITE [Y/N]"
	read YN
done

if [ $YN = "Y" ] || [ $YN = "y" ]
then
	printf "\n~~$GREEN It's happening now ^-^!~~$WHITE \n"
	if [ $(killall -u $Userk) >/dev/null 2>&1 ]
	then
		printf "PIDs killed\n...\n"
	fi

	if [ $(sudo crontab -ru $Userk) >/dev/null 2>&1 ]
	then
		printf "Crons deleted!\n"
	fi

	if [ $(sudo userdel -rf $Userk) >/dev/null 2>&1 ]
	then
		printf "USER deleted!\n"
	fi
else
	if [ $YN = "N" ] || [ $YN = "n" ]
	then
		printf "OK...!"
	fi
fi
