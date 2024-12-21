### Documentation of Phase 2: Data Cleaning and Exploration with Spreadsheets  

1. Import and Copy of the Table  

2. Renaming to "Unicorn_Company_Project_Konstantin Milonas"  

3. Exploration of the Table  

   3.1 Extraction of "Order Year" from Column (B) into Column (C):  
   Formula: `=MID(B2, 4, 4)` as "Order Year"  

   3.2 Formatting the Date Columns "Order Date" and "Ship Date" into the European Date Format.  

   3.3 Observation Regarding "Shipping Country" Omission:  
   The project assumes the "Shipping Country" column is unnecessary, as all shipments go to the USA. However, reviewing the "Order ID" reveals that out of 5009 distinct "Order IDs," 4195 start with the country code "CA."  

   Using a pivot table, I analyzed "Order ID" as a row and a value. By applying `COUNTUNIQUE`, I calculated the unique Order IDs and used a filter "Starts with CA" to determine the relative count of those Order IDs.  

   Since no "Order City" or similar information is available, it is reasonable to assume these orders are from Canada but shipped to the USA.  

   I extracted the country code from this column and displayed the full name as "Order State" using the following formula:  

   `=SWITCH(LEFT(B2, FIND("-", B2) - 1), "CA", "Canada", "US", "United States", "Unbekannt")`  

   3.4 Splitting the "Customer Name" Column:  
   The "Customer Name" column displays the full name, which may cause issues during searches. Therefore, I added two additional columns to split the name:  

   Last Name:  
   `=RIGHTB(F2, LENB(F2) - FIND(" ", F2))`  

   First Name:  
   `=LEFTB(F2, FIND(" ", F2) - 1)`  

   I then hid the "Customer Name" column to prevent redundancy.  

5. Data Cleaning  

   Regarding the "Order ID" column, I made a decision under section 3.3 that no cleaning is necessary. However, I would otherwise contact the stakeholder to confirm whether my assumption is correct.  

### Completion of the Assigned Tasks  

1. **Which city had the highest sales?**

   `New York City`

2. **What is the average discount for all orders?**

   `Average discount for all orders = 15.62 %`

3. **What is the most popular product among customers in the "Consumer" segment?**

   `The most popular product among customers in the "Consumer" segment is **staple envelopes**`

4. **What is the total profit for the "Office Supplies" category?**

   `The total profit is 122474`

5. **Who is the customer who has made the most purchases?**  
   *(Hint: Use the “Order ID” column to answer this question.)*

   `The customer with the most purchases is Sean Miller with the customer-id CA-2015-145317`

6. **Which state made the most profit?**

   `The state of California generated 76368 in sales`

7. **How many orders were shipped via "Standard Class" ship mode?**

   `5968 orders were shipped by "Standard Class"`

8. **Which region had the highest sales in the month of June?**

   `The "West" region made 55953, the highest sales in the month of June`

9. **Calculate the unit price for each product (before discounts) and add it in a separate column.  
   Which product is the most expensive? Note: Use the columns Quantity, Sales, and Discount.**  

   There is already a Unit Price column, but since it doesn’t indicate whether the price is before or after a discount, we need to calculate it based on the Sales value.  

   For this, I created a calculated field in the pivot table and entered the following formula:  

   `= IF(Discount = 1, Sales / Quantity, (Sales / Quantity) / (1 - Discount))`  

   **Explanation of the Formula**  

   The formula calculates the unit price either directly from sales and quantity when the discount is 100%, or reconstructs the original unit price before the discount by dividing the discounted unit price by the remaining percentage.  

   The first part of the formula ensures that there are no NULL values.  

10. **Create a pivot table that shows the total sales for each manufacturer and category combination. In the
      "Technology"** category, which manufacturer had the second highest sales?

11. **What is the subcategory of “Xerox 1887”?

12. **Create a new column that calculates the number of days between the order date and the ship date for each order
      Create a conditional formatting “color scale” for this column, from greenish to reddish.**

13. **What is the number of days between order date and shipping date for order id - “CA-2015-100363”?**

14. **What is the shipping price for order id “CA-2015-100678”?**

15. **Create a new column that concatenates the customer name, city, and state into a single string for each order.**

16. **Use the IFS function to create a new column that categorizes each order as "High," "Low," or "Loss" based on profit
      and sales criteria.*

   **"High"** is considered as:
         - If sales are above 200 and profit is above 20
         - If profit is above 40.
      For other cases:
         - If the profit is equal or below 0 this is categorized as “Loss”
         - Any other case this is categorized as "Low"

   16.1  Use conditional formatting to color the columns with the values “High” in green, the 
   value “Low” in yellow andthe value “Loss” in red.**
   
   16.2  How many “Loss” cases do you have?

   
   16.3  In a new sheet, create a dropdown of category and product which returns the price 
         for a unit (which you previously solved in exercise 9.)

         Hint:
         16.3.1   In order to make your job easier and for it to look cleaner, you should first define "named ranges" for e
                  column you will use - product name, category, unit price.

         16.3.2   Create a drop-down list of categories:
                  -  In a separate cell, use data validation to create a drop-down list of categories, 
                     using the category column in your data as the source.

                  -  In the data validation criteria, use “Dropdown (from a range)” and put the named range 
                     of your category column in there.
   
         16.3.3   In a separate sheet, use the “filter” function to filter the products based on 
                  your chosen category. Give this a named range too.

         16.3.4   Create a drop-down list of product names based on the selected category; use this name 
                  range you have created in the separate sheet.

         16.3.5   Use the INDEX MATCH function to find the corresponding product unit price. You could use this structure:

                  `=INDEX(unit_price, MATCH(1, (category=The_category_cell)*(product_name=The_product_cell), 0), 1)´

                  **Note: Unit_price, category, and product_name are named ranges.
                  Note: If the named range doesn't work, try to insert the range itself.**