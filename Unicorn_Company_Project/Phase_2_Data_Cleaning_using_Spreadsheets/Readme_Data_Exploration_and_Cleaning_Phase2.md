# 📝 **Analysis with Spreadsheets**

---

## 📁 **Project Data**
The table in CSV format was created based on the 20 exploratory questions from Phase 1. 
All columns included in the queries form the basis for this file.

---

## 🔎 **Introduction**

This project focuses on utilizing **Google Spreadsheets** for data analysis. Before diving into unguided data exploration, I addressed several structured questions to derive actionable insights. The questions were approached collaboratively within a team or individually, with documentation of the methods applied.

The task also included identifying key **differences between databases and spreadsheets**:

### 📊 **Differences Between Database and Spreadsheet Columns**
- **Missing Columns in Spreadsheet**:  
   - `Customer_id`: Names of customers in each row made IDs redundant.  
   - `Shipping_postal_code`: Considered non-essential as orders were shipped.  
   - `Shipping_country`: All orders originated in the USA.  
   - `Order_details_id`: Details per row rendered this column redundant.  
   - `Product_id`: Specific products are described in each row.  

- **Additional Column in Spreadsheet**:  
   - `Shipping_price`: Added post-shipment for further analysis.  

These differences highlight how relational databases and spreadsheets differ in managing and visualizing data.

---

## 🏎️ **Questions Answered**

1. **What was the city with the highest sales?**  
2. **What is the average discount given for all orders?**  
3. **What is the most popular product among customers in the "Consumer" segment?**  
4. **What is the total profit made for the "Office Supplies" category?**  
5. **Who is the customer who has made the most purchases?**  
6. **What state made the most profit?**  
7. **How many orders were shipped via "Standard Class" ship mode?**  
8. **Which region had the highest sales in June?**  
9. **Calculate the price per unit of each product (before discounts).**  
    - *What is the most expensive product?*  
10. **Create a pivot table of total sales by manufacturer and category.**  
    - *Which manufacturer had the second highest sales in "Technology"?*  
11. **What is the subcategory of “Xerox 1887”?**  
12. **How many days between order and ship date? Add conditional formatting (color scale).**  
13. **What is the number of days for order ID “CA-2015-100363”?**  
14. **What is the shipping price for order ID “CA-2015-100678”?**  
15. **Create a column combining customer name, city, and state into a single string.**  
16. **Categorize orders using the IFS function into “High,” “Low,” or “Loss” based on profit and sales.**  
    - *Add conditional formatting*:  
      - High → Green  
      - Low → Yellow  
      - Loss → Red  
    - *How many “Loss” cases exist?*  
17. **Create a dropdown list of category and product to return unit prices dynamically.**  

---

## 📊 **Advanced Insights (Optional)**  
- Create a dashboard for total sales, profit, and average discount by region.  
- Develop a monthly analysis sheet with visualizations for sales and profit margins.  
- Build a dynamic “Profit per Year” dashboard with:  
    - Top and bottom profitable subcategories.  
    - Top and bottom customers.  
    - Key metrics: sum of positive/negative profit, order counts.  
    - Histogram and line charts for monthly profits.  

---

## 🧰 **Tools and Methods**
- **Spreadsheet Functions**: IFS, INDEX MATCH, FILTER, conditional formatting.  
- **Pivot Tables**: To aggregate and summarize data.  
- **Named Ranges**: For dynamic dropdowns.  
- **Dynamic Dashboards**: Visualizing trends and KPIs.  

---

## 📎 **Deliverables**
- Link to Google Spreadsheet with answers, new columns, and pivot tables.  
- A detailed explanation of methods used for each question.  