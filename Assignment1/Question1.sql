use NeenOpal;
Select * from data1;

--Q1 .How to identify the Records (Order ID + Product ID combination) present in data1 but missing in data2 

SELECT count(*) as Missing_from_data2--data1.Order_ID, data1.Product_ID
FROM data1
LEFT JOIN data2 ON Data1.Order_ID = data2.Order_ID AND data1.Product_ID = data2.Product_ID
WHERE data2.Order_ID IS NULL AND data2.Product_ID IS NULL;

SELECT COUNT(*) AS Missing_from_data2
FROM (
    SELECT Order_ID, Product_ID FROM data1
    EXCEPT
    SELECT Order_ID, Product_ID FROM data2
) AS MissingRows;




--Q2.How to identify the Records (Order ID + Product ID combination) 
--missing in data1 but present in data2 (Specify the number of records missing in your answer)

SELECT count(*)as MissingFromdata1--Data2.Order_ID, Data2.Product_ID
FROM Data2
LEFT JOIN Data1 ON Data1.Order_ID = Data2.Order_ID AND Data1.Product_ID = Data2.Product_ID
WHERE Data1.Order_ID IS NULL AND Data1.Product_ID IS NULL;



--Q3.Find the Sum of the total Qty of Records missing in data1 but present in data2
SELECT SUM(Data2.Qty) AS TotalQtyMissingInData1
FROM Data2
LEFT JOIN Data1 ON Data1.Order_ID = Data2.Order_ID AND Data1.Product_ID = Data2.Product_ID
WHERE Data1.Order_ID IS NULL AND Data1.Product_ID IS NULL;


--4.Find the total number of unique records (Order ID + Product ID combination) present
--in the combined dataset of data1 and data2

SELECT COUNT(DISTINCT Order_ID + '-' + Product_ID) AS TotalUniqueRecords
FROM (
    SELECT Order_ID, Product_ID FROM Data1
    UNION
    SELECT Order_ID, Product_ID FROM Data2
) CombinedData;




-- Specify the number of records missing in data2
SELECT COUNT(*) AS MissingRecordsCount
FROM data2 AS d1
WHERE NOT EXISTS (
    SELECT 1
    FROM data1 AS d2
    WHERE CONCAT(d1.[Order_ID], d1.[Product_ID]) = CONCAT(d2.[Order_ID], d2.[Product_ID])
);



