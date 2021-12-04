#!/bin/bash
#this checks if there is a new changes to the form
#download the google sheet as a csv file

wget "https://docs.google.com/spreadsheets/d/1L3z8h5sFsA5pKh8y6HsLCIXdbSp8hoLDS2pcoCqYxdw/export?format=csv"

#rename the csv and move it to data
mv 'export?format=csv' temp/newChanges.csv

#count the number of lines in the old file, the one that was download the prvious time the inventory was updated

oldLineCount=$(wc -l < data/oldChanges.csv)
newLineCount=$(wc -l < temp/newChanges.csv)     #number of line in the most recent csv

if [[ $oldLineCount -eq $newLineCount ]]
then
	exit
else
	./updateInventory.sh
fi
