--Victor Chino.
--Exercixe 2F: Animal Shelter test queries.
--Animal Shelter  db

--2F.1)All Animals
SELECT        Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Owner
FROM            Animals INNER JOIN
                         People ON Animals.Person_Id = People.Id INNER JOIN
                         AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id

--2F.2)Cash Donations
SELECT        People.LastName + N' ' + People.FirstName AS Donor, Donations_1.DonationDate, Donations.Value AS Amount
FROM            Donations CROSS JOIN
                         People CROSS JOIN
                         Donations AS Donations_1
GROUP BY People.LastName + N' ' + People.FirstName, Donations_1.DonationDate, Donations.Value

--2F.3)Total donations for each donor
SELECT        Donations.Id, People.LastName AS Donor, SUM(DISTINCT Donations.Value) AS [Total Donations]
FROM            Donations CROSS JOIN
                         People
GROUP BY Donations.Id, People.LastName

--2F.4)Number of dogs for each owner
SELECT        Animals.Id, People.LastName + N' ' + People.FirstName AS Owner, SUM(Animals.AnimalType_Id) AS [Number Of Dogs]
FROM            Animals CROSS JOIN
                         People
GROUP BY Animals.Id, People.LastName + N' ' + People.FirstName