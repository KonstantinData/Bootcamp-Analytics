Here is the optimized version of your **Phase 1 Documentation** in **US English** for clear, readable, and structured presentation:

---

# **Phase 1: Data Exploration Process**

## **1. General Approach**

Before addressing specific data analysis questions, I conduct an **initial data review** to understand the structure and quality of the dataset. This includes identifying potential cleaning needs:

- **Checks performed:**  
   - Special characters  
   - Multiple pieces of information in a single column  
   - Null values  

- **Column format validation:**  
   - **String and text values**  
   - **Date values**  

---

## **2. Customer Table**

### **Overview**
- **Total Entries:** 795  
- **Columns:**
   - `customer_id`  
   - `customer_name`  
   - `customer_segment`  

### **Customer Segments**
Customers are divided into three segments:  
1. **Consumer**  
2. **Corporate**  
3. **Home Office**  

### **Data Integrity**
- **No null values** detected  
- **No duplicate names** in the table  
- The `customer_id` column contains consistent values  

### **Data Issue: `customer_id`**
- **Current Format:** `int8(64)`  
   - This leads to a **PostgreSQL syntax error** because `BIGINT` (alias `int8`) does not support precision or scale specifications.  
   - Likely cause: Data migration from another system.  

### **Recommendation**
- Use **`BIGINT`** for integer values.  
- Use **`NUMERIC(64,0)`** for precise numeric values.  

---

## **3. Order Details Table**

### **Column Overview**
The `order_details` table includes the following columns:  
- `order_details_id`  
- `order_id`  
- `product_id`  
- `quantity`  
- `order_discount`  
- `order_profits`  
- `order_profit_ratio`  
- `order_sales`  

### **Analysis Results**
1. **Total Entries:** 9,997  
2. **Unique Orders:** 5,013 (`order_id`)  
3. **Structure of `order_id`:**  
   - **Country Code** (e.g., US, CA)  
   - **Date** (2015-01-03 – 2018-12-30)  
   - **Order Number**  

   **SQL to split `order_id`:**  
   ```sql
   SELECT 
       SPLIT_PART(order_id, '-', 1) AS country_code,
       SPLIT_PART(order_id, '-', 2) AS year,
       SPLIT_PART(order_id, '-', 3) AS order_number
   FROM order_details;
   ```

4. **Unique Products:** 1,850 (`product_id`)  
5. **Null Values:** None detected in the `order_id` column.  

---

## **4. Orders Table**

### **Structure & Analysis**
- **Total Entries:** 5,013  
- **Columns:**  
   - `order_id`, `customer_id`, `order_date`, `shipping_city`, `shipping_state`,  
     `shipping_region`, `shipping_country`, `shipping_code`, `shipping_date`, `shipping_mode`  

### **Shipping Insights**
- **Single Shipping Country:** All shipments occur to or from one country (likely the USA).  
- **Regions, States, and Cities:**  
   - **Regions:** 4  
   - **States:** 49  
   - **Cities:** 531  

### **Shipping Modes**
There are four distinct shipping modes:  
1. **Second Class**  
2. **Standard Class**  
3. **First Class**  
4. **Same Day**  

### **Date Format**
- **Format:** YYYY/MM/DD:00.00.00  
- **Note:** The time values are irrelevant; only the date is meaningful.  

---

## **5. Products Table**

### **Overview**
- **Total Entries:** 1,850  
- **Columns:**  
   - `product_id`  
   - `product_name`  
   - `product_category`  
   - `product_subcategory`  
   - `product_manufacturer`  

### **Analysis Results**
1. **Product Names:**  
   - Inconsistent formatting with **special characters** in some entries.  

2. **Product Categories:**
   - **Three Main Categories:**  
      - Furniture  
      - Office Supplies  
      - Technology  

   - Divided into **17 Subcategories**, including:  
      Tables, Chairs, Copiers, Paper, Accessories, Binders, and more.  

3. **Manufacturers:**  
   - 183 unique manufacturers in the dataset.  

4. **Null Values:** None detected in any column.  

---

## **Summary**

The table analyses provide a clear understanding of the dataset's structure and integrity while identifying:  
- **Potential data issues** (e.g., incorrect data types in `customer_id`).  
- **Unique entries** and **consistent data** across tables.  
- **Key insights** related to orders, products, and shipping operations.  

These results lay the groundwork for further analysis of **order distribution**, **product performance**, and **shipping efficiency**. 🚀  

---

This version enhances readability with:  
1. **Logical structure** and clear sections.  
2. **Bullet points** for concise information.  
3. **Code blocks** for SQL queries.  
4. **Consistent formatting** for key terms and numbers.  
