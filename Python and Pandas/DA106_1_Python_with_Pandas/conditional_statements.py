# Conditional statements
#1. if statement
#2. if-else statement
#3. if-elif-else statement
#4. nested if statement

#1. if statement
#syntax
#if condition:
#   statement

age = int(input("Enter your age: "))
if age >= 18:
    print("You are eligible to vote")

#2. if-else statement
#syntax
#if condition:
#   statement
#else:
#   statement

age = int(input("Enter your age: "))
if age >= 18:
    print("You are eligible to vote")
else:
    print("You are not eligible to vote")

#3. if-elif-else statement
#syntax
#if condition:
#   statement
#elif condition:
#   statement
#else:
#   statement

age = int(input("Enter your age: "))
if age >= 18:
    print("You are eligible to vote")
elif age < 18:
    print("You are not eligible to vote")
else:
    print("You are not eligible to vote")

#4. nested if statement
#syntax
#if condition:
#   if condition:
#       statement
#   else:
#       statement
#else:
#   statement

age = int(input("Enter your age: "))
if age >= 18:
    if age >= 60:
        print("You are a senior citizen")
    else:
        print("You are a young adult")
else:
    print("You are a minor")