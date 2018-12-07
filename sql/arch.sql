
-- Ce fichier crée et paramètre les tables.


-- On enlève l'affichage des warnings
--
SET client_min_messages TO WARNING;

-- On supprime les tables si elles existent déjà
--
DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;
DROP TABLE IF EXISTS EpreuveIndividuel CASCADE;
DROP TABLE IF EXISTS EpreuveCollective CASCADE;
DROP TABLE IF EXISTS Match CASCADE;
DROP TABLE IF EXISTS Medaille CASCADE;
DROP TABLE IF EXISTS Particpation CASCADE;
DROP TABLE IF EXISTS Membres CASCADE;

-- Création des tables
--

CREATE TABLE Sport (
	--
	-- liste des sports avec ID et nom
	-- le champs type détérmine si c'est un sport collectif ou individuel.
	--
	IDSport SERIAL PRIMARY KEY,
	type text not null,
	nomSport text not null,

	CHECK (type IN ('Collectif', 'Individuel'))
);

CREATE TABLE Athlete (
	--
	-- liste des athletes avec ID, nom, pays, sport, age et sexe
	-- le champs pays est le nom du pays, il n'y pas de table pays
	--
	IDAthlete serial primary key,
	NomAthlete text not null,
	Pays text not null,
	IDSport int,
	Age int,
	sexe text not null,

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Equipe (
	--
	-- liste des équipes avec ID, pays, sport et sexe
	-- il ne peut avoir que une équipe par sport, par pays et par sexe
	--
	IDEquipe serial primary key,
	Pays text not null,
	IDSport int,
	sexe text,

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE EpreuveIndividuel (
	--
	-- liste des épreuves individuels avec ID, sport, nom, id des gagnants de chaque médailles et sexe
	-- les id des gagnants correspondent à des athlètes
	--
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDGagnantOr int,
	IDGagnantArgent int,
	IDGagnantBronze int,
	Sexe text not null,

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport),
	FOREIGN KEY (IDGagnantOr) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantArgent) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDGagnantBronze) REFERENCES Athlete(IDAthlete)
);

CREATE TABLE EpreuveCollective (
	--
	-- liste des épreuves collectives avec ID, sport, nom, id des gagnants de chaque médailles et sexe
	-- les id des gagnants correspondent à des équipes
	--
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text not null,
	IDEquipeGagnanteOr int,
	IDEquipeGagnanteArgent int,
	IDEquipeGagnanteBronze int,
	Sexe text not null,

	FOREIGN KEY (IDEquipeGagnanteOr) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteArgent) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDEquipeGagnanteBronze) REFERENCES Equipe(IDequipe),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Match (
	--
	-- liste des matchs avec nom, id, date, et épreuve
	--
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date NOT NULL,
	IDEpreuve int,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuel(IDEpreuve),
	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);

CREATE TABLE Medaille (
	--
	-- liste les médailles gagnées par un athlète ou une équipe avec id, épreuve, et athlète/équipe
	-- si une équipe remporte une épreuve c'est l'équipe qui gagne qui obtient la médaille, pas les membres
	--
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
	--
	-- liste des participants à un match avec id, athlete/équipe, statut
	-- fais le lien entre la table Match et les tables Athlete/Equipe
	-- status détermine si le participant à gagné ou perdu
	--
	IDMatch int,
	IDParticipant int,
	statut text,
	score text,

	CHECK (statut IN ('Victoire', 'Défaite')),
	PRIMARY KEY (IDMatch, IDParticipant),
	FOREIGN KEY (IDParticipant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDParticipant) REFERENCES Equipe(IDEquipe),
	FOREIGN KEY (IDMatch) REFERENCES Match(IDMatch)
);

CREATE TABLE Membres (
	--
	-- liste les membres d'une équipe
	-- fais le lien entre la table Athlete et la table Equipe
	--
	IDAthlete int,
	IDEquipe int,

	PRIMARY KEY (IDAthlete, IDEquipe),
	FOREIGN KEY (IDAthlete) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDEquipe) REFERENCES Equipe(IDEquipe)
);
