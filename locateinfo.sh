#!/bin/bash

txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtblu=$(tput setaf 4)
txtpur=$(tput setaf 5)
txtcyn=$(tput setaf 6)
txtrst=$(tput sgr0)
COLUMNS=$(tput cols)

center() {
	w=$(( $COLUMNS / 2 - 20 ))
	while IFS= read -r line
	do
		printf "%${w}s %s\n" ' ' "$line"
	done
}

centerwide() {
	w=$(( $COLUMNS / 2 - 30 ))
	while IFS= read -r line
	do
		printf "%${w}s %s\n" ' ' "$line"
	done
}

while :
do

clear

echo ""
echo ""
echo "${txtcyn}(please enter the number of your selection below)${txtrst}" | centerwide
echo ""
echo "1.  Find text within a file" | center
echo "2.  Show information about a user account" | center
echo "3.  List the contents of a directory" | center
echo "4.  Bring up the man pages for a command" | center
echo "5.  ${txtpur}Return to Main Menu${txtrst}" | center
echo "6.  ${txtred}Shut down${txtrst}" | center
echo ""

read locatemenuchoice
case $locatemenuchoice in

1 )
	clear && echo "" && echo "Which file would you like to search? ${txtcyn}(FULL PATH!)${txtrst}" | centerwide && echo ""
	read filetosearch
	echo "" && echo "Please enter your search term below:" | center && echo ""
	read keyword
	echo "" && echo ""
	cat $filetosearch | grep "$keyword" || echo "${txtred}Search failed. Please check your filename/path and search term(s) and try again.${txtrst}" | centerwide
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read	
;;

2 )
	clear && echo "" && echo "Which user's information would you like to view? ${txtcyn}(enter the USERNAME below)${txtrst}" | centerwide && echo ""
	read infousername
	echo "" && cat /etc/passwd | grep $infousername || echo "${txtred}User not found. Please check the username and try again.${txtrst}" | centerwide
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

3 )
	clear && echo "" && echo "Please enter the full path of the directory you wish to see the contents of below:" | centerwide && echo ""
	read lspath
	clear
	ls -la $lspath || echo "${txtred}Directory not found. Please check path and try again.${txtrst}" | centerwide
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center
	read
;;

4 )
	clear && echo "" && echo "Please enter the command you wish to see the man pages for:" | centerwide && echo ""
	read mancommand
	clear && echo "" && echo "${txtcyn}(press ENTER to scroll, press Q to return to menu)${txtrst}" | centerwide && read
	man $mancommand || echo "${txtred}Man page not found. Check your command and try again.${txtrst}" | centerwide && echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

5 )
	clear && echo "" && echo "Are you sure you want to return to the main menu? ${txtcyn}y/n${txtrst}" | centerwide && echo ""
	read exitays
	case $exitays in
		y | Y )
			clear && exit
		;;
		n | N )
			clear && echo "" && echo "Okay. Nevermind then." | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
		;;
		* )
			clear && echo "" && echo "${txtred}Please make a valid selection.${txtrst}" | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
	esac
;;

6 )
	clear && echo "" && echo "Are you sure you want to shut down? ${txtcyn}y/n${txtrst}" | centerwide && echo ""
	read shutdownays
	case $shutdownays in
		y | Y )
			clear && shutdown -h now
		;;
		n | N )
			clear && echo "" && echo "Okay. Nevermind then." | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
		;;
		* )
			clear && echo "" && echo "${txtred}Please make a valid selection.${txtrst}" | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
		;;
	esac
;;

* )
	clear && echo "" && echo "${txtred}Please make a valid selection.${txtrst}" | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
;;
esac

done
