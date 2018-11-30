/*
Ce fichier crée et paramètre les tables.
*/

DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;
DROP TABLE IF EXISTS EpreuveIndividuel CASCADE;
DROP TABLE IF EXISTS EpreuveCollective CASCADE;
DROP TABLE IF EXISTS Match CASCADE;
DROP TABLE IF EXISTS Medaille CASCADE;
DROP TABLE IF EXISTS Particpation CASCADE;
DROP TABLE IF EXISTS GagnantMedaille CASCADE;
DROP TABLE IF EXISTS MedailleEpreuves CASCADE;


CREATE TABLE Sport (
	IDSport serial primary key
	type text not null,
	nomSport text not null
);

CREATE TABLE Athlete (
	IDAthlete serial primary key,
	NomAthlete text not null,
	Pays text not null,
	IDSport int,
	Age int,
	sexe text not null,
	FOREIGN KEY (IDSport) REFERENCES sport(IDSport)
);

CREATE TABLE Equipe (
	IDEquipe serial primary key,
	Pays text not null,
	IDSport int,
	sexe text,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);


CREATE TABLE EpreuveIndividuel (
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDGagnantOr int,
	IDGagnantArgent int,
	IDGagnantBronze int,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport),
	FOREIGN KEY (IDGagnantOr) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantArgent) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantBronze) REFERENCES Athlete(IDAthlete)
);

CREATE TABLE EpreuveCollective (
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDEquipeGagnanteOr int,
	IDEquipeGagnanteArgent int,
	IDEquipeGagnanteBronze int,
	FOREIGN KEY (IDEquipeGagnanteOr) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteArgent) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteBronze) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Match (
	NomMatch text not null,
	IDMatch serial primary key,
	dateMatch date,
	IDEpreuve int,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);

CREATE TABLE Medaille (
	IDMedaille serial primary key,
	type text not null
);

CREATE TABLE Particpation (
	IDMatch int,
	IDParticipant int,
	IDStatut text,
	PRIMARY KEY (IDMatch, IDParticipant),
	FOREIGN KEY (IDParticipant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDParticipant) REFERENCES Equipe(IDEquipe),
	FOREIGN KEY (IDMatch) REFERENCES Match(IDMatch)
);

CREATE TABLE GagnantMedaille (
	IDMedaille int,
	IDGagnant int,
	PRIMARY KEY (IDMedaille, IDGagnant),
	FOREIGN KEY (IDMedaille) REFERENCES Medaille(IDMedaille),
	FOREIGN KEY (IDGagnant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnant) REFERENCES Equipe(IDEquipe)
);

CREATE TABLE MedailleEpreuves (
	IDMedaille int,
	IDEpreuve int,
	PRIMARY KEY (IDMedaille, IDEpreuve),
	FOREIGN KEY (IDMedaille) REFERENCES Medaille(IDMedaille),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);
