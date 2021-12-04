#this is the main program that will update the inventory

#!/bin/bash


./getChanges.sh		#updates newChangesOnly.csv, which now contains the most recent changes to the inventory

#iterate through newChangesOnly.csv

while IFS=, read -r time item amount
do
	echo "updating $item"
	./updateItem.sh data/inventory.csv $amount $item
done < data/newChangesOnly.csv

#convert the newChanges to oldChanges (because changes has be already been  appiled to the inventory)


python3 abcAnalysis.py			#updates abcRecords.json, which keeps tracks of how many times an item stock level has changed

./csvTohtml.sh			#this changes inventory.csv to inventory.html

python3 jsonTohtml.py		#converts the abcRecord.json to an abcRecord.html

cat data/abcRecord.html >> data/inventory.html		#concatenate the abcRecords to the main html file that will be displayed

mv data/newChanges.csv data/oldChanges.csv		#all changes have been applied at this point, so I overwrite oldChanges.csv with the content of "newChanges.csv"

mv data/inventory.html ~/public_html/inventory.html

