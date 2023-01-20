

SELECT  breed.description as "Breed", COUNT(dog.id) as "Number of ", birthyear as "time"
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id
GROUP BY breed.description, "time"
ORDER BY "time" ASC

SELECT COUNT(*) as "Number of Dogs", birthyear as time
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id
WHERE breed.description = '$breeddropdown'
GROUP BY birthyear

SELECT kreis.description as "Kreis", COUNT(kreis.id) as "Number of Dogs"
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN kreis ON dogowner.kreisid = kreis.id
WHERE dog.breedstatusid = 1 AND breed.description = '$breeddropdown'
GROUP BY kreis.description, kreis.id
ORDER BY COUNT(kreis.id) DESC
LIMIT 1;

SELECT quartier.description as "Quartier", COUNT(quartier.id) as "Number of Dogs"
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN quartier ON dogowner.quartierid = quartier.id
WHERE dog.breedstatusid = 1 AND breed.description = '$breeddropdown'
GROUP BY quartier.description, quartier.id
ORDER BY COUNT(quartier.id) DESC
LIMIT 1;

SELECT COUNT(*) as "Number of Dogs", birthyear as time
FROM dog
GROUP BY birthyear

SELECT breed.description, count(breedid1) as breeds
FROM dog
inner join breed on dog.breedid1 = breed.id WHERE dog.breedstatusid = 1
GROUP by dog.breedid1, breed.description
ORDER By breeds DESC

SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN quartier ON dogowner.quartierid = quartier.id
WHERE dog.breedstatusid = 1 AND quartier.description = '$quartierdropdown'
GROUP BY dog.breedid1, breed.description
ORDER BY breeds DESC

SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN kreis ON dogowner.kreisid = kreis.id
WHERE dog.breedstatusid = 1 AND kreis.description = '$kreisdropdown'
GROUP BY dog.breedid1, breed.description
ORDER BY breeds DESC

SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN kreis ON dogowner.kreisid = kreis.id
WHERE dog.breedstatusid = 1 AND kreis.description = '$kreisdropdown'
GROUP BY dog.breedid1, breed.description
ORDER BY breeds ASC

SELECT breed.description, count(breedid1) as breeds
FROM dog
INNER JOIN breed ON dog.breedid1 = breed.id 
INNER JOIN dogowner ON dog.ownerid = dogowner.id
INNER JOIN quartier ON dogowner.quartierid = quartier.id
WHERE dog.breedstatusid = 1 AND quartier.description = '$quartierdropdown'
GROUP BY dog.breedid1, breed.description
ORDER BY breeds ASC