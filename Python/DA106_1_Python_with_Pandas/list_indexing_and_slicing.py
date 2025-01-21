#Lists are indexed, meaning you can access elements by their position

# Slicing
#Slicing is a way to access a subset of a list or string. It is done by using the colon (:) operator.

my_list = [1, 2, 3, 4, 5]
print(my_list[1:3])
print(my_list[:3])  # Output: [1, 2, 3]
print(my_list[2:])  # Output: [3, 4, 5]
print(my_list[-2:]) # Output: [4, 5]

#Indexing for Nested Lists
puppy_toys = ["ball", "bone", "frisbee"]

print(puppy_toys[0])
print(puppy_toys[-1])

nested_list = [['ball', 'bone'], ['frisbee', 'rope'], ['stick',
               'chew toy']]
print (nested_list[1][0])
print (nested_list[2][1])

#Operations on Lists
#Lists can be concatenated using the + operator, and repeated using the * operator.

list1 = [1, 2, 3]
list2 = [4, 5, 6]
concatenated_list = list1 + list2
print(concatenated_list)  # Output: [1, 2, 3, 4, 5, 6]
repeated_list = list1 * 3
print(repeated_list)  # Output: [1, 2, 3, 1, 2, 3, 1, 2, 3]

#Adding Elements to a List
#Elements can be added to a list using the append() method or the extend() method.

my_list = [1, 2, 3]
my_list.append(4)
print(my_list)  # Output: [1, 2, 3, 4]
my_list.extend([5, 6])
print(my_list)  # Output: [1, 2, 3, 4, 5, 6]

#Removing Elements from a List
#Elements can be removed from a list using the remove() method or the pop() method.

my_list = [1, 2, 3, 4, 5]
my_list.remove(3)
print(my_list)  # Output: [1, 2, 4, 5]
popped_element = my_list.pop(1)
print(popped_element)  # Output: 2
print(my_list)  # Output: [1, 4, 5]

#Sorting a List
#Lists can be sorted in ascending or descending order using the sort() method.

my_list = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
my_list.sort()  
print(my_list)  # Output: [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
my_list.sort(reverse=True)  
print(my_list)  # Output: [9, 6, 5, 5, 5, 4, 3, 3, 2, 1, 1]

#Reversing a List
#Lists can be reversed using the reverse() method.

my_list = [1, 2, 3, 4, 5]
my_list.reverse()
print(my_list)  # Output: [5, 4, 3, 2, 1]
#Finding the Index of an Element
#The index() method can be used to find the index of an element in a list.

my_list = [1, 2, 3, 4, 5]
index = my_list.index(3)
print(index)  # Output: 2
#Counting the Occurrences of an Element
#The count() method can be used to count the number of occurrences of an element in a list.

my_list = [1, 2, 3, 4, 5, 3]
count = my_list.count(3)
print(count)  # Output: 2

#Copying a List
#Lists can be copied using the copy() method or the list() constructor.

my_list = [1, 2, 3, 4, 5]
copied_list = my_list.copy()
print(copied_list)  # Output: [1, 2, 3, 4, 5]
another_list = list(my_list)
print(another_list)  # Output: [1, 2, 3, 4, 5]

#Clearing a List
#The clear() method can be used to remove all elements from a list.

my_list = [1, 2, 3, 4, 5]
my_list.clear()
print(my_list)  # Output: []

#Checking if an Element is in a List
#The in operator can be used to check if an element is present in a list.

my_list = [1, 2, 3, 4, 5]
print(3 in my_list)  # Output: True
print(6 in my_list)  # Output: False



