#Als erstes erstelle ich einen Dataframe
from types import new_class

import pandas as pd
import numpy as np
from datetime import datetime

Gewichtsverlauf = {
    "Datum": ["2025-01-01", "2025-01-02", "2025-01-03", "2025-01-04", "2025-01-05", "2025-01-06",
              "2025-01-07", "2025-01-08", "2025-01-09", "2025-01-10", "2025-01-11", "2025-01-12",
              "2025-01-13", "2025-01-14", "2025-01-15", "2025-01-16", "2025-01-17"],
    "Gewicht": [145.9, 145.9, 145.6, 146.1, 146.37, 146.63, 146.4, 146.3, 145.8, 145.2, 143.9, 143.3,
                144.2, 144.3, 142.7, 142.8, 140.8],
    "Name": ["Konstantin", "Konstantin", "Konstantin", "Konstantin", "Konstantin", "Konstantin",
             "Konstantin", "Konstantin", "Konstantin", "Konstantin", "Konstantin", "Konstantin",
             "Konstantin", "Konstantin", "Konstantin", "Konstantin", "Konstantin", ]
}

df = pd.DataFrame(Gewichtsverlauf)
print(df)

df["Verbleiben"] = df["Gewicht"].apply(lambda x: x-90)
print(df)

df["kcal zu verbrennen"] = df["Verbleiben"].apply(lambda x: x*7000)
print(df)

df = df[["Datum", "Name", "Gewicht", "Verbleiben", "kcal zu verbrennen"]]
print(df)

df['Datum'] = pd.to_datetime(df['Datum'])
birth_date = pd.Timestamp('1970-02-12')

# Alter in Tagen berechnen und in Jahre umwandeln
df['Alter'] = df['Datum'].apply(lambda x: (x - birth_date).days // 365)

print(df)

df["BMI"] = df["Gewicht"].apply(lambda x: x / 177**2)*10000
print(df)