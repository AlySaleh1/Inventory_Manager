#############################################
#This script is used to update an inventory file in csv formate
#The input file must contain three Headers
#First header must be item name
#Second header must be item amount
#Third header can be anything, recommended to be item amount unit
#******************************************************

#!/bin/bash

if [ $# -ne 3 ]						#check if arguments are valid
then
	echo "ERROR: need to input 3 variables"
	echo "Run as: ./updateItem.sh INPUT_FILE AMOUNT ITEM"
	exit 1
fi

if ! [ -f $1 ]						#check if file is valid
then
	echo "ERROR: can not find $1"
        echo "Run as: ./updateItem.sh INPUT_FILE AMOUNT ITEM"
	exit 1
fi


RealNumber='^-?[0-9]+|^-?[0-9]+\.[0-9]+'		#Regex for any real number

if ! [[ $2 =~ $RealNumber ]]
then
	echo "ERROR: amount must be a number"
	echo "Run as: ./updateItem.sh INPUT_FILE AMOUNT ITEM"
	exit 1
fi

item=$(grep $3 inventory.csv)				#item will be empty if input ITEM is not in the inventory

if [[ -z $item ]]					#returns true if $item is empty
then
	echo "ERROR $3 is not in inventory.csv!"
	echo "Run as: ./updateItem.sh INPUT_FILE AMOUNT ITEM"
        exit 1
fi

awk ' BEGIN { FS=","; item = "'$3'"; amount = "'$2'" }
	{ if ($1 == item)  { $2 = amount+$2} }
	// {OFS=","; print $1,$2,$3 } 
	' < $1 > temp.csv

cat temp.csv > $1
rm temp.csv

echo "File Updated!"
