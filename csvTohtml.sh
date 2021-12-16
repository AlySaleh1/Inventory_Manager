#this script changes the csv file into a html page

#!/bin/bash


echo "<html>" > data/inventory.html 

echo "<link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">" >> data/inventory.html

echo "<style>
table, th, td {
	border:1px solid black;

}
th, td {
	padding: 15px;
}
</style>" >> data/inventory.html

echo "<h1>Inventory</h1>" >> data/inventory.html

echo "<table style="width:100%">" >> data/inventory.html

sed -e "s/^/<TR><TH>/g"	-e "s/$/<\/TH><\/TR>/g" -e "s/,/<\/TH><TH>/g" < data/inventory.csv >> data/inventory.html

echo "</table>" >> data/inventory.html

echo "</html>" >> data/inventory.html 

