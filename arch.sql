/*
Ce fichier crée et paramètre les tables.
*/
DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Pays CASCADE;

CREATE TABLE Athlete (
	IDAthlete serial primary key,
	NomAthlete text not null,
	IDpays integer,
	NbrMedailles integer,
	Discipline text,
	PRIMARY KEY (IDAthlete),
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
	NbMedaillesOr int,
	nbMedaillesArgent int,
	nbMedaillesBronze int,
	NomPays text not null,
	Rang int,
	PRIMARY KEY (IDpays)
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
	IDEquipeGagnante int,
	IDEquipePerdante int,
	dateEpreuve date,
	PRIMARY KEY (IDEpreuve),
	FOREIGN KEY (IDEquipeGagnante,IDEquipePerdante) REFERENCES Equipe(IDequipe)
);
CREATE TABLE Medaille (
	type text not null,
	IDEquipe int,
	IDAthlete int,
	IDepreuve,
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDAthlete) REFERENCES Equipe(IDequipe)
);
CREATE TABLE Epreuve-Athlete (
	IDAthlete int,
	IDEpreuve int,
	temps int,
	score int,
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDEpreuve) REFERENCES Epreuve(IDEpreuve)
);
CREATE TABLE Epreuve-Equipe (
	IDequipe int,
	IDEpreuve int,
	temps int,
	score int,
	FOREIGN KEY (IDequipe) REFERENCES equipe(IDequipe),
	FOREIGN KEY (IDEpreuve) REFERENCES Epreuve(IDEpreuve)
);
