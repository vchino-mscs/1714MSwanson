----Victor Chino
--Exercise 2C Summary queries, groups, joins.
--PropertyManager db

--2C.1) State, city, count buildings.
SELECT        State, City, COUNT(BuildingId) AS [Count Buildings]
FROM            Building
GROUP BY State, City


--2C.2) City, count buildings.
SELECT        City, COUNT(*) AS [Count Buildings]
FROM            Building
GROUP BY City, State
HAVING        (State = N'MN')
ORDER BY City


--2C.3)BuildingId, BuildingName, Apartment, Average rent.
SELECT        Building.BuildingId, Building.BuildingName, AVG(Apartment.Rent) AS [Average Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingId, Building.BuildingName


--2C.4)City, BuildingName, total apartment rent.
SELECT        Building.City, Building.BuildingName, SUM(Apartment.Rent) AS [Total Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City, Building.BuildingName


--2C.5)Cheapest Rent.
SELECT        Building.City, MIN(Apartment.Rent) AS [Cheapest Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
GROUP BY Building.City


--2C.6)BuildingName, smallests size, avg size, largest size.
SELECT        Building.BuildingName, MIN(Apartment.SquareFeet) AS [Smallest Size], AVG(Apartment.SquareFeet) AS [Average Size], MAX(Apartment.SquareFeet) AS [Largest Size]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
GROUP BY Building.BuildingName, Building.City, Apartment.TenantID
HAVING        (Building.City = N'Winona') AND (Apartment.TenantID IS NULL)


--2C.7)InvoiceId, cheapest price.
SELECT        MIN(LineItem.Amount) AS [Cheapest Garage September 2018]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceDate, LineItem.Description
HAVING        (Invoice.InvoiceDate >= CONVERT(DATETIME, '2018-09-01 00:00:00', 102)) AND (LineItem.Description = N'Garage') AND (MIN(Invoice.InvoiceId) = 10001) OR
                         (MIN(Invoice.InvoiceId) = 10002) OR
                         (MIN(Invoice.InvoiceId) = 10003)


--2C8.)InvoiceId, total amount billed
SELECT        Invoice.InvoiceId, SUM(LineItem.Amount) AS [Total Amount Billed]
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceDate, Invoice.InvoiceId
HAVING        (Invoice.InvoiceDate >= CONVERT(DATETIME, '2018-09-01 00:00:00', 102)) AND (Invoice.InvoiceId = 10001) OR
                         (Invoice.InvoiceId = 10002) OR
                         (Invoice.InvoiceId = 10003)