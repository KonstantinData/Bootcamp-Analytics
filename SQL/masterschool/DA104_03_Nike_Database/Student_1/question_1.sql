/*
What is the number of order items by each business unit (Nike Official and Nike Vintage)?

output Nike Official AS "Business Unit" and COUNT(order_items) AS "Number of Items"
output Nike Vintage AS "Business Unit" and COUNT(order_items) AS "Number of Items"
using UNION
*/

SELECT 
		'Nike Official' AS "Business Unit", 
    COUNT(order_items) AS "Number of Items"
FROM order_items
UNION
SELECT 
		'Nike Vintage' AS "Business Unit", 
    COUNT(order_items_vintage) AS "Number of Items"
FROM order_items_vintage;


/*
Here are **10 key points** summarizing the exercise and your solution:

1. **Objective**: The exercise calculates the total number of order items for two distinct 
business units, "Nike Official" and "Nike Vintage," from two separate tables.

2. **Query Structure**: The solution uses a **UNION** query to combine results from two SELECT 
statements, each corresponding to a specific business unit.

3. **Business Unit Identification**: Each SELECT statement includes a static string 
(`'Nike Official'` or `'Nike Vintage'`) to label the corresponding business unit in the output.

4. **Counting Items**: The `COUNT()` function is used in each query to calculate the total number 
of rows (order items) in the respective tables, `order_items` and `order_items_vintage`.

5. **Output**: The query produces a combined table with two rows, one for each business unit, 
displaying the total number of items alongside the business unit name.

6. **UNION Operator**: The **UNION** operator merges the results of both SELECT queries into a 
single dataset, ensuring distinct rows in the final output.

7. **Column Alignment**: Both SELECT statements produce results with identical column names and types, 
which is required for the UNION to work.

8. **Literal Values**: Strings (`'Nike Official'` and `'Nike Vintage'`) are used in the SELECT statements 
to create a column explicitly labeling the business unit.

9. **Assumptions**: The query assumes the `order_items` and `order_items_vintage` tables have consistent 
schema and that their counts represent the desired metrics without filtering.

10. **Potential Optimization**: If the column names differ between the tables, additional alignment may be 
necessary. Using `COUNT(*)` instead of `COUNT(column_name)` could simplify the query if all rows are relevant.
*/
