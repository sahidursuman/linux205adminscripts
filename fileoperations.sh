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
echo "1.  Create a file" | center
echo "2.  Delete a file" | center
echo "3.  Create a directory" | center
echo "4.  Delete a directory" | center
echo "5.  Create a symbolic link" | center
echo "6.  Change ownership of a file" | center
echo "7.  Change permissions on a file" | center
echo "8.  Modify text within a file" | center
echo "9.  Compress a file" | center
echo "10. Decompress a file" | center
echo "11. ${txtpur}Return to main menu${txtrst}" | center
echo "12. ${txtred}Shut down${txtrst}" | center
echo ""

read mainmenuchoice
case $mainmenuchoice in

1 )
	clear && echo "" && echo "Current working directory:" | center && pwd | center
	echo "" && echo "Please enter the ${txtcyn}full path${txtrst} and filename for the new file:" | centerwide && echo ""
	echo "${txtcyn}(if file exists, it will be touched)${txtrst}" | center && echo ""
	read touchfile
	echo "" && echo ""
	touch $touchfile && echo "${txtgrn}File $touchfile touched successfully.${txtrst}" | centerwide || echo "${txtred}Touch failed. How did you even do that?${txtrst}" | center
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

2 )
	clear && echo "" && echo "Current working directory:" | center && pwd | center && echo "" && ls && echo ""
	echo "Please enter the ${txtcyn}full path${txtrst} and filename for the file to be deleted:" | centerwide && echo ""
	read rmfile
	echo "" && echo ""
	rm -i $rmfile && echo "${txtgrn}File removed successfully.${txtrst}" | center || echo "${txtred}File removal failed.${txtrst}" | center
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

3 )
	clear && echo "" && echo "Current working directory:" | center && pwd | center && echo "" && ls && echo ""
	echo "Please enter the ${txtcyn}full path${txtrst} for the directory to be created:" | centerwide && echo ""
	read mkdirdir
	echo "" && echo ""
	mkdir $mkdirdir && echo "${txtgrn}Directory $mkdirdir created successfully.${txtrst}" | centerwide || echo "${txtred}Failed to create directory.${txtrst}" | center
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

4 )
	clear && echo "" && echo "Current working directory:" | center && pwd | center && echo "" && ls && echo ""
	echo "Please enter the ${txtcyn}full path${txtrst} for the directory to be removed:  ${txtcyn}(MUST BE EMPTY!)${txtrst}" | centerwide && echo ""
	read rmdirdir
	echo "" && echo ""
	rmdir $rmdirdir && echo "${txtgrn}Directory $rmdirdir removed successfully.${txtrst}" | centerwide || echo "${txtred}Failed to remove directory. Please ensure directory is empty.${txtrst}" | centerwide
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

5 )
	clear && echo "" && echo "Please enter the input file for the symbolic link:  ${txtcyn}(FULL PATH!)${txtrst}" | centerwide && echo ""
	read symlinfile
	echo "" && echo "Please enter the output file for the symbolic link:  ${txtcyn}(SERIOUSLY, FULL PATH!)${txtrst}" | centerwide && echo ""
	read symloutfile
	echo "" && echo ""
	ln -s $symlinfile $symloutfile
	cat $symloutfile && clear && echo "" && echo "${txtgrn}Symbolic link created successfully at $symloutfile${txtrst}" | centerwide || echo "${txtred}Failed to create symbolic link. Please check paths and filenames and try again.${txtrst}" | centerwide && rm -f $symloutfile
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

6 )
	clear && echo "" && echo "Which file's ownership should be changed?  ${txtcyn}(MUST EXIST, USE FULL PATH!)${txtrst}" | centerwide && echo ""
	read chownfile
	echo "" && echo "Please enter the username for the new owner of $chownfile:  ${txtcyn}(USER MUST EXIST)${txtrst}" | centerwide && echo ""
	read chownuser
	echo "" && echo "Please enter the new group for $chownfile:  ${txtcyn}(GROUP MUST EXIST)${txtrst}" | centerwide && echo ""
	read chowngroup
	echo "" && echo ""
	chown $chownuser.$chowngroup $chownfile && echo "${txtgrn}Ownership of $chownfile changed successfully.${txtrst}" | centerwide || echo "${txtred}Failed to change ownership. Please check if user, group and file exist.${txtrst}" | center
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

