Inventory Manager is a command line program to manage an inventory

## How do I run it?
There are three inputs
1- input_file
2- amount_to_add
3- item_name

Run as:
./updateInventory.sh input_file amount_to_add item_name

## Files:
updateInventory.sh updates the inventory

Inventory.csv contains the current inventory, a sample inventory is provided.


## Note:
The format of the input file is a csv with three headers in this order: item,amount,unit_of_amount
Examples of unit_of_amount: kilograms, liters
