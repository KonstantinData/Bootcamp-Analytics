# Comparison Operators 

# Equal: ==
# Not Equal: !=
# Greater Than: >
# Less Than: <
# Greater or Equal: >=
# Less or Equal: <=
# Object Identity: is

language = 'Java'

if language == 'Python':
    print('Language is Python')
elif language == 'Java':
    print('Language is Java')
elif language == 'JavaScript':
    print('Language is JavaScript')
else:
    print('No match')

# and
# or
# not

user = 'XXXXX'
logged_in = True

if user == 'Admin' and logged_in:
    print('Admin Page')
else:
    print('Bad Creds')

if user == 'Admin' or logged_in:
    print('Admin Page')
else:
    print('Bad Creds')

if not logged_in:
    print('Please Log In')
else:
    print('Welcome')

a = [1, 2, 3]
b = [1, 2, 3]

print(a == b)
print(a is b)
print(id(a))
print(id(b))

c = b
print(c is b)
print(id(c))

condition = False

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = None

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = 0

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = 10

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = ''

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = []

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = {}

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')

condition = 'Test'

if condition:
    print('Evaluated to True')
else:
    print('Evaluated to False')