#this will download the most recent version of changes to the inventory from google sheets
#the script will extract all the new changes since the last update

#!/bin/bash

#download the google sheet as a csv file

wget "https://docs.google.com/spreadsheets/d/1L3z8h5sFsA5pKh8y6HsLCIXdbSp8hoLDS2pcoCqYxdw/export?format=csv"

#rename the csv and move it to data 
mv 'export?format=csv' data/newChanges.csv


#count the number of lines in the old file, the one that was download the prvious time the inventory was updated

oldLineCount=$(wc -l < data/oldChanges.csv)	
newLineCount=$(wc -l < data/newChanges.csv)	#number of line in the most recent csv




newChangesCount=$(($newLineCount-$oldLineCount))


tail -n $newChangesCount data/newChanges.csv > data/newChangesOnly.csv

#append new line to newChangesOnly.csv because it allows the csv to be read later on by updateInventory.sh
echo "" >> data/newChangesOnly.csv
