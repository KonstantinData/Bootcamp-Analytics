import pandas as pd

"""df = pd.read_csv("D:\Repositories\Git_GitHub\PandasAlexTheAnalyst\countries of the world.csv")
print(df)

ctdf = pd.read_csv("D:\Repositories\Git_GitHub\PandasAlexTheAnalyst\countries of the world.txt", sep='\t')
print(ctdf.head(5))

tdf = pd.read_table("D:\Repositories\Git_GitHub\PandasAlexTheAnalyst\countries of the world.txt")
print(tdf.head())"""

exdf = pd.read_excel("D:\Repositories\Git_GitHub\PandasAlexTheAnalyst\world_population_excel_workbook.xlsx", sheet_name="world_population")   

print(pd.set_option('display.max_rows', 233))
pd.set_option('display.max_columns', 10)
print(exdf)