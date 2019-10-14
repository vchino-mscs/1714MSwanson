----Victor Chino
--Exercise 2D Multi-table join queries.
--PropertyManager db
--2D.1) Buildings, apartments, administrators. 
--10/14/2019


--2D2.)Tenants, buildings, apartments.
SELECT        Person.PersonID, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM            Person INNER JOIN
                         Apartment ON Person.PersonID = Apartment.TenantID AND Person.PersonID = Apartment.TenantID INNER JOIN
                         Building ON Apartment.BuildingId = Building.BuildingId AND Apartment.BuildingId = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum


--2D.3)Apertment, tenant, invoice, line items. Filter: Building Id=1.
SELECT        Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate


--2D.4)Apartment, tenant, invoice total. 
SELECT        Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate


--2D.5)Invoice, tenant, receipt.
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId AND Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId AND Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.TenantID = Person.PersonID
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate


--2D.6)Invoice, tenant, apartment, billed, received.
SELECT        Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, SUM(Receipt.Amount) AS [Total Billed], Receipt.Amount AS Received
FROM            Invoice INNER JOIN
                         Apartment ON Invoice.ApartmentId = Apartment.ApartmentId AND Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID AND Apartment.TenantID = Person.PersonID INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId AND Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Apartment.BuildingId, Apartment.ApartmentNum, Receipt.Amount


--2D.7)Administrator, invoice, total billed, received.
SELECT        Person.PersonID, Person.LastName AS Admin, Receipt.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Received
FROM            LineItem INNER JOIN
                         Invoice ON LineItem.InvoiceId = Invoice.InvoiceId AND LineItem.InvoiceId = Invoice.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId AND Invoice.InvoiceId = Receipt.InvoiceId CROSS JOIN
                         Person
GROUP BY Person.PersonID, Invoice.InvoiceDate, Receipt.InvoiceId, Receipt.Amount, Person.LastName
HAVING        (Person.PersonID = 5) AND (Person.LastName = N'swanson')