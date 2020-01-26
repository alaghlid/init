#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'
YELLOW='\033[0;33m'

re() {
	printf "\n>>>>>>>> Press RETURN key to continue...\n"
	read RETURN
	clear
}

clear
printf "\n\t                    $GREEN *    **   **   ******     **   **     *******                        \n"
printf "\n\t                   $GREEN ***    ** **   **    **    **   **     **   **                        \n"
printf "\n\t                  $GREEN *****    ***    **    **    **   **     *****                          \n"
printf "\n\t                 $GREEN **   **   ***    **    **    **   **     **   **                        \n"
printf "\n\t                $GREEN **     **  ***     ******     *******     *******                        \n"
while :
do
	printf "\n\n\t$WHITE **************** 1) $GREEN Connect with service ssh                $WHITE ****************\n"
	printf "\t$WHITE **************** 2) $GREEN Copy files/folders to another machine   $WHITE ****************\n"
	printf "\t$WHITE **************** 3) $GREEN Send an email                           $WHITE ****************\n"
    printf "\t$WHITE **************** 4) $GREEN Multiplication table of a number        $WHITE ****************\n"
	printf "\t$WHITE **************** 5) $GREEN Exit                                    $WHITE ****************\n\t\t\t"
	while :
	do
		printf "\n>>>>>>>>>>> Type your choice :"
		read CHOICE
		case $CHOICE in
			1)
				read -p "Type the hostname : " HOSTNAME
				read -p "Type the ip address : " IP
				eval ssh $HOSTNAME@$IP
				re
				break
				;;
			2)
				read -p "Type the name of the file/folder you want to copy :   " folder
				read -p "Type the hostname : " Hostname
				read -p "Type the ip address : " Ip
				read -p "Type the path of the destination : " Path
				eval rm -rf ~/.ssh/known_hosts
				eval scp -r $folder $Hostname@$Ip:$Path
				re
				break
				;;
			3)
				printf "Please type a real adress !\n"
				read -p "Type the adress email to : " TO
				read -p "Type the subject : " SUBJECT
				read -p "Type the body (Just in one line !) : " BODY
				eval mail -s ${SUBJECT} ${TO} <<< ${BODY}
				printf "Done ^-^!"
				re
				break
				;;
            4)
				while [ -z $N ]; do
				read -p 'Type a numbre: ' N
				done
				if [ $N -eq 0 ]
				then
					printf "$RED It's NULL 0!$WHITE"
				elif [ $N -lt 0 ]
				then
					printf "$RED It's a negative number!$WHITE"
				else
					printf "\n\033[0;34mMultiplication table of $WHITE $N :"
					for i in `seq 1 10`;
					do
						multi=1
						let multi=$N*i
						printf "\n$RED $N  $YELLOW x  $GREEN $i  $YELLOW =  $WHITE $multi"
					done
				fi
				N=' '
                re
                break
                ;;
			5)
				printf "\n\t\tSee you soon!\n"
				exit
				;;
			*)
				printf "\nChoose a number between 1 and 5  :   "
				;;
		esac
	done
done
