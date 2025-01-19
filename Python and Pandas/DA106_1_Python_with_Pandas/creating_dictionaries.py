#Dictionaries can be created by using curly braces {} or the dict() function. 
#It is also possible to use the dict() function to convert other data types to a dictionary.
#The dict() function can be used to convert other data types, such as tuples, to a dictionary.

#Creating a dictionary using curly braces {}
my_dict = {"name": "John", "age": 25, "city": "New York"}

#Creating a dictionary using the dict() function
my_dict = dict(name="John", age=25, city="New York")

#Converting a tuple to a dictionary
my_tuple = (("name", "John"), ("age", 25), ("city", "New York"))
my_dict = dict(my_tuple)

#Converting a list of tuples to a dictionary
my_list = [("name", "John"), ("age", 25), ("city", "New York")]
my_dict = dict(my_list)

#Printing the dictionary
print(my_dict)

# Sample Dictionary
puppy_info = { "name": "Puppy", 
               "age": 10, 
               "breed": "Poodle" }

# Accessing Dictionary Information
print(puppy_info["name"])
print(puppy_info["age"],puppy_info["breed"])

print(puppy_info.get("breed","unknown")) #if the key is not found, it will return the default value

# Modifying Dictionary Information
puppy_info["age"] = 11
puppy_info["color"] = "black"
print(puppy_info)

puppy_info["second color"] = "grey"
print(puppy_info)

puppy_info.update({"age": 12, "color": "purple"})
print(puppy_info)   	

#Removing Items from a Dictionary
puppy_info.pop("second color")
puppy_info.popitem() #removes the last item
puppy_info.clear() #removes all items
del puppy_info["second color"]

# Removing Dictionary Information
del puppy_info["second color"]
print(puppy_info)

