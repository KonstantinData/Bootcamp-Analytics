import pandas as pd

data = {
    'Mountain':   ['Mount Everest', 'K2', 'Kangchenjunga', 'Lhotse',
                 'Makalu'],
    'Height_m':   [8848, 8611, 8586, 8516, 8485],
    'Location':   ['Nepal/China', 'Pakistan/China', 'Nepal/India',
                 'Nepal/China', 'Nepal/China'],
    'First_Ascent':   [1953, 1954, 1955, 1956, 1955]
}

df = pd.DataFrame(data)

print(df)

print(df.dtypes)
print(df.columns)
print(df.shape)