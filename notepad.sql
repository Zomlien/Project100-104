SELECT DISTINCT
description
FROM
  breed 
inner join dog on dog.breedid1 = breed.id 
inner join dogowner on dogowner.id = dog.ownerid



SELECT breed.description, count(breedid1) as breeds
FROM dog
inner join breed on dog.breedid1 = breed.id WHERE dog.breedstatusid = 1 
inner join dogowner on dog.ownerid = dogowner.id breed
inner join kreis on dogwoner.kreisid = kreis.id WHERE description='Kreis 1'
GROUP by dog.breedid1, breed.description
ORDER By breeds DESC

CREATE VIEW vTopBreed AS
SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN kreis ON dogowner.kreisid = kreis.id
WHERE dog.breedstatusid = 1
GROUP BY dog.breedid1, breed.description
ORDER BY breeds DESC

SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN quartier ON dogowner.quartierid = quartier.id
WHERE dog.breedstatusid = 1 AND quartier.description = 'Werd'
GROUP BY dog.breedid1, breed.description
ORDER BY breeds DESC

SELECT kreis.description,  COUNT (kreis.id), quartier.description, COUNT (Quartier.id)
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN quartier ON dogowner.quartierid = quartier.id
INNER JOIN kreis ON dogowner.kreisid = kreis.id
WHERE dog.breedstatusid=1 AND breed.description = 'Malteser'
GROUP BY kreis.description, quartier.description, kreis.id, quartier.id