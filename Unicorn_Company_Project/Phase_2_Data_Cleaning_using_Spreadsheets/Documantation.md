### Documentation of Phase 2: Data Cleaning and Exploration with Spreadsheets  

1. **Import and Copy of the Table**  

2. **Renaming to "Unicorn_Company_Project_Konstantin Milonas"**  

3. **Exploration of the Table**  
   3.1 **Extraction of "Order Year" from Column (B) into Column (C):**  

   Formula: `=MID(B2, 4, 4)` as "Order Year"  

   3.2 **Formatting the Date Columns "Order Date" and "Ship Date" into the European Date Format.**  

   3.3 **Observation Regarding "Shipping Country" Omission:**  
   The project assumes the "Shipping Country" column is unnecessary, as all shipments go to the USA. However, reviewing the "Order ID" reveals that out of 5009 distinct "Order IDs," 4195 start with the country code "CA."  

   Using a pivot table, I analyzed "Order ID" as a row and a value. By applying `COUNTUNIQUE`, I calculated the unique Order IDs and used a filter "Starts with CA" to determine the relative count of those Order IDs.  

   Since no "Order City" or similar information is available, it is reasonable to assume these orders are from Canada but shipped to the USA.  

   I extracted the country code from this column and displayed the full name as "Order State" using the following formula:  

   ```excel
   =SWITCH(LEFT(B2, FIND("-", B2) - 1), "CA", "Canada", "US", "United States", "Unbekannt")
   ```  

   3.4 **Splitting the "Customer Name" Column:**  
   The "Customer Name" column displays the full name, which may cause issues during searches. Therefore, I added two additional columns to split the name:  

   - **"Last Name"**:  
     ```excel
     =RIGHTB(F2, LENB(F2) - FIND(" ", F2))
     ```  
   - **"First Name"**:  
     ```excel
     =LEFTB(F2, FIND(" ", F2) - 1)
     ```  

   I then hid the "Customer Name" column to prevent redundancy.  

4. **Data Cleaning**  

   Regarding the "Order ID" column, I made a decision under section 3.3 that no cleaning is necessary. However, I would otherwise contact the stakeholder to confirm whether my assumption is correct.  