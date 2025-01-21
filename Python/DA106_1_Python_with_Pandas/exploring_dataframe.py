#Exploring DataFrame

import pandas as pd

df = pd.read_csv(r"D:\Repositories\Git_GitHub\PandasAlexTheAnalyst\countries of the world.csv")
print(df.head(10)) #Prints the first 10 rows of the DataFrame
print(df.tail(10)) #Prints the last 10 rows of the DataFrame
print(df.info()) #Prints the information about the DataFrame
print(df.shape) #Prints the shape of the DataFrame
print(df.columns) #Prints the columns of the DataFrame
print(df.dtypes) #Prints the data types of the DataFrame
print(df.index) #Prints the index of the DataFrame
print(df['Country']) #Prints the column 'Country' of the DataFrame
print(df[['Country', 'Region']]) #Prints the columns 'Country' and 'Region' of the DataFrame
print(df.iloc[0]) #Prints the first row of the DataFrame
print(df.iloc[1]) #Prints the second row of the DataFrame
print(df.iloc[2]) #Prints the third row of the DataFrame

#Unique values in a column
print(df['Region'].unique()) #Prints the unique values in the column 'Region'

#Counting unique values in a column
print(df['Region'].value_counts()) #Prints the count of unique values in the column 'Region'

#Panda Series
print(df['Region'].value_counts().head(3)) #Prints the top 10 most frequent values in the column 'Region'

