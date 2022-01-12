# Inventory Manager
This is an Inventory Mangement system that uses ABC analysis to rank items according to their importance. Changes to the inventory can be inputted via google forms.

### How does this program work?
The script that is used to update the inventory is updateInventory.sh. It downloads from google sheets the csv file linked to google form and updates the inventory (in data/inventory.csv). 

### What is ABC analysis? Why is it important in an inventory system?
The idea behind ABC analysis is to rank how important certain items are in a bussiness. In this system, the importance of an item is determined by how many times its levels in the inventory changed.

For example, let's say a company has a warehouse that contains items needed for manufacturing. You could place the items all over the where house, but this is not time efficient, since some of the more frequently need items will be at the back at the warehouse. Hence retrieving  this frequently needed item will take a longer time to get compared to if it was placed near where the items are dropped off.

What ABC analysis aims to do is to identify the most frequently used items in the inventory, so they can be placed near where the items are dropped off, which saves time.
