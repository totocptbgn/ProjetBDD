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

CREATE TABLE Sport (
	type text not null,
	nomSport text not null,
	IDSport serial primary key
);

CREATE TABLE Athlete (
	IDAthlete serial primary key,
	NomAthlete text not null,
	Pays text not null,
	NbrMedailles integer,
	IDSport int,
	Age int,
	sexe text not null,
	FOREIGN KEY (IDSport) REFERENCES sport(IDSport)
);

CREATE TABLE Equipe (
	IDequipe serial primary key,
	Pays text not null,
	IDSport int,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);


CREATE TABLE EpreuveIndividuel (
	IDSport int,
	nomEpreuve text not null,
	IDEpreuve serial primary key,
	IDGagnantOr int,
	IDGagnantArgent int,
	IDGagnantBronze int,
	dateEpreuve date,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport),
	FOREIGN KEY (IDGagnantOr) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantArgent) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantBronze) REFERENCES Athlete(IDAthlete)
);

CREATE TABLE EpreuveCollective (
	IDSport int,
	nomEpreuve text not null,
	IDEpreuve serial primary key,
	IDEquipeGagnanteOr int,
	IDEquipeGagnanteArgent int,
	IDEquipeGagnanteBronze int,
	dateEpreuve date,
	FOREIGN KEY (IDEquipeGagnanteOr) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteArgent) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteBronze) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Match (
	NomMatch text not null,
	IDMatch serial primary key,
	IDEpreuve int,
	IDGagnant int,
	IDPerdant int,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve)
);

CREATE TABLE Medaille (
	type text not null,
	IDEquipe int,
	IDAthlete int,
	IDEpreuve int,
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDAthlete) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve)
);
