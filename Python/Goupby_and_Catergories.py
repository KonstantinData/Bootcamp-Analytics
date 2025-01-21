import numpy as np

# Ein 2D-Array (Tabelle) erstellen
array = np.array([[1, 2, 3], [4, 5, 6]])

print(array)
# Ausgabe:
# [[1 2 3]
#  [4 5 6]]

import pandas as pd

# Ein DataFrame erstellen
daten = {
    "Name": ["Anna", "Ben", "Chris"],
    "Alter": [25, 30, 35],
    "Gehalt": [50000, 60000, 70000]
}

df = pd.DataFrame(daten)

print(df)
# Ausgabe:
#     Name  Alter  Gehalt
# 0   Anna     25   50000
# 1    Ben     30   60000
# 2  Chris     35   70000

print(df["Gehalt"].mean())

Dogwachers = {"Name": ["Stella, Cooper, Bellas, Charlie"],
                 "breed": ["Chihuahua", "Schnauzer", "Labrador", "Poodle"]}

df_1 = pd.DataFrame(Dogwachers,)
print(df_1)