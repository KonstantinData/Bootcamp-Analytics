#Functions are blocks of reusable code that perform a specific task. They simplify 
# repetitive tasks, improve code readability, and allow for modular programming.

#Syntax: def function_name(parameters):
#           # Function body
#           # Code to be executed
#           return [expression]  # Optional, if not specified, the function returns None

# Function to add a song to the setlist
def add_song(setlist, song):
    setlist.append(song)
    return setlist

angra_setlist = ["Rebirth", "Nova Era", "Temple of Shadows"]
new_song = "Carry On"

print("Original Setlist:",angra_setlist)

# Song zur Setlist hinzufügen
add_song(angra_setlist, new_song)

# Aktualisierte Liste ausgeben
print("Updated Setlist:", angra_setlist)

#If I´d like to keep the original setlist, I can create a copy of it before modifying it.

def add_song(setlist, song):
    new_setlist = setlist.copy()
    new_setlist.append(song)
    return new_setlist

angra_setlist = ["Rebirth", "Nova Era", "Temple of Shadows"]
new_song = "Carry On"

updated_setlist = add_song(angra_setlist, new_song)

print("Original Setlist:", angra_setlist)
print("Updated Setlist:", updated_setlist)

