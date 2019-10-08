--Victor Chino
--Exercise 2A 2-table queries
--PropertyManager db

--2A.1)Building,Apartment tables. Sort by BuildingId, ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

--2A.2)Building, Apertment tables. Sort by BuildingId, City, BuildingName, ApartmentNum, Rent. Filter Winona

SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId AND Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC

--2A.3)Apartment, Invoice tables. Sort by ApartmentNumber, InvoiceDate. Filter:BuildingId1

SELECT        Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate, Apartment.ApartmentId
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC

--2A.4)Apartment, Invoice tables. Sort by BuildingId, ApartmentNumber.

SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId AND Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceDate

--2A.5)Apartment, Person tables. Sort by BuildingId, ApartmentNum. Alias: Admin.

SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminID = Person.PersonID AND Apartment.AdminID = Person.PersonID
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum

--2A.6)Apartment, Person tables. sort by BuildingId, TenantLastname, Tenant,FirstName.

SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName AS TenantLastname, Person.FirstName AS TenantFirstName
FROM            Apartment CROSS JOIN
                         Person
ORDER BY Apartment.BuildingId, TenantLastname, TenantFirstName

--2A.7)Invoice, LineItem tables. Sort by ApartmentId, InvoiceId.

SELECT        Invoice.ApartmentId, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2A.8)Invoice, LineItem tables. Sort by ApartmentId, InvoiceDate. Filter: Rent, Garage.

SELECT        Invoice.ApartmentId, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId AND Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Rent') OR
                         (LineItem.Description = N'Garage')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2A.9)Invoice, Receipt tables. Sort by ApartmentId, InvoiceId.

SELECT        Invoice.ApartmentId, Receipt.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId AND Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Receipt.InvoiceId