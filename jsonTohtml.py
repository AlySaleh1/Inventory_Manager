import json
#this converts abcRecord.json into abcRecords.html
def main():
    
    #load json file
    with open('data/abcRecord.json', 'r') as jsonInput: #items here are already sorted by priority
        
        abc_records_dict = json.load(jsonInput)         #content of abcRecord.json is now in a dictionary

        with open('data/abcRecord.html', 'w') as htmlOutput:
            
            dict_length = len(abc_records_dict.keys())
            item_counter = 0                            #item 
            
            htmlOutput.write('<h1>ABC analysis:</h1>\n')
            htmlOutput.write('<h2>Section A</h2>\n')

            b_section = round(dict_length/3)
            c_section = 2 * b_section

            for item in abc_records_dict:
                if item_counter == b_section:               #when 1/3 of the items have been printed
                    htmlOutput.write('<h2>Section B</h2>\n')
                elif item_counter == c_section:
                    htmlOutput.write('<h2>Section C</h2>\n')   #when 2/3 of the items have been printed

                htmlOutput.write(f'<li>{item}</li>\n')
                item_counter+=1
        

if __name__ == "__main__":
    main()
