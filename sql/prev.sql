DROP TABLE IF EXISTS MatchIndividuel CASCADE;
DROP TABLE IF EXISTS MatchCollectif CASCADE;

CREATE TABLE MatchIndividuel (
	--
	-- liste des matchs individuels avec nom, id, date, et épreuve
	--
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date NOT NULL,
	IDEpreuve int,


	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve)
);

CREATE TABLE MatchCollectif (
	--
	-- liste des matchs collectifs avec nom, id, date, et épreuve
	--
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date NOT NULL,
	IDEpreuve int,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);

ALTER TABLE MatchIndividuel ADD Lieu varchar;
ALTER TABLE MatchIndividuel ADD nbrVolontaires int;
ALTER TABLE MatchCollectif ADD Lieu varchar;
ALTER TABLE MatchCollectif ADD nbrVolontaires int;

INSERT INTO MatchIndividuel (NomMatch,IDEpreuve,dateMatch,Lieu,nbrVolontaires) VALUES
  ('50m nage libre',1,'2016/08/13','Deodoro',8),
  ('100m nage libre',2,'2016/08/14','Deodoro',8),
  ('200m nage libre',3,'2016/08/15','Deodoro',10),
  ('100m papillon',4,'2016/08/16','Deodoro',10),
  ('100m papillon',5,'2016/08/16','Deodoro',10),
  ('50mètres nage libre',6,'2016/08/13','Deodoro',10),
  ('100mètres nage libre',7,'2016/08/14','Deodoro',10),
  ('200m nage libre',8,'2016/08/15','Deodoro',10),
  ('Saut d obstacle',9,'2016/08/16','Deodoro',12),
  ('Dressage',9,'2016/08/17','Deodoro',12),
  ('Cross',9,'2016/08/18','Deodoro',12),
  ('Saut d obstacle',10,'2016/08/19','Deodoro',12),
  ('Dressage',11,'2016/08/20','Deodoro',12),
  ('Poutre',12,'2016/08/16','Maracana',7),
  ('Sol',13,'2016/08/17','Maracana',7),
  ('Saut de cheval',15,'2016/08/18','Maracana',7),
  ('Barres asymétriques',14,'2016/08/19','Maracana',7),
  ('Poutre',16,'2016/08/16','Maracana',7),
  ('Sol',17,'2016/08/17','Maracana',7),
  ('Saut de cheval',18,'2016/08/18','Maracana',7),
  ('Barres asymétriques',19,'2016/08/19','Maracana',7),
  ('Quart de finale',20,'2016/08/13','Deodoro',15),
  ('Quart de finale',20,'2016/08/13','Deodoro',15),
  ('Quart de finale',20,'2016/08/14','Deodoro',15),
  ('Quart de finale',20,'2016/08/14','Deodoro',15),
  ('Demi finale',20,'2016/08/15','Deodoro',15),
  ('Demi finale',20,'2016/08/15','Deodoro',15),
  ('Finale',20,'2016/08/16','Deodoro',15),
  ('Quart de finale',21,'2016/08/13','Deodoro',15),
  ('Quart de finale',21,'2016/08/13','Deodoro',15),
  ('Quart de finale',21,'2016/08/14','Deodoro',15),
  ('Quart de finale',21,'2016/08/14','Deodoro',15),
  ('Demi finale',21,'2016/08/15','Deodoro',15),
  ('Demi finale',21,'2016/08/15','Deodoro',15),
  ('Finale',21,'2016/08/16','Deodoro',15),
  ('Quart de finale',22,'2016/08/13','Deodoro',15),
  ('Quart de finale',22,'2016/08/13','Deodoro',15),
  ('Quart de finale',22,'2016/08/14','Deodoro',15),
  ('Quart de finale',22,'2016/08/14','Deodoro',15),
  ('Demi finale',22,'2016/08/15','Deodoro',15),
  ('Demi finale',22,'2016/08/15','Deodoro',15),
  ('Finale',22,'2016/08/16','Deodoro',15),
  ('Quart de finale',23,'2016/08/13','Deodoro',15),
  ('Quart de finale',23,'2016/08/13','Deodoro',15),
  ('Quart de finale',23,'2016/08/14','Deodoro',15),
  ('Quart de finale',23,'2016/08/14','Deodoro',15),
  ('Demi finale',23,'2016/08/15','Deodoro',15),
  ('Demi finale',23,'2016/08/15','Deodoro',15),
  ('Finale',23,'2016/08/16','Deodoro',15),
  ('Fleuret',24,'2016/08/14','Deodoro',15),
  ('Epee',25,'2016/08/15','Deodoro',15),
  ('Sabre',26,'2016/08/16','Deodoro',15),
  ('Fleuret',27,'2016/08/14','Deodoro',15),
  ('Epee',28,'2016/08/15','Deodoro',15),
  ('Sabre',29,'2016/08/16','Deodoro',15),
  ('Quart de finale',30,'2016/08/13','Maracana',15),
  ('Quart de finale',30,'2016/08/13','Maracana',15),
  ('Quart de finale',30,'2016/08/14','Maracana',15),
  ('Quart de finale',30,'2016/08/14','Maracana',15),
  ('Demi finale',30,'2016/08/15','Maracana',15),
  ('Demi finale',30,'2016/08/15','Maracana',15),
  ('Finale',30,'2016/08/16','Maracana',15),
  ('Quart de finale',31,'2016/08/13','Maracana',15),
  ('Quart de finale',31,'2016/08/13','Maracana',15),
  ('Quart de finale',31,'2016/08/14','Maracana',15),
  ('Quart de finale',31,'2016/08/14','Maracana',15),
  ('Demi finale',31,'2016/08/15','Maracana',15),
  ('Demi finale',31,'2016/08/15','Maracana',15),
  ('Finale',31,'2016/08/16','Maracana',15),
  ('Quart de finale',32,'2016/08/13','Maracana',15),
  ('Quart de finale',32,'2016/08/13','Maracana',15),
  ('Quart de finale',32,'2016/08/14','Maracana',15),
  ('Quart de finale',32,'2016/08/14','Maracana',15),
  ('Demi finale',32,'2016/08/15','Maracana',15),
  ('Demi finale',32,'2016/08/15','Maracana',15),
  ('Finale',32,'2016/08/16','Maracana',15),
  ('Quart de finale',33,'2016/08/13','Maracana',18),
  ('Quart de finale',33,'2016/08/13','Maracana',18),
  ('Quart de finale',33,'2016/08/14','Maracana',18),
  ('Quart de finale',33,'2016/08/14','Maracana',18),
  ('Demi finale',33,'2016/08/15','Maracana',18),
  ('Demi finale',33,'2016/08/15','Maracana',18),
  ('Finale',33,'2016/08/16','Maracana',18),
  ('Quart de finale',34,'2016/08/13','Maracana',18),
  ('Quart de finale',34,'2016/08/13','Maracana',18),
  ('Quart de finale',34,'2016/08/14','Maracana',18),
  ('Quart de finale',34,'2016/08/14','Maracana',18),
  ('Demi finale',34,'2016/08/15','Maracana',18),
  ('Demi finale',34,'2016/08/15','Maracana',18),
  ('Finale',34,'2016/08/16','Maracana',18),
  ('Quart de finale',35,'2016/08/13','Maracana',16),
  ('Quart de finale',35,'2016/08/13','Maracana',16),
  ('Quart de finale',35,'2016/08/14','Maracana',16),
  ('Demi finale',35,'2016/08/15','Maracana',16),
  ('Quart de finale',35,'2016/08/14','Maracana',16),
  ('Demi finale',35,'2016/08/15','Maracana',16),
  ('Finale',35,'2016/08/16','Maracana',16),
  ('100m',36,'2016/08/19','Maracana, Stade Olympique',16),
  ('200m',37,'2016/08/20','Maracana, Stade Olympique',16),
  ('400m',38,'2016/08/21','Maracana, Stade Olympique',16),
  ('100m',39,'2016/08/19','Maracana, Stade Olympique',16),
  ('200m',40,'2016/08/20','Maracana, Stade Olympique',16),
  ('400m',41,'2016/08/21','Maracana, Stade Olympique',16),
  ('Marathon',42,'2016/08/21','Maracana, Sambodrome',28),
  ('Marathon',43,'2016/08/21','Maracana, Sambodrome',28);
