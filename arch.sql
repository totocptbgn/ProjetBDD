/*
Ce fichier crée et paramètre les tables.
*/
DROP TABLE IF EXISTS Participant CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Pays CASCADE;

CREATE TABLE Participant (
	IDparticipant serial primary key,
	NomParticipant text not null,
	IDpays integer,
	NbrMedailles integer,
	Discipline text,
	PRIMARY KEY (IDparticipant),
	FOREIGN KEY (IDpays) REFERENCES Pays(IDpays)
);
CREATE TABLE Equipe (
	IDpays integer,
	Discipline text not null,
	Score integer,
	IDequipe serial primary key,
	PRIMARY KEY (IDequipe),
	FOREIGN KEY (IDpays) REFERENCES Pays(IDpays)
);
CREATE TABLE Pays (
	IDpays serial primary key,
	NbMedailles int,
	NomPays text not null,
	Rang int,
	PRIMARY KEY (IDpays)
);

INSERT INTO Pays VALUES
(118,'Etats-Unis',1),
(70,'Chine',2),
(67,'Grande-Bretagne',3),
 (56,'Russie',4),
 (42,'Allemagne',5),
 (41,'Japon',7),
 (42,'France',5),
 (21,'Coree du Sud',11),
 (8,'Australie',29),
 (18,'Hongrie',15)
 
 /* trop d'informations a ecrire y'a surement un autre moyen que le copier coller */
 

