import pandas as pd

df =pd.read_excel("C:\\Users\\konst\\Downloads\\dataset.xlsx",sheet_name=0,header=0)

print(df.tail(3))

df.info()