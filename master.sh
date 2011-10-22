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
echo "Hello, ${txtgrn}$USER${txtrst}, what would you like to do today?" | centerwide
echo "${txtcyn}(please enter the number of your selection below)${txtrst}" | centerwide
echo ""
echo "1.  File Operations" | center
echo "2.  User Operations" | center
echo "3.  Locating Information" | center
echo "4.  ${txtred}F${txtgrn}u${txtylw}n ${txtblu}S${txtpur}t${txtcyn}u${txtred}f${txtgrn}f${txtrst}" | center
echo "5.  Process Menu" | center
echo "6.  ${txtpur}Exit${txtrst}" | center
echo "7.  ${txtred}Shut down${txtrst}" | center
echo ""

read mainmenuchoice
case $mainmenuchoice in

1 )
	./fileoperations.sh
;;

2 )
	./useroperations.sh
;;

3 )
	./locateinfo.sh
;;

4 )
	./funstuff.sh
;;

5 )
	./processmenu.sh
;;

6 )
	clear && echo "" && echo "Are you sure you want to exit? ${txtcyn}y/n${txtrst}" | centerwide && echo ""
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

7 )
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
