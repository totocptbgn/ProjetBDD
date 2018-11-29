/*
Ce fichier crée et paramètre les tables.
*/
DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Pays CASCADE;

CREATE TABLE Athlete (
	IDAthlete serial primary key,
	NomAthlete text not null,
	Pays text not null,
	NbrMedailles integer,
	Sport text not null,
	Age int,
	sexe text not null,
	PRIMARY KEY (IDAthlete)
);
CREATE TABLE Equipe (
	IDequipe serial primary key,
	Pays text not null,
	Sport text not null,
	PRIMARY KEY (IDequipe)
);

CREATE TABLE Sport (
	type text not null,
	nomSport text not null,
	IDSport serial primary key,
	PRIMARY KEY (IDSport)
);
CREATE TABLE EpreuveIndividuel (
	IDSport int,
	nomEpreuve text not null,
	IDEpreuve serial primary key,
	IDGagnantOr int,
	IDGagnantArgent int,
	IDGagnantBronze int,
	dateEpreuve date,
	PRIMARY KEY (IDEpreuve),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport),
	FOREIGN KEY (IDGagnantOr,IDGagnantArgent,IDGagnantBronze) REFERENCES Athlete(IDAthlete)
);
CREATE TABLE EpreuveCollective (
	IDSport int,
	nomEpreuve text not null,
	IDEpreuve serial primary key,
	IDEquipeGagnanteOr int,
	IDEquipeGagnanteArgent int,
	IDEquipeGagnanteBronze int,
	dateEpreuve date,
	PRIMARY KEY (IDEpreuve),
	FOREIGN KEY (IDEquipeGagnante,IDEquipePerdante) REFERENCES Equipe(IDequipe)
);
CREATE TABLE Match (
	NomMatch text not null,
	IDMatch serial primary key,
	IDEpreuve int,
	IDGagnant int,
	IDPerdant int,
	PRIMARY KEY (IDMatch),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve)
);
CREATE TABLE Medaille (
	type text not null,
	IDEquipe int,
	IDAthlete int,
	IDepreuve,
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDAthlete) REFERENCES Equipe(IDequipe)
);
CREATE TABLE Participation (
);
