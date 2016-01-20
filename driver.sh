#!/bin/bash
store=$PWD
current=$PWD
lsout=0
Main() {	
input=6
clear
echo "" 
echo ""
echo ""
echo ""
echo "Commands:"
echo ""
echo "	1 Go to the parent directory"
echo "	2 Go to the initial directory"
echo "	3 Display the size of a directory"
echo "	4 Display contents of directory"
echo "	5 Display detailed infromation about contents of directory"
echo ""
echo "	0 To Exit"
echo ""
echo -n "Current directory" 
pwd
echo $info
if [ $lsout -eq 1 ] ; then ls -h |  cat ; fi
if [[ $lshout -eq 1 ]] ; then ls -lh |  cat ; fi

while [ $input -eq 6 ]
do

	read input

	if [ $input -eq 0 ] ; then c0 ; fi

	if [ $input -eq 1 ] ; then c1 ; fi

	if [ $input -eq 2 ] ; then c2 ; fi

	if [ $input -eq 3 ] ; then c3 ; fi

	if [ $input -eq 4 ] ; then c4 ; fi

	if [ $input -eq 5 ] ; then c5 ; fi
	
	echo "error: command not found"
	
	input=6

done
}

c1(){
	lshout=0
	lsout=0
	cd ..
	Main
	}

c2(){
	lshout=0
	lsout=0
	cd $store
	current=$PWD
	Main
	}
	
c3(){
	lshout=0
	lsout=0
	info=$(du -sh $PWD)	
	Main
	}
	
c4(){
	lshout=0
	lsout=1
	Main
	}
	
c5(){
	lsout=0
	lshout=1
	Main
	}

c0(){
	clear
	exit
}

chmod +rx trav.sh
chmod +rx gui.sh
command -v dialog >/dev/null 2>&1 || { Main; }
sh gui.sh
