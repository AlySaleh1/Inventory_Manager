import csv
import os.path
import json

def main():
    
    with open('data/newChangesOnly.csv', 'r') as new_changes:
        
        abcDict = {}

        if os.path.isfile('data/abcRecord.json'):               #check if abcRecords exits
            abc = open('data/abcRecord.json', 'r')
            abcDict = json.load(abc)                            #if it does, load the json file into a dict
            abc.close()
        else:
            with open('data/inventory.csv','r') as itemReader:      #otherwise, create a dict, each key is an item
                itemReader = csv.reader(itemReader)
                next(itemReader, None)                              # skip the headers

                for row in itemReader:
                    abcDict[row[0]] = 0                             #add all items in the invetory into abcDict

        reader = csv.reader(new_changes)

        for row in reader:                              #keep record of how many times item has been changed in the form
            
            item = row[1]
            if item in abcDict:
                abcDict[item]+=1
            else:
                print("ERROR: item in newChangesOnly.csv not present in abcDict\nError is in abcAnalysis.py")
        
        #the keys in abcDict are the items in the inventory, the values is how many times this item's amount has changed

        #sort dict by values
        abcDict_list = list(abcDict.items())
        abcDict_sorted = dict(sorted(abcDict_list, key=lambda x: -x[1]))


        with open('data/abcRecord.json','w') as abcRecord:
            json.dump(abcDict_sorted, abcRecord, indent=4)



if __name__ == '__main__':
    main()
