----Victor Chino
--Exercise 2F Animal Shelter test queries
--AnimalShelter db 


--2F.1)All Animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM            Animals INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                         People ON Animals.Person_Id = People.Id

--2F.2)Cash Donations
SELECT        People.LastName + N' ' + People.FirstName AS Donor, Donations.DonationDate, Donations.Value AS Amount
FROM            Donations INNER JOIN
                         People ON Donations.Person_Id = People.Id INNER JOIN
                         DonationTypes ON Donations.DonationType_Id = DonationTypes.Id
GROUP BY Donations.DonationDate, DonationTypes.Description, Donations.Value, People.LastName + N' ' + People.FirstName
HAVING        (DonationTypes.Description = N'CASH') AND (Donations.DonationDate > CONVERT(DATETIME, '2018-10-01 00:00:00', 102)) OR
                         (Donations.DonationDate < CONVERT(DATETIME, '2018-10-31 00:00:00', 102))


--2F.3) Total Donations For Each Donor
SELECT        People.Id, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM            People INNER JOIN
                         Donations ON People.Id = Donations.Person_Id
GROUP BY People.Id, People.FirstName + N' ' + People.LastName


--2F.4) Number Of Dogs For Each OWner
SELECT        Animals.Person_Id AS Id, People.LastName + N',' + N' ' + People.FirstName AS Owner, AnimalTypes.Id AS [Number Of Dogs]
FROM            Animals INNER JOIN
                         People ON Animals.Person_Id = People.Id INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id
WHERE        (AnimalTypes.Type = N'Dog')
GROUP BY Animals.Person_Id, AnimalTypes.Id, People.LastName + N',' + N' ' + People.FirstName
ORDER BY People.LastName + N',' + N' ' + People.FirstName