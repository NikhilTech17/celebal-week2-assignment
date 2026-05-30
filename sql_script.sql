/*Step 1
check table structure*/
PRAGMA table_info(superstore);

/*View first 10 rows*/
SELECT * 
FROM superstore
LIMIT 10;



/*step 2: Validate Data
Total rows*/
SELECT COUNT(*) AS total_rows
FROM superstore;

/*Check missing values*/
SELECT *
FROM superstore
WHERE Sales IS NULL
   OR Quantity IS NULL;
   


/*Step 3: Apply WHERE Filters
Filter by Region*/
SELECT *
FROM superstore
WHERE Region = 'West';

/*Filter by Category*/
SELECT *
FROM superstore
WHERE Category = 'Furniture';

/*Filter by Sales Amount*/
SELECT *
FROM superstore
WHERE Sales > 1000;

/*Filter by Date*/
SELECT *
FROM superstore
WHERE Order_Date >= '2023-01-01';



/*Step 4: Aggregations using GROUP BY
Total Sales by Region*/
SELECT Region,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region;

/*Total Quantity by Category*/
SELECT Category,
       SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY Category;

/*Average Sales by Category*/
SELECT Category,
       AVG(Sales) AS Avg_Sales
FROM superstore
GROUP BY Category;



/*Step 5: Sort and Limit Results
Top 10 Products by Sales*/
SELECT "Product Name",
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;*/

/*Top Categories by Sales*/
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;



/*Step 6: Business Use Cases*/
/*Monthly Sales Trend*/
SELECT strftime('%Y-%m', "Order Date") AS Month,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

/*Top 10 Customers*/
SELECT "Customer Name",
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

/*Find Duplicate Records*/
SELECT *,
       COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY Order_ID, Product_Name
HAVING COUNT(*) > 1;



/*Step 7: Final Validation*/
/*Count Records by Region*/
SELECT Region,
       COUNT(*) AS Total_Records
FROM superstore
GROUP BY Region;

/*Sales Range Check*/
SELECT MIN(Sales) AS Min_Sales,
       MAX(Sales) AS Max_Sales
FROM superstore;



