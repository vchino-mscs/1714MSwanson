--Victor Chino
--Exercise 2B Summary queries
--PropertyManager db
--2B.1) Count all buildings
SELECT        COUNT(*) AS [Count All Buildings]
FROM            Building


--2B.2) Count buildings in Winona
SELECT        COUNT(*) AS [Count Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')


--2B.3) Average rent of all apartments
SELECT        AVG(Rent) AS [Avg Rent Of All Apartments]
FROM            Apartment


--2B.4) Total rent apartments building 1
SELECT        SUM(Rent) AS [Total Rent Building 1]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)


--2B.5) Apartment cheapest rent building 2
SELECT        MIN(Rent) AS [Cheapest Rent Building 2]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 2)


--2B.6) Smallest size, average size, largest size building 1
SELECT        MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Average Size], MAX(SquareFeet) AS [Largest Size]
FROM            Apartment
GROUP BY BuildingId
HAVING        (BuildingId = 1)


--2B.7) Cheapest price for garage
SELECT        MIN(Amount) AS [Cheapest Garage]
FROM            LineItem

--2B.8) Total amount billed for gas
SELECT        SUM(Amount) AS [Total Billed For Gas]
FROM            LineItem

--2B.9) Total Rent October

SELECT        SUM(Amount) AS [Total October Rent]
FROM            LineItem