import pandas as pd

parks = [
    'Yellowstone', 'Banff', 'Kruger',
    'Great Barrier Reef', 'Serengeti',
    'Lake Baikal',
    ]

countries = [
    'USA', 'Canada', 'South Africa',
    'Australia', 'Tanzania','Russia',
    ]
parks_series = pd.Series(parks, index=countries, name='National Parks')

print(parks_series)
print(type(parks_series))

data = {
    "USA": "Yellowstone",
    "Canada": "Banff",
    "South Africa": "Kruger",
    "Australia": "Great Barrier Reef",
    "Tanzania": "Serengeti",
    "Russia": "Lake Baikal"
}

parks_series = pd.Series(data, name="National Parks")

print(parks_series)

print(parks_series.iloc[0])
print(parks_series["Canada"])
print(parks_series.values)
print(parks_series.index)