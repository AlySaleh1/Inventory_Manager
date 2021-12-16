#the purpose of this script is to set up the inventory program

wget "https://docs.google.com/spreadsheets/d/1L3z8h5sFsA5pKh8y6HsLCIXdbSp8hoLDS2pcoCqYxdw/export?format=csv"

#rename the downloaded file
mv 'export?format=csv' data/oldChanges.csv

if [[ -f data/oldChanges.csv ]]
then
	echo "Set up complete"
else
	echo "there was an error with set up!"
fi
