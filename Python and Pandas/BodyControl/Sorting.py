import pandas as pd
from pandas.core.indexing import is_label_like

dogs = {"name": ["Stella","Cooper", "Bella", "Charlie", "Lucy", "Max", "Bernie"],
      "breed": ["Chihuahua", "Schnauzer", "Labrador", "Poodle", "Chow Chow", "Labrador", "St. Bernard"],
      "color": ["Tan", "Gray", "Brown", "Black", "Brown", "Black", "White"],
      "height_cm": [18,49,56,43,46,59,77],
      "weight_kg": [2,17,24,24,24,29,74],
      "date_of_birth":["2015-04-20", "2011-12-11", "2013-07-01", "2016-09-16", "2014-08-25", "2017-01-20", "2018-02-27"]
      }

df = pd.DataFrame(dogs)

#Eine Spalte wird sortiert
sorted_dogs = df.sort_values("weight_kg", ascending=False)
#print(sorted_dogs)
#Zwei Spalten werden sortiert
sorted_dogs_height = df.sort_values(["weight_kg", "height_cm"], ascending=[True, False])
#print(sorted_dogs_height)

#Zoom In
print(df["name"])
print(df[["name", "breed"]])    # Die inneren Klammern sind für die Unterteilung des DataFrame.
                                # Die äußeren Klammern erstellen eine Liste mit Spaltennamen zur Teilmenge
#Eine andere Möglichkeit
cols_to_subset = ["breed", "height_cm"]
print(df[cols_to_subset])

#Gibt Boolean zurück
dogs_hight = df["height_cm"] > 50
print(dogs_hight)
dogs_hight_2 = df[df["height_cm"] > 50]
print(dogs_hight_2)
"""In dieser Variante wird die Boolean-Serie aus der ersten Variante verwendet, um die Zeilen des DataFrames zu filtern. 
Nur die Zeilen, bei denen der Wert in der Spalte height_cm die Bedingung > 50 erfüllt (True), werden zurückgegeben."""

dog_breed = df[df["breed"] == "Labrador"]
print(dog_breed)

dog_date_of_birth = df[df["date_of_birth"] < "2015-01-01"] # Internationales datums Format
print(dog_date_of_birth)

is_lab = df["breed"] == "Labrador"
is_brown = df["color"] == "Brown"
breed_and_color = df[is_lab & is_brown]
print(breed_and_color)

#Suche mehrerer Werte in einer Kategorie
is_black_or_brown = df["color"].isin(["Black", "Brown"])
which_is_black_or_brown = df[is_black_or_brown]
print(which_is_black_or_brown)