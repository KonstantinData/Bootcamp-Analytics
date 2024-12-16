## Data Exploration Process

Before addressing the data exploration questions, I first review the content of the tables to assess how the data has been entered. This includes checking for:
- Special characters  
- Multiple pieces of information within a single column  
- Null values  

Additionally, I examine the formatting of individual columns, such as:  
- **String values**  
- **Text values**  
- **Date values**  

This approach ensures a better understanding of the data structure and helps identify potential data cleaning or transformation needs.

## Customer Table Overview  

The `Customers` table contains **795 entries** and includes the following columns:  
- `customer_id`  
- `customer_name`  
- `customer_segment`  

### Customer Segments  
Customers are divided into three segments:  
1. **Consumer**  
2. **Corporate**  
3. **Home Office**  

### Data Integrity  
- There are **no null values** in the table.  
- There are **no duplicate name entries**.  
- The `customer_id` values are consistent.  

### Data Type Issue with `customer_id`  
The `customer_id` column currently uses the format `int8(64)`, which is problematic.  

In PostgreSQL, the notation **`int8(64,0)`** causes a syntax error because `BIGINT` (alias `int8`) does not support precision or scale specifications.  
This issue often occurs during data migrations from other systems, leading to:  
- Incorrect type interpretations  
- Data incompatibility  
- Unexpected behavior during queries  

### Recommendations  
To resolve this issue and prevent errors:  
- Use **`BIGINT`** for integer values.  
- Use **`NUMERIC(64,0)`** for precise numeric values.  

This ensures data compatibility and avoids syntax errors in PostgreSQL.

---

## 📊 **Data Analysis: Order Details**  

### **Column Overview:**  
The `order_details` table contains the following columns:  

1. **order_details_id**  
2. **order_id**  
3. **product_id**  
4. **quantity**  
5. **order_discount**  
6. **order_profits**  
7. **order_profit_ratio**  
8. **order_sales**  

---

### **Table Analysis:**

1. **Total Entries:**  
   - The table contains **9997 entries**.  

2. **Unique Orders:**  
   - The `order_id` column has **5013 unique values**, indicating that customers placed multiple orders.  

3. **Composition of `order_id`:**  
   - The `order_id` consists of three parts:  
     - **Country Code** (e.g., "US", "CA").  
     - **Year** (2015 to 2017).  
     - **Order Number** (numeric identifier).  

   **SQL to split the `order_id`:**  
   ```sql
   SELECT 
       SPLIT_PART(order_id, '-', 1) AS country_code,
       SPLIT_PART(order_id, '-', 2) AS year,
       SPLIT_PART(order_id, '-', 3) AS order_number
   FROM order_details;
   ```

4. **Distinct Product IDs:**  
   - The `product_id` column contains **1850 distinct values**, representing unique products in the dataset.  

5. **Null Values:**  
   - There are **no null values** in the `order_id` column.  


### **Summary:**  
The **`order_details`** table provides a comprehensive overview of order data, including order IDs, products, quantities, discounts, profits, and sales. These insights form the basis for further analysis of **order distribution**, **product performance**, and **profitability**. 🚀  

---

## 📊 **Data Analysis: Orders**  

The structure and content of the **`orders`** table were analyzed as follows:

1. **Table Structure and Entry Count:**  
   - The table contains **5013 entries**, which corresponds exactly to the **5013 unique orders** in the `order_details` table.  

2. **Table Columns:**  
   - The table includes the following columns:  
     - `order_id`  
     - `customer_id`  
     - `order_date`  
     - `shipping_city`  
     - `shipping_state`  
     - `shipping_region`  
     - `shipping_country`  
     - `shipping_code`  
     - `shipping_date`  
     - `shipping_mode`  

3. **Shipping Country:**  
   - There is **only one shipping country**, indicating all shipments occur to or from a single country.  

4. **Shipping Regions, States, and Cities:**  
   - **Shipping Regions:** 4 regions  
   - **Shipping States:** 49 states  
   - **Shipping Cities:** 531 cities  

   These findings suggest the company is likely headquartered in **Canada**, with **direct sales** in Canada and shipments exclusively to the **USA**.  

5. **Shipping Modes:**  
   - There are **4 shipping classes**:  
     - **Second Class**  
     - **Standard Class**  
     - **First Class**  
     - **Same Day**  

6. **Order and Shipping Dates:**  
   - The `order_date` and `shipping_date` fields are recorded in the format **YYYY/MM/DD:00.00.00** (date and time).  
   - However, no actual time values are captured; only the date is relevant.  

---

This analysis highlights the company's operational scope and logistics, forming the basis for further exploration into shipping efficiency and customer distribution. 🚀  

---

## 📊 **Data Analysis: Products**  

### **Table Overview:**  
The `products` table contains the following columns:  

1. **product_id**  
2. **product_name**  
3. **product_category**  
4. **product_subcategory**  
5. **product_manufacturer**  

---

### **Table Analysis:**

1. **Total Entries:**  
   - The table contains **1850 entries**, matching the **1850 distinct product IDs** in the `order_details` table.  

2. **Product Name Format:**  
   - The `product_name` column does not follow a uniform format and contains **special characters** in some entries.  

3. **Product Categories and Subcategories:**  
   - Products are divided into **3 main categories**:  
     - **Furniture**  
     - **Office Supplies**  
     - **Technology**  

   - These categories are further split into **17 subcategories**, including:  
     - Tables, Art, Bookcases, Storage, Fasteners, Envelopes, Appliances, Accessories, Paper, Phones, Binders, Copiers, Labels, Supplies, Chairs, Machines, and Furnishings.  

4. **Product Manufacturers:**  
   - There are **183 distinct product manufacturers** in the dataset.  

5. **Null Values:**  
   - There are **no null values** in any column.  

---

### **Summary:**  
The **`products`** table provides detailed information about the product catalog, including product IDs, names, categories, subcategories, and manufacturers. The data is clean with no null values, but inconsistencies in `product_name` formatting may require standardization for further analysis. 🚀  