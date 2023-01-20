-- Create DB and table
CREATE DATABASE Dogs;

CREATE TABLE dogall
(
    
    CutoffDate  INT,
    OwnerId     INT,
    AgeOwner    VARCHAR(100),
    SexId       INT,
    Sex         Varchar (50),
    KreisId     INT,
    Kreis       VARCHAR (100),
    QuartierId  INT,
    Quartier    VARCHAR (100),
    Breed1      VARCHAR (100),
    Breed2      VARCHAR (100),
    BreedStatusId   INT,
    BreedStatus VARCHAR (100),
    BreedType   VARCHAR(100),
    BreedTypeId INT,
    BirthYearDog    INT,
    SexDogId    INT,
    ColorDog    Varchar(100)
);

-- import csv and add dogId into table dogal

ALTER TABLE dogall ADD dogid Serial PRIMARY KEY;

-- Normalisieren der DB

CREATE TABLE AgeClass
(
    Id  Serial PRIMARY KEY,
    Description    VARCHAR(100)    
);

CREATE TABLE Sex
(
    Id  INT,
    Description    VARCHAR(100)    
);

CREATE TABLE Kreis
(
    Id  Int,
    Description    VARCHAR(100)    
);

CREATE TABLE Quartier
(
    Id  Int,
    Description    VARCHAR(100)    
);

CREATE TABLE Breed
(
    Id  Serial PRIMARY KEY,
    Description    VARCHAR(100)    
);

CREATE TABLE BreedStatus
(
    Id  Int,
    Description    VARCHAR(100)    
);

CREATE TABLE BreedType
(
    Id  Int,
    Description    VARCHAR(100)    
);

Create TABLE DogOwner
(
    Id Serial PRIMARY Key,
    OwnerId INT,
    AgeClassId INT CONSTRAINT AgeClassId REFERENCES AgeClass(Id),
    SexId INT CONSTRAINT SexId REFERENCES Sex(Id),
    KreisId INT CONSTRAINT KreisId REFERENCES Kreis(Id),
    QuartierId INT CONSTRAINT QuartierId REFERENCES Quartier(Id)
);

CREATE TABLE dog
(
    Id Serial PRIMARY Key,
    ownerid INT CONSTRAINT ownerid REFERENCES dogowner(id)
    BreedId1 INT CONSTRAINT BreedId1 REFERENCES Breed(Id),
    BreedId2 INT CONSTRAINT BreedId2 REFERENCES Breed(Id),
    BreedTypeId INT CONSTRAINT BreedTypeId REFERENCES BreedType(Id),
    BreedStatusId INT CONSTRAINT BreedStatusId REFERENCES BreedStatus(Id),
    SexId INT CONSTRAINT SexId REFERENCES Sex(Id),
    Color   VARCHAR(100) CONSTRAINT ColorId REFERENCES Color(Id),
    CutoffDate INT,
    BirthYear   INT
);

CREATE TABLE color
(
    Id  serial PRIMARY KEY,
    Description    VARCHAR(100)    
);

-- fill new tables with data from dogall

INSERT INTO AgeClass(Description)
SELECT DISTINCT AgeOwner FROM dogall;

INSERT INTO Sex values 
(1, 'männlich'),
(2, 'weiblich');

INSERT INTO Kreis(Id)
SELECT DISTINCT KreisId FROM dogall;


Update kreis SET description = 
(SELECT DISTINCT Kreis FROM dogall WHERE Id = KreisId);

INSERT INTO Quartier(Id)
SELECT DISTINCT QuartierId FROM dogall;


Update Quartier SET description = 
(SELECT DISTINCT Quartier FROM dogall WHERE Id = QuartierId);

INSERT INTO Breed(Description)
SELECT DISTINCT Breed1 AND Breed2 FROM dogall;

INSERT INTO BreedStatus(Id)
SELECT DISTINCT BreedStatusId FROM dogall;

Update BreedStatus SET description = 
(SELECT DISTINCT BreedStatus FROM dogall WHERE Id = BreedStatusId);

INSERT INTO BreedType(Id)
SELECT DISTINCT BreedTypeId FROM dogall;

Update BreedType SET description = 
(SELECT DISTINCT BreedType FROM dogall WHERE Id = BreedTypeId);

INSERT INTO color(description)
SELECT DISTINCT colordog FROM dogall;

-- fill table dog

--dogbreed
ALTER TABLE dogall ADD Breed1Id int;
ALTER TABLE dogall ADD Breed2Id int;


Update dogall SET Breed1Id =
(SELECT Id FROM Breed WHERE Breed.description = dogall.breed1 );

Update dogall SET Breed2Id =
(SELECT Id FROM Breed WHERE Breed.description = dogall.breed2 );

SELECT dogall.Breed1, breed.id FROM breed INNER JOIN dogall ON breed.description = dogall.breed1;

INSERT INTO dog(BreedId1) SELECT Breed1Id FROM dogall;

UPDATE dog SET BreedId2 = dogall.breed2id  FROM dogall WHERE dog.Id = dogall.dogid;

--dogcolor
ALTER TABLE dogall ADD colorId int;  

Update dogall SET colorId =
(SELECT Id FROM color WHERE color.description = dogall.colordog );

UPDATE dog SET colorId = dogall.colorid  FROM dogall WHERE dog.Id = dogall.dogid;

-- everythinfg else

UPDATE dog SET breedtypeid = dogall.breedtypeid  FROM dogall WHERE dog.Id = dogall.dogid;

UPDATE dog SET breedstatusid = dogall.breedstatusid  FROM dogall WHERE dog.Id = dogall.dogid;

UPDATE dog SET sexid = dogall.sexdogid  FROM dogall WHERE dog.Id = dogall.dogid;

UPDATE dog SET cutoffdate = dogall.cutoffdate  FROM dogall WHERE dog.Id = dogall.dogid;

UPDATE dog SET BirthYear = dogall.BirthYearDog  FROM dogall WHERE dog.Id = dogall.dogid;

-- controll
SELECT * FROM dog;

--fill table owner 


INSERT INTO dogowner(ownerid) SELECT ownerid FROM dogall;

-- add owner to table dog
ALTER TABLE dog ADD owneridd int;

UPDATE dog SET owneridd = dogall.ownerId  FROM dogall WHERE dog.Id = dogall.dogid;
UPDATE dog SET ownerid = dogowner.Id  FROM dogowner WHERE dog.ownerIdd = dogowner.ownerid;

ALTER table dog DROP COLUMN owneridd;

-- import sexid, kreisid and quartierid

UPDATE dogowner SET sexid = dogall.sexid  FROM dogall WHERE dogowner.ownerId = dogall.ownerid;

UPDATE dogowner SET kreisid = dogall.kreisid  FROM dogall WHERE dogowner.ownerId = dogall.ownerid;

UPDATE dogowner SET quartierid = dogall.quartierid  FROM dogall WHERE dogowner.ownerId = dogall.ownerid;

-- import ageclass

ALTER TABLE dogall ADD ageownerid int;

UPDATE dogall SET ageownerid = ageclass.Id FROM ageclass WHERE dogall.ageowner = ageclass.description;

UPDATE dogowner SET ageclassid = dogall.ageownerId FROM adogall WHERE ddogowner.ownerId = dogall.ownerid;
