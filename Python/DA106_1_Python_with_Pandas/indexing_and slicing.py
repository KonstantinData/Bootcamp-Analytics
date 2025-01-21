#loc an iloc
#Syntax: df.loc[<row labels>, <column labels>]

import pandas as pd

data = {
    'Band': ['Black Sabbath', 'Iron Maiden', 'Metallica', 'Slayer','Megadeth'],
    'Country': ['UK', 'UK', 'USA', 'USA', 'USA'],
    'Year Formed': [1968, 1975, 1981, 1981, 1983],
    'Genre': ['Heavy Metal', 'Heavy Metal', 'Thrash Metal', 'Thrash Metal', 'Thrash Metal'],
    }
df = pd.DataFrame(data, index=['BS', 'IM', 'MT', 'SL', 'MG'])

# Access rows using labels
print(df.loc[['IM',"SL"]])
print("-" * 50)
print(df.loc[['IM',"SL"],["Band","Genre"]])
print("-" * 50)
print(df.iloc[3])
print("-" * 50)
print(df.iloc[3, 1])
print("-" * 50)
print(df.iloc[1:3, 0:3])
print("-" * 50)
print(df.iloc[1:3, :])
print("-" * 50)
print(df.iloc[:, 1:3])
print("-" * 50)
print(df.loc[:, ["Genre","Band"]])
print("-" * 50)
print(df.loc["IM":"SL", "Band":"Genre"])
print("-" * 50)


band_data = {
    'Band': [
        'Black Sabbath', 'Iron Maiden', 'Metallica',
        'Slayer', 'Megadeth', 'Angra',
        ],
    'Country': [
        'UK', 'UK', 'USA',
        'USA', 'USA', 'Brazil',
        ],
    'Year Formed': [
        1968, 1975, 1981,
        1981, 1983, 1991,
        ],
    'Genre': [
        'Heavy Metal', 'Heavy Metal',
        'Thrash Metal', 'Thrash Metal',
        'Thrash Metal', 'Power Metal',
        ],
    }
songbook = pd.DataFrame(band_data)

# Find bands formed after 1975 and based in the USA
filtered_bands = songbook.loc[(songbook['Year Formed'] > 1975) & (songbook['Country']
                        == 'USA')]
print (filtered_bands)

print("-" * 50)

band_country = songbook.loc[(songbook["Year Formed"] == 1968) & (songbook["Genre"] == "Heavy Metal")]
print(band_country)