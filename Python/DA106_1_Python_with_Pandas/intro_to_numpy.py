#First with Pandas only:

import pandas as pd
from statistics import mean

park_elevations = [315, 446, 333, 392, 289]  # Elevations in meters
print("Park Elevations:", park_elevations)

visitor_counts = [1000, 1200, 900, 800, 1100]
print("Visitor Counts:", visitor_counts)

average_visitors = mean(visitor_counts)
print("Average Visitors:", average_visitors)

# Statistical Calculations
print("Minimum Visitor Count:", min(visitor_counts))
print("Maximum Visitor Count:", max(visitor_counts))
print("Total Visitor Count:", sum(visitor_counts))
print("Average Visitor Count:", mean(visitor_counts))

# Dataframe
park_data = pd.DataFrame(
    {"Park": ["Yosemite", "Yellowstone", "Grand Canyon", "Zion", "Glacier"],
     "Elevation (meters)": park_elevations,
     "Visitor Count": visitor_counts}
)
print(park_data)

#With Numpy:

import numpy as np
park_elevations = [315, 446, 333, 392, 289]  # Elevations in meters
visitor_counts = [1000, 1200, 900, 800, 1100]  # Visitor counts
park_data = np.array([park_elevations, visitor_counts])
print(park_data)
# Transpose the array to swap rows and columns
park_data = park_data.T
print(park_data)
# Calculate the average elevation
average_elevation = np.mean(park_data[:, 0])
print("Average Elevation:", average_elevation)
# Calculate the minimum elevation
min_elevation = np.min(park_data[:, 0])
print("Minimum Elevation:", min_elevation)
# Calculate the maximum elevation
max_elevation = np.max(park_data[:, 0])
print("Maximum Elevation:", max_elevation)
# Calculate the total number of visitors
total_visitors = np.sum(park_data[:, 1])
print("Total Visitors:", total_visitors)
# Calculate the average number of visitors
average_visitors = np.mean(park_data[:, 1])
print("Average Visitors:", average_visitors)
# Calculate the minimum number of visitors
min_visitors = np.min(park_data[:, 1])
print("Minimum Visitors:", min_visitors)
# Calculate the maximum number of visitors
max_visitors = np.max(park_data[:, 1])
print("Maximum Visitors:", max_visitors)
# Calculate the standard deviation of visitors
std_dev_visitors = np.std(park_data[:, 1])
print("Standard Deviation of Visitors:", std_dev_visitors)
# Calculate the correlation coefficient between elevation and visitors

#Value Counts
park_elevations = [315, 446, 333, 392, 289]  # Elevations in meters
visitor_counts = [1000, 1200, 900, 800, 1100]  # Visitor counts
park_data = np.array([park_elevations, visitor_counts])
print(park_data)

#value_counts
unique_elevations = np.unique(park_data[0])