7 )
	clear && echo "" && echo "Which file's permissions should be changed?  ${txtcyn}(MUST EXIST, USE FULL PATH!)${txtrst}" | centerwide && echo ""
	read chmodfile
	echo "" && echo "Please enter the three-digit numeric string for the permissions you would like to set:" | centerwide
	echo ""
	echo "${txtcyn}( format is [owner][group][all]  |  ex: ${txtrst}777${txtcyn} for full control for everyone )${txtrst}" | centerwide
	echo ""
	echo "${txtcyn}4 = read${txtrst}" | center
	echo "${txtcyn}2 = write${txtrst}" | center
	echo "${txtcyn}1 = execute${txtrst}" | center
	echo ""
	read chmodnum
	echo "" && echo ""
	chmod $chmodnum $chmodfile && echo "${txtgrn}Permissions for $chmodfile changed successfully.${txtrst}" | centerwide || echo "${txtred}Failed to set permissions.${txtrst}" | center
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

8 )
	clear && echo "" && echo "Please enter the full path and filename for the file you wish to edit:" | centerwide && echo ""
	read editfile
	echo "Which program would you like to use to edit this file?" | centerwide && echo ""
	echo "${txtcyn}(please enter the number of your selection below)${txtrst}" | centerwide
	echo "1. vim" | center
	echo "2. nano" | center
	echo "3. mcedit" | center
	echo "4. emacs" | center
	echo "5. pico" | center
	echo ""
	read editapp
	echo ""
	case $editapp in
		1 )
			vim $editfile || echo "${txtred}Failed to open vim. Please check if it is installed.${txtrst}" | centerwide
		;;
		
		2 )
			nano $editfile || echo "${txtred}Failed to open nano. Please check if it is installed.${txtrst}" | centerwide
		;;

		3 )
			mcedit $editfile || echo "${txtred}Failed to open mcedit. Please check if it is installed.${txtrst}" | centerwide
		;;

		4 )
			emacs $editfile || echo "${txtred}Failed to open emacs. Please check if it is installed.${txtrst}" | centerwide
		;;

		5 )
			pico $editfile || echo "${txtred}Failed to open pico. Please check if it is installed.${txtrst}" | centerwide
		;;

		* )
			echo "${txtred}Please make a valid selection.${txtrst}" | center
		;;
	esac
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

9 ) 
	clear && echo "" && echo "Please enter the ${txtcyn}full path${txtrst} and filename for the file you wish to compress:" | centerwide && echo ""
	read pressfile
	echo "" && echo "Which method of compression would you like to use?" | centerwide && echo ""
	echo "${txtcyn}(please enter the number of your selection below)${txtrst}" | centerwide
	echo ""
	echo "1. gzip" | center
	echo "2. bzip2" | center
	echo "3. compress" | center
	echo ""
	read pressmethod
	echo ""
	case $pressmethod in
		1 )
			gzip $pressfile && echo "${txtgrn}File compressed successfully.${txtrst}" | center || echo "${txtred}File failed to compress.${txtrst}" | center
		;;

		2 )
			bzip2 $pressfile && echo "${txtgrn}File compressed successfully.${txtrst}" | center || echo "${txtred}File failed to compress.${txtrst}" | center
		;;

		3 )
			compress $pressfile && echo "${txtgrn}File compressed successfully.${txtrst}" | center || echo "${txtred}File failed to compress.${txtrst}" | center
		;;

		* )
			echo "${txtred}Please make a valid selection.${txtrst}" | center
		;;
	esac
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

10 )
	clear && echo "" && echo "Please enter the ${txtcyn}full path${txtrst} and filename for the file you wish to decompress:" | centerwide && echo ""
	read depressfile
	case $depressfile in
		*.gz | *.GZ )
			gunzip $depressfiles && echo "${txtgrn}File decompressed successfully.${txtrst}" | center || echo "${txtred}File failed to decompress.${txtrst}" | center
		;;

		*.bz2 | *.BZ2 )
			bunzip2 $depressfile && echo "${txtgrn}File decompressed successfully.${txtrst}" | center || echo "${txtred}File failed to decompress.${txtrst}" | center
		;;
		
		*.z | *.Z )
			uncompress $depressfile && echo "${txtgrn}File decompressed successfully.${txtrst}" | center || echo "${txtred}File failed to decompress.${txtrst}" | center
		;;
		
		* )
			echo "${txtred}File does not appear to use a valid compression method (gzip, bzip2, or compress). Please decompress manually.${txtrst}" | centerwide
	esac
	echo "" && echo "${txtcyn}(press ENTER to continue)${txtrst}" | center && read
;;

11 )
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

12 )
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
