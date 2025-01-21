import pandas as pd

data = {
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
df = pd.DataFrame(data)

df["Years Active"] = 2023 - df["Year Formed"]
print(df)

df.loc[df['Band'] == 'Black Sabbath', 'Years Active'] = 2017 \
    - df.loc[df['Band'] == 'Black Sabbath', 'Year Formed']
print(df)

df["is active"] = (2023 - df["Years Active"]) == df["Year Formed"]
print(df)

# Modifying Columns
# Increment "Years Active" by 2 to reflect the year 2025

df.loc[df["is active"] == True, "Years Active"] += 2
print(df)

print("-"*100)
df["to be deleted"] = ""
print(df)

# Dropping Columns
df = df.drop(columns=["to be deleted"])

print("_",100)

df["to be deleted"] = "1"
print(df)

df.drop("to be deleted", axis=1, inplace=True)
print(df)

# Keep only "Band" and "Genre" by dropping all other columns
df = df.drop(["Country", "Years Active"], axis=1)
print(df)