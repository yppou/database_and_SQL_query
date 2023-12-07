SELECT CONCAT(DC.FirstName,' ',DC.LastName) AS "CUSTOMER NAME",
DC.Phone,DC.EmailAddress,
FIS.OrderQuantity,
SUM(FIS.TotalProductCost) AS "TOTAL COST",
FIS.OrderDate,DC.CustomerKey
FROM DimCustomer DC JOIN FactInternetSales FIS ON DC.CustomerKey=FIS.CustomerKey
WHERE DC.FirstName LIKE 'P%'  AND DC.CustomerKey>=29000
GROUP BY DC.FirstName,DC.LastName,DC.Phone,DC.EmailAddress,FIS.OrderQuantity,FIS.OrderDate,DC.CustomerKey
HAVING SUM(FIS.TotalProductCost)>=1000
ORDER BY 5 ASC;