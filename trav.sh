#!/bin/bash
# Traverse a directory using depth first traversal technique
depth()
{
#Do a small depth checking how deep into the tree we are
k=0
while [ $k -lt $1 ]
do
	echo -n " "
	let k++
	#or use k=`expr $k + 1`
done
}

let add=0
let total=0

traverse()
{
# Traverse a directory
while read i
do
	depth $2
	if [ -d "$1/$i" ]
	then
		echo Directory: $1/$i
		traverse "$1/$i" `expr $2 + 1`
	else
		add=$(stat -c%s "$1/$i")
		total=$(($total + $add))
		echo File: $1/$i
	fi
done < <(ls "$1")
}

if [ -z "$1" ]
then
	traverse . 0
else
	traverse $1 0
fi

t=$(du -sh)
tmb=`expr $total / 1048576`

echo "Total stored (du):" $t
echo Total counted: "$tmb"MB

export x=$tmb
