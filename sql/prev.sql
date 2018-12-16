
-- Ce fichier est à utiliser pour la partie 4 'Organisation et Prévention'

-- Nettoyage et reconstruction des données
--
\i data.sql

-- Modification des tables et re-remplissage
--
DROP TABLE IF EXISTS MatchIndividuel CASCADE;
DROP TABLE IF EXISTS MatchCollectif CASCADE;

CREATE TABLE MatchIndividuel (
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date,
	IDEpreuve int,
  Lieu text,
  nbrVolontaires int,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuelle(IDEpreuve)
);

CREATE TABLE MatchCollectif (
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date,
	IDEpreuve int,
  Lieu text,
  nbrVolontaires int,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);

INSERT INTO MatchIndividuel (NomMatch, IDEpreuve, dateMatch, Lieu, nbrVolontaires) VALUES
  ('50m nage libre',1,'2016/08/13','Stade Deodoro',8),
  ('100m nage libre',2,'2016/08/14','Stade Deodoro',8),
  ('200m nage libre',3,'2016/08/15','Stade Deodoro',10),
  ('100m papillon',4,'2016/08/16','Stade Deodoro',10),
  ('100m papillon',5,'2016/08/16','Stade Deodoro',10),
  ('50mètres nage libre',6,'2016/08/13','Stade Deodoro',10),
  ('100mètres nage libre',7,'2016/08/14','Stade Deodoro',10),
  ('200m nage libre',8,'2016/08/15','Stade Deodoro',10),
  ('Saut d obstacle',9,'2016/08/16','Stade Deodoro',12),
  ('Dressage',9,'2016/08/17','Stade Deodoro',12),
  ('Cross',9,'2016/08/18','Stade Deodoro',12),
  ('Saut d obstacle',10,'2016/08/19','Stade Deodoro',12),
  ('Dressage',11,'2016/08/20','Stade Deodoro',12),
  ('Poutre',12,'2016/08/16','Stade Maracana',7),
  ('Sol',13,'2016/08/17','Stade Maracana',7),
  ('Saut de cheval',15,'2016/08/18','Stade Maracana',7),
  ('Barres asymétriques',14,'2016/08/19','Stade Maracana',7),
  ('Poutre',16,'2016/08/16','Stade Maracana',7),
  ('Sol',17,'2016/08/17','Stade Maracana',7),
  ('Saut de cheval',18,'2016/08/18','Stade Maracana',7),
  ('Barres asymétriques',19,'2016/08/19','Stade Maracana',7),
  ('Quart de finale',20,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',20,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',20,'2016/08/14','Stade Deodoro',15),
  ('Quart de finale',20,'2016/08/14','Stade Deodoro',15),
  ('Demi finale',20,'2016/08/15','Stade Deodoro',15),
  ('Demi finale',20,'2016/08/15','Stade Deodoro',15),
  ('Finale',20,'2016/08/16','Stade Deodoro',15),
  ('Quart de finale',21,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',21,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',21,'2016/08/14','Stade Deodoro',15),
  ('Quart de finale',21,'2016/08/14','Stade Deodoro',15),
  ('Demi finale',21,'2016/08/15','Stade Deodoro',15),
  ('Demi finale',21,'2016/08/15','Stade Deodoro',15),
  ('Finale',21,'2016/08/16','Stade Deodoro',15),
  ('Quart de finale',22,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',22,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',22,'2016/08/14','Stade Deodoro',15),
  ('Quart de finale',22,'2016/08/14','Stade Deodoro',15),
  ('Demi finale',22,'2016/08/15','Stade Deodoro',15),
  ('Demi finale',22,'2016/08/15','Stade Deodoro',15),
  ('Finale',22,'2016/08/16','Stade Deodoro',15),
  ('Quart de finale',23,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',23,'2016/08/13','Stade Deodoro',15),
  ('Quart de finale',23,'2016/08/14','Stade Deodoro',15),
  ('Quart de finale',23,'2016/08/14','Stade Deodoro',15),
  ('Demi finale',23,'2016/08/15','Stade Deodoro',15),
  ('Demi finale',23,'2016/08/15','Stade Deodoro',15),
  ('Finale',23,'2016/08/16','Stade Deodoro',15),
  ('Fleuret',24,'2016/08/14','Stade Deodoro',15),
  ('Epee',25,'2016/08/15','Stade Deodoro',15),
  ('Sabre',26,'2016/08/16','Stade Deodoro',15),
  ('Fleuret',27,'2016/08/14','Stade Deodoro',15),
  ('Epee',28,'2016/08/15','Stade Deodoro',15),
  ('Sabre',29,'2016/08/16','Stade Deodoro',15),
  ('Quart de finale',30,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',30,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',30,'2016/08/14','Stade Maracana',15),
  ('Quart de finale',30,'2016/08/14','Stade Maracana',15),
  ('Demi finale',30,'2016/08/15','Stade Maracana',15),
  ('Demi finale',30,'2016/08/15','Stade Maracana',15),
  ('Finale',30,'2016/08/16','Stade Maracana',15),
  ('Quart de finale',31,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',31,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',31,'2016/08/14','Stade Maracana',15),
  ('Quart de finale',31,'2016/08/14','Stade Maracana',15),
  ('Demi finale',31,'2016/08/15','Stade Maracana',15),
  ('Demi finale',31,'2016/08/15','Stade Maracana',15),
  ('Finale',31,'2016/08/16','Stade Maracana',15),
  ('Quart de finale',32,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',32,'2016/08/13','Stade Maracana',15),
  ('Quart de finale',32,'2016/08/14','Stade Maracana',15),
  ('Quart de finale',32,'2016/08/14','Stade Maracana',15),
  ('Demi finale',32,'2016/08/15','Stade Maracana',15),
  ('Demi finale',32,'2016/08/15','Stade Maracana',15),
  ('Finale',32,'2016/08/16','Stade Maracana',15),
  ('Quart de finale',33,'2016/08/13','Stade Maracana',18),
  ('Quart de finale',33,'2016/08/13','Stade Maracana',18),
  ('Quart de finale',33,'2016/08/14','Stade Maracana',18),
  ('Quart de finale',33,'2016/08/14','Stade Maracana',18),
  ('Demi finale',33,'2016/08/15','Stade Maracana',18),
  ('Demi finale',33,'2016/08/15','Stade Maracana',18),
  ('Finale',33,'2016/08/16','Stade Maracana',18),
  ('Quart de finale',34,'2016/08/13','Stade Maracana',18),
  ('Quart de finale',34,'2016/08/13','Stade Maracana',18),
  ('Quart de finale',34,'2016/08/14','Stade Maracana',18),
  ('Quart de finale',34,'2016/08/14','Stade Maracana',18),
  ('Demi finale',34,'2016/08/15','Stade Maracana',18),
  ('Demi finale',34,'2016/08/15','Stade Maracana',18),
  ('Finale',34,'2016/08/16','Stade Maracana',18),
  ('Quart de finale',35,'2016/08/13','Stade Maracana',16),
  ('Quart de finale',35,'2016/08/13','Stade Maracana',16),
  ('Quart de finale',35,'2016/08/14','Stade Maracana',16),
  ('Demi finale',35,'2016/08/15','Stade Maracana',16),
  ('Quart de finale',35,'2016/08/14','Stade Maracana',16),
  ('Demi finale',35,'2016/08/15','Stade Maracana',16),
  ('Finale',35,'2016/08/16','Stade Maracana',16),
  ('100m',36,'2016/08/19','Stade Olympique',16),
  ('200m',37,'2016/08/20','Stade Olympique',16),
  ('400m',38,'2016/08/21','Stade Olympique',16),
  ('100m',39,'2016/08/19','Stade Olympique',16),
  ('200m',40,'2016/08/20','Stade Olympique',16),
  ('400m',41,'2016/08/21','Stade Olympique',16),
  ('Marathon',42,'2016/08/21','Sambodrome',28),
  ('Marathon',43,'2016/08/21','Sambodrome',28);

INSERT INTO MatchCollectif (NomMatch,IDEpreuve,dateMatch,Lieu,nbrVolontaires) VALUES
  ('Relais 4*400',1,'2016/08/05','Stade Copacabana',12),
  ('Relais 4*400',2,'2016/08/05','Stade Copacabana',12),
  ('Deux de couple',3,'2016/08/05','Stade Copacabana',12),
  ('Quatre de couple',4,'2016/08/06','Stade Copacabana',12),
  ('Huit',5,'2016/08/07','Stade Copacabana',12),
  ('Deux avec barreur',6,'2016/08/08','Stade Copacabana',12),
  ('Deux de couple',7,'2016/08/05','Stade Copacabana',12),
  ('Quatre de couple',8,'2016/08/07','Stade Copacabana',12),
  ('Huit',9,'2016/08/08','Stade Copacabana',12),
  ('Deux avec barreur',10,'2016/08/09','Stade Copacabana',12),
  ('Double',11,'2016/08/06','Deodoro Youth Arena',12),
  ('Double',12,'2016/08/06','Deodoro Youth Arena',12),
  ('Quart de finale',13,'2016/08/10','Deodoro Youth Arena',12),
  ('Quart de finale',13,'2016/08/10','Deodoro Youth Arena',12),
  ('Quart de finale',13,'2016/08/11','Deodoro Youth Arena',12),
  ('Quart de finale',13,'2016/08/11','Deodoro Youth Arena',12),
  ('Demi finale',13,'2016/08/12','Deodoro Youth Arena',12),
  ('Demi finale',13,'2016/08/12','Deodoro Youth Arena',12),
  ('Finale',13,'2016/08/13','Deodoro Youth Arena',12),
  ('Quart de finale',14,'2016/08/10','Deodoro Youth Arena',12),
  ('Quart de finale',14,'2016/08/10','Deodoro Youth Arena',12),
  ('Quart de finale',14,'2016/08/11','Deodoro Youth Arena',12),
  ('Quart de finale',14,'2016/08/11','Deodoro Youth Arena',12),
  ('Demi finale',14,'2016/08/12','Deodoro Youth Arena',12),
  ('Demi finale',14,'2016/08/12','Deodoro Youth Arena',12),
  ('Finale',14,'2016/08/13','Deodoro Youth Arena',12),
  ('Quart de finale',15,'2016/08/11','Deodoro Youth Arena',15),
  ('Quart de finale',15,'2016/08/11','Deodoro Youth Arena',15),
  ('Quart de finale',15,'2016/08/12','Deodoro Youth Arena',15),
  ('Quart de finale',15,'2016/08/12','Deodoro Youth Arena',15),
  ('Demi finale',15,'2016/08/13','Deodoro Youth Arena',15),
  ('Demi finale',15,'2016/08/13','Deodoro Youth Arena',15),
  ('Finale',15,'2016/08/14','Deodoro Youth Arena',15),
  ('Quart de finale',16,'2016/08/13','Deodoro Youth Arena',15),
  ('Quart de finale',16,'2016/08/13','Deodoro Youth Arena',15),
  ('Quart de finale',16,'2016/08/14','Deodoro Youth Arena',15),
  ('Quart de finale',16,'2016/08/14','Deodoro Youth Arena',15),
  ('Demi finale',16,'2016/08/15','Deodoro Youth Arena',15),
  ('Demi finale',16,'2016/08/15','Deodoro Youth Arena',15),
  ('Finale',16,'2016/08/16','Deodoro Youth Arena',15),
  ('Fleuret par équipe',17,'2016/08/13','Deodoro Youth Arena',8),
  ('Fleuret par équipe',18,'2016/08/13','Deodoro Youth Arena',8),
  ('Epee par équipe',19,'2016/08/13','Deodoro Youth Arena',8),
  ('Epee par équipe',20,'2016/08/13','Deodoro Youth Arena',8),
  ('Sabre par équipe',21,'2016/08/13','Deodoro Youth Arena',8),
  ('Sabre par équipe',22,'2016/08/13','Deodoro Youth Arena',8),
  ('Double',23,'2016/08/14','Barra,Rio Centro',12),
  ('Double',24,'2016/08/14','Barra,Rio Centro',12),
  ('Double',25,'2016/08/14','Barra,Rio Centro',12),
  ('Double',26,'2016/08/14','Barra,Rio Centro',12),
  ('Quart de finale',27,'2016/08/13','Maracana, Stade Olympique',12),
  ('Quart de finale',27,'2016/08/13','Maracana, Stade Olympique',12),
  ('Quart de finale',27,'2016/08/14','Maracana, Stade Olympique',12),
  ('Quart de finale',27,'2016/08/14','Maracana, Stade Olympique',12),
  ('Demi finale',27,'2016/08/15','Maracana, Stade Olympique',12),
  ('Demi finale',27,'2016/08/15','Maracana, Stade Olympique',12),
  ('Finale',27,'2016/08/16','Maracana, Stade Olympique',12),
  ('Quart de finale',28,'2016/08/13','Maracana, Stade Olympique',18),
  ('Quart de finale',28,'2016/08/13','Maracana, Stade Olympique',18),
  ('Quart de finale',28,'2016/08/14','Maracana, Stade Olympique',18),
  ('Quart de finale',28,'2016/08/14','Maracana, Stade Olympique',18),
  ('Demi finale',28,'2016/08/15','Maracana, Stade Olympique',18),
  ('Demi finale',28,'2016/08/15','Maracana, Stade Olympique',18),
  ('Finale',28,'2016/08/16','Maracana, Stade Olympique',24);

-- Clear la console
--
\! clear

-- Requetes
--
\echo
\echo 'Nombre de volontaires necessaires par Lieu et Date :'

WITH Organisation (nbrVolontaires, Lieu, dateMatch) AS (
  SELECT MatchIndividuel.nbrVolontaires, MatchIndividuel.Lieu, MatchIndividuel.dateMatch
  FROM MatchIndividuel
  UNION ALL
  SELECT MatchCollectif.nbrVolontaires, MatchCollectif.Lieu, MatchCollectif.dateMatch
  FROM MatchCollectif
)
SELECT COUNT(nbrVolontaires) AS nbrVltr, Lieu, dateMatch
FROM Organisation
GROUP BY Lieu, dateMatch
ORDER BY dateMatch;

\echo 'Les 10 endroits et dates où l\'on auras besoin de plus de volontaires :'

WITH Organisation (nbrVolontaires, Lieu, dateMatch) AS (
  SELECT MatchIndividuel.nbrVolontaires, MatchIndividuel.Lieu, MatchIndividuel.dateMatch
  FROM MatchIndividuel
  UNION ALL
  SELECT MatchCollectif.nbrVolontaires, MatchCollectif.Lieu, MatchCollectif.dateMatch
  FROM MatchCollectif
)
SELECT COUNT(nbrVolontaires) AS nbrVolontaires, Lieu, dateMatch
FROM Organisation
GROUP BY Lieu, dateMatch
ORDER BY nbrVolontaires DESC
LIMIT 10;

\echo 'Les 10 endroits et dates où l\'on auras besoin de moins de volontaires :'

WITH Organisation (nbrVolontaires, Lieu, dateMatch) AS (
  SELECT MatchIndividuel.nbrVolontaires, MatchIndividuel.Lieu, MatchIndividuel.dateMatch
  FROM MatchIndividuel
  UNION ALL
  SELECT MatchCollectif.nbrVolontaires, MatchCollectif.Lieu, MatchCollectif.dateMatch
  FROM MatchCollectif
)
SELECT COUNT(nbrVolontaires) AS nbrVolontaires, Lieu, dateMatch
FROM Organisation
GROUP BY Lieu, dateMatch
ORDER BY nbrVolontaires ASC
LIMIT 10;
