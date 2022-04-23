SELECT C.CustomerKey,
P.ProductKey,
T.SalesTerritoryKey,
OrderDate,
FullName,
Gender,
Occupation,
YearlyIncome,
ProductName,
SubCategory,
Category,
Region,
Country,
OrderQuantity,
UnitPrice, 
SalesAmount,
TaxAmount,
SalesAmount - TaxAmount AS SalesAfterTax,  
CASE
  WHEN YearlyIncome >= 60000
  THEN 'High Earner'
  WHEN YearlyIncome BETWEEN 40000 AND 60000 
  THEN 'Average Earner'
  ELSE 'Low Earner'
  END AS IncomeProfile
  FROM dbo.CustomerDemographics AS C
  JOIN dbo.Sales AS S
  ON C.CustomerKey = S.CustomerKey
  JOIN dbo.Products as P
  ON P.ProductKey =  s.ProductKey
  JOIN dbo.Territories as T
  ON T.SalesTerritoryKey = S.SalesTerritoryKey
  WHERE SalesAmount IS NOT NULL
  ORDER BY OrderQuantity DESC
