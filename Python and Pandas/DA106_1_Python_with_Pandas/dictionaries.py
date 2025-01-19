#Dictionaries

#Key-Value pairs
#Key is unique, value can be anything

#Create a dictionary
myDict = {"name": "Max", "age": 28, "city": "New York"}
print(myDict)

#or use the dict constructor, note the use of '=' instead of ':'
myDict2 = dict(name="Mary", age=27, city="Boston")
print(myDict2)

#Access values
value = myDict["name"]
print(value)

#Add a key-value pair
myDict["email"] = "XXXXXXXXXXX"
print(myDict)

#Delete a key-value pair
del myDict["name"]
print(myDict)

#Check if a key exists
if "name" in myDict:
    print(myDict["name"])

try:
    print(myDict["name"])
except:
    print("Error")

#Loop through a dictionary
for key in myDict:
    print(key)

for key in myDict.keys():
    print(key)

for value in myDict.values():
    print(value)

for key, value in myDict.items():
    print(key, value)

#Copy a dictionary
myDictCopy = myDict.copy()
myDictCopy = dict(myDict)

#Merge two dictionaries
myDict.update(myDict2)
print(myDict)