import sys
print(sys.executable)


import pandas as pd

# Single list of travel Destinations
destinations = ["Paris", "Tokyo", "New York"]

# Creating a DataFrame from the list of destinations
df1 = pd.DataFrame(destinations, columns=["Destination"])

print(df1)

# Dictionary of travel destinations
data = {
    "Destination": ["Paris", "Tokyo", "New York"],
    "State" : ["France", "Japan", "United States"],
    "Rating" : [4.8, 4.7, 4.5]
}

#Creating a DataFrame from the dictionary
df2 = pd.DataFrame(data)
print(df2)

#View Data Types
print(df2.dtypes)

#Display column names
print(df2.columns)

# View the shape of the DataFrame
print(df2.shape)
