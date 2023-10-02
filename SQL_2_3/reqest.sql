-- первый запрос
SELECT Customers.FirstName,
       Customers.LastName
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerID
HAVING max(TotalAmount)


--второй запрос
SELECT Customers.FirstName,
       Customers.LastName,
       Orders.OrderID,
       Orders.TotalAmount
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerID
HAVING max(TotalAmount)
ORDER BY Orders.TotalAmount DESC


--третий запрос
SELECT Customers.FirstName,
       Customers.LastName
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CustomerID
WHERE TotalAmount>avg(SELECT TotalAmount
                      FROM Orders))
