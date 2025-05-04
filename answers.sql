Question 1

/* Step 1: Simulate the original data (you can replace this with your actual table)*/
WITH ProductDetail AS (
    SELECT 101 AS OrderID, 'John Doe' AS CustomerName, '["Laptop", "Mouse"]' AS Products
    UNION ALL
    SELECT 102, 'Jane Smith', '["Tablet", "Keyboard", "Mouse"]'
    UNION ALL
    SELECT 103, 'Emily Clark', '["Phone"]'
)

/* Step 2: Use JSON_TABLE to split each product into its own row*/
SELECT 
    pd.OrderID,
    pd.CustomerName,
    jt.Product
FROM 
    ProductDetail pd,
    JSON_TABLE(
        pd.Products,
        '$[*]' COLUMNS (
            Product VARCHAR(100) PATH '$'
        )
    ) AS jt;


    Question 2

/* Step 1: Create the Orders table (unique OrderID and CustomerName)*/
CREATE TEMPORARY TABLE Orders AS
SELECT DISTINCT
    OrderID,
    CustomerName
FROM 
    OrderDetails;

/* Step 2: Create the OrderItems table (remove CustomerName, keep order-product relationship)*/
CREATE TEMPORARY TABLE OrderItems AS
SELECT
    OrderID,
    Product,
    Quantity
FROM 
    OrderDetails;

