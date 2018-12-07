
-- Ce fichier crée et paramètre les tables.

SET client_min_messages TO WARNING;
DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;
DROP TABLE IF EXISTS EpreuveIndividuel CASCADE;
DROP TABLE IF EXISTS EpreuveCollective CASCADE;
DROP TABLE IF EXISTS Match CASCADE;
DROP TABLE IF EXISTS Medaille CASCADE;
DROP TABLE IF EXISTS Particpation CASCADE;
DROP TABLE IF EXISTS Membres CASCADE;


CREATE TABLE Sport (
	IDSport SERIAL PRIMARY KEY,
	type text not null CHECK (type IN ('Collectif', 'Individuel')),
	nomSport text not null
);

CREATE TABLE Athlete (
	IDAthlete serial primary key,
	NomAthlete text not null,
	Pays text not null,
	IDSport int,
	Age int,
	sexe text not null,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Equipe (
	IDEquipe serial primary key,
	Pays text not null,
	IDSport int,
	sexe text,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
	-- CHECK (Equipe.IDSport == Sport.IDSport AND Sport.type == 'Collectif')
);

CREATE TABLE EpreuveIndividuel (
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDGagnantOr int,
	IDGagnantArgent int,
	IDGagnantBronze int,
	Categorie text not null,
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport),
	FOREIGN KEY (IDGagnantOr) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantArgent) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantBronze) REFERENCES Athlete(IDAthlete)
	-- CHECK (EpreuveIndividuel.IDSport == Sport.IDSport AND Sport.type == 'Individuel')

);

CREATE TABLE EpreuveCollective (
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDEquipeGagnanteOr int,
	IDEquipeGagnanteArgent int,
	IDEquipeGagnanteBronze int,
	Categorie text not null,
	FOREIGN KEY (IDEquipeGagnanteOr) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteArgent) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteBronze) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
	-- CHECK (EpreuveCollective.IDSport == Sport.IDSport AND Sport.type == 'Collectif')
);

CREATE TABLE Match (
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date NOT NULL,
	IDEpreuve int,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);

CREATE TABLE Medaille (
	IDMedaille serial primary key,
	IDEpreuve int,
	IDGagnant int,
	type text not null,
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve),
	FOREIGN KEY (IDGagnant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnant) REFERENCES Equipe(IDEquipe)
);

CREATE TABLE Particpation (
	IDMatch int,
	IDParticipant int,
	IDStatut text,
	score text,
	PRIMARY KEY (IDMatch, IDParticipant),
	FOREIGN KEY (IDParticipant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDParticipant) REFERENCES Equipe(IDEquipe),
	FOREIGN KEY (IDMatch) REFERENCES Match(IDMatch)
);

CREATE TABLE Membres (
	IDAthlete int,
	IDEquipe int,
	PRIMARY KEY (IDAthlete, IDEquipe),
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDEquipe) REFERENCES Equipe(IDEquipe)
);
