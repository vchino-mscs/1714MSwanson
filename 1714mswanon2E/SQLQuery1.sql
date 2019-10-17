----Victor Chino
--Exercise 2E Functions, calculated fields.
--PropertyManager db 
--10/14/2019


--2E.1)Building Name and location.
SELECT        BuildingName, Address, 'Winona,' + ' ' + 'MN' + ' ' + '55987' AS [City State Zip]
FROM            Building
WHERE        (City = N'Winona') OR
                         (City = N'MN') OR
                         (City = N'55987')


--2E.2)Apartment estimated rent.
SELECT        Building.BuildingName, Apartment.ApartmentNum, AVG(Apartment.SquareFeet * .90 + 100 * Apartment.Bathrooms) AS [Estimated Rent]
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId AND Apartment.BuildingId = Building.BuildingId CROSS JOIN
                         LineItem
WHERE        (Building.City = N'Red Wing')
GROUP BY Building.BuildingName, Apartment.ApartmentNum
HAVING        (AVG(Apartment.Bathrooms + 100) >= 1)



--2E.3) Estiimated vs actual rent.
SELECT        Building.BuildingName, Apartment.ApartmentNum, AVG(Apartment.Rent) AS Rent, AVG(Apartment.SquareFeet * .90 + 100 * Apartment.Bathrooms) AS [Estimated Rent], 
                         MIN(Apartment.SquareFeet * .90 + 100 * Apartment.Bathrooms - Apartment.Rent) AS Difference
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId AND Apartment.BuildingId = Building.BuildingId CROSS JOIN
                         LineItem
WHERE        (Building.City = N'Red Wing') AND (Apartment.Bathrooms + 100 >= 1)
GROUP BY Building.BuildingName, Apartment.ApartmentNum



--2E.4)Invoice total.
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Total
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.FirstName + N' ' + Person.LastName
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-01-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-12-31 00:00:00', 102))

--2E.5)Invoice total and receipt
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], SUM(LineItem.Amount) AS Total
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.FirstName + N' ' + Person.LastName
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-01-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-12-31 00:00:00', 102))

--2E.6)Invoice total vs received
SELECT        Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], MIN(LineItem.Amount) AS Received, 
                         LineItem.Amount.Received - LineItem.Amount AS Difference
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate, Person.FirstName + N' ' + Person.LastName, LineItem.Amount.Received - LineItem.Amount
HAVING        (Invoice.InvoiceDate BETWEEN CONVERT(DATETIME, '2018-10-01 00:00:00', 102) AND CONVERT(DATETIME, '2018-10-31 00:00:00', 102)) AND (Apartment.ApartmentNum = N'102')