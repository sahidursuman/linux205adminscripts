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

centerwider() {
	w=$(( $COLUMNS / 2 - 40 ))
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
echo "1.  Watch ASCII Star Wars Episode IV: A New Hope" | center
echo "2.  Look at a pretty picture" | center
echo "3.  ${txtpur}Return to Main Menu${txtrst}" | center
echo "4.  ${txtred}Shut down${txtrst}" | center
echo ""

read funmenuchoice
case $funmenuchoice in

1 )
	clear && telnet towel.blinkenlights.nl | centerwider
;;

2 )
	clear && echo "" && echo "THERE ARE NO PICTURES IN THE COMMAND LINE (except for this one)." | centerwide
	echo ""
	cat facepalm.txt | center
	echo "" && echo ""
	echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

3 )
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

4 )
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
			clear && echo "" && echo "${txtred}Please make a valid selection." | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
		;;
	esac
;;

* )
	clear && echo "" && echo "${txtred}Please make a valid selection." | center && echo "" && echo "${txtcyn}(Press ENTER to continue.)${txtrst}" | center && read
;;
esac

done
