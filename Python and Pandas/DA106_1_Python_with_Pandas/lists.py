# Lists

# A list in Python is a collection of items, which can be of different types (e.g., integers, strings, etc.).
# Lists are one of Python's built-in data structures.

# Creating a list
my_list = [1, 2, 3, 4, 5]

# Accessing elements in a list
print(my_list[0])  # Output: 1
print(my_list[2])  # Output: 3

# Modifying elements in a list
my_list[0] = 10
print(my_list)  # Output: [10, 2, 3, 4, 5]

# Adding elements to a list
my_list.append(6)
print(my_list)  # Output: [10, 2, 3, 4, 5, 6]

# Removing elements from a list
my_list.remove(3)
print(my_list)  # Output: [10, 2, 4, 5, 6]

# List slicing
print(my_list[1:4])  # Output: [2, 4, 5]

# List comprehension
squares = [x**2 for x in range(10)]
print(squares)  # Output: [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# List methods
my_list = [3, 1, 4, 1, 5, 9, 2, 6, 5]
my_list.sort()
print(my_list)  # Output: [1, 1, 2, 3, 4, 5, 5, 6, 9]

my_list.reverse()
print(my_list)  # Output: [9, 6, 5, 5, 4, 3, 2, 1, 1]

print(len(my_list))  # Output: 9

print(my_list.index(5))  # Output: 2

print(my_list.count(1))  # Output: 2

my_list.clear()
print(my_list)  # Output: []