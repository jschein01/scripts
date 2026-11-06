#!/bin/bash
read -p "Please enter the path of directory containing files:" dir

if ! [[ -d $dir ]]; then
echo "NOT DIRECTORY!"
exit 1
fi

read -p "Please enter new name for files:" name
declare -i num=0

for filename in "$dir"*; do
	if [[ -f $filename ]]; then
		temp=${filename#"$dir"}
		extension=${temp##*.}
		fname=${filename//"$temp"/"$name$num.$extension"}
		mv $filename $fname
		echo "$filename is now $fname"
		num=$(( num + 1 ))
	fi
done



