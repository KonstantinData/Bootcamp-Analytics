import numpy as np

park_elevations = np.array([315, 446, 333, 392, 289])  # Elevations in meters
print("Park Elevations:", park_elevations)

# Array of visitor counts for each park
visitor_counts = np.array([1000, 1200, 900, 800, 1100])  # Number of visitors

# Calculate the average visitor count
average_visitors = visitor_counts.mean()
print("Average Visitors:", average_visitors)

# Double the visitor counts
double_visitors = visitor_counts * 2
print("Doubled Visitors:", double_visitors)

# Find the maximum elevation among parks
max_elevation = park_elevations.max()
print("Maximum Elevation:", max_elevation)

# Access the elevation of the third park
third_park_elevation = park_elevations[2]
print("Elevation of the Third Park:", third_park_elevation)

# Update the elevation of the first park
park_elevations[0] = 320
print("Updated Elevations:", park_elevations)

# Create a 2D array combining elevations and visitor counts
park_data = np.array([
    [315, 1000],  # Elevation and visitors for park 1
    [446, 1200],  # Park 2
    [333, 900],   # Park 3
    [392, 800],   # Park 4
    [289, 1100]   # Park 5
])
print("Park Data Array:")
print(park_data)

# Access the elevation of the fifth park
fifth_park_elevation = park_data[4, 0]
print("Elevation of the Fifth Park:", fifth_park_elevation)

# Access all data for the second park
second_park_data = park_data[1]
print("Data for the Second Park:", second_park_data)