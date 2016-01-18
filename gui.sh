#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=25
WIDTH=100
y=0

display_result() {
dialog \
--title "$title" \
--no-collapse \
--msgbox "$display" 0 0
}

while true; do
exec 3>&1
selection=$(dialog \
--backtitle "Directory Information" \
--title "$PWD" \
--clear \
--cancel-label "Exit" \
--menu "Please select:" $HEIGHT $WIDTH 15 \
"1" "Go to parent directory" \
"2" "Go to initial directory" \
"3" "Display size of directory" \
"4" "Display contents of directory" \
"5" "Display detailed infromation about contents of directory" \
2>&1 1>&3)
exit_status=$?
exec 3>&-
case $exit_status in
$DIALOG_CANCEL)
clear
echo "Program Exited"
exit
;;
$DIALOG_ESC)
clear
echo "Program Closed" >&2
exit 1
;;
esac
case $selection in
0 )
clear
echo "Program Closed"
;;
1 )
	if [ $y -eq 0 ]
	then	
	x=$PWD
	fi
	cd ..
	let "y++"	
;;
2 )
	cd $x
;;
3 )
	title="Total storage"
	display=$(du -sh $PDW)
	display_result
;;
4 )
	title="Contents of directory"
	display=$(ls -h)
	display_result
;;
5 )
	title="Directory content details"
	display=$(ls -lh)
	display_result
;;
esac
done
