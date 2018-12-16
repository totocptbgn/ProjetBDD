
-- Ce fichier crée et paramètre les tables.


-- On enlève l'affichage des warnings
--
SET client_min_messages TO WARNING;

-- Clear la console
--
\! clear

-- On supprime les tables si elles existent déjà
--
DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS EpreuveCollective CASCADE;
DROP TABLE IF EXISTS EpreuveIndividuelle CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS MatchCollectif CASCADE;
DROP TABLE IF EXISTS MatchIndividuel CASCADE;
DROP TABLE IF EXISTS MedailleCollective CASCADE;
DROP TABLE IF EXISTS MedailleIndividuelle CASCADE;
DROP TABLE IF EXISTS Membres CASCADE;
DROP TABLE IF EXISTS ParticipationCollective CASCADE;
DROP TABLE IF EXISTS ParticipationIndividuelle CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;

-- Création des tables
--
CREATE TABLE Sport (
	--
	-- Liste les sports avec ID et nom.
	-- Le champs `type` détérmine si c'est un sport collectif ou individuel.
	--
	IDSport serial PRIMARY KEY,
	type text,
	nomSport text,

	CHECK (type IN ('Collectif', 'Individuel'))
);

CREATE TABLE Athlete (
	--
	-- Liste les athletes avec ID, nom, pays, sport, age et sexe.
	-- Le champs `Pays` est le nom du pays, il n'y pas de table Pays.
	--
	IDAthlete serial primary key,
	NomAthlete text,
	Pays text,
	IDSport int,
	Age int,
	sexe text,

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE Equipe (
	--
	-- Liste des équipes avec ID, pays, sport et sexe.
	-- Il ne peut avoir que une équipe par sport, par pays et par sexe.
	--
	IDEquipe serial primary key,
	Pays text,
	IDSport int,
	sexe text,

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE EpreuveIndividuelle (
	--
	-- Liste des épreuves individuels avec ID, sport, nom, id des gagnants de chaque médailles, sexe et type de typeScore.
	-- Les id des gagnants correspondent à des athlètes.
	-- `typeScore` indique si le score se compte en points ou en temps.
	--
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text,
	Sexe text,
	typeScore text,

	CHECK (typeScore IN ('Score', 'Temps')),
	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE EpreuveCollective (
	--
	-- Liste des épreuves collectives avec ID, sport, nom, id des gagnants de chaque médailles, sexe et type de typeScore
	-- Les id des gagnants correspondent à des équipes
	-- typeScore indique si le score se compte en points ou en temps
	--
	IDEpreuve serial primary key,
	IDSport int,
	nomEpreuve text,
	Sexe text,
	typeScore text,

	CHECK (typeScore IN ('Score', 'Temps')),

	FOREIGN KEY (IDSport) REFERENCES Sport(IDSport)
);

CREATE TABLE MatchIndividuel (
	--
	-- liste des matchs individuels avec nom, id, date, et épreuve
	--
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date,
	IDEpreuve int,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuelle(IDEpreuve)
);

CREATE TABLE MatchCollectif (
	--
	-- liste des matchs collectifs avec nom, id, date, et épreuve
	--
	NomMatch text,
	IDMatch serial primary key,
	dateMatch date,
	IDEpreuve int,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve)
);


CREATE TABLE MedailleIndividuelle (
	--
	-- liste les médailles gagnées par un athlète avec id, épreuve, et athlète/équipe
	--
	IDMedaille serial primary key,
	IDEpreuve int,
	IDGagnant int,
	type text,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveIndividuelle(IDEpreuve),
	FOREIGN KEY (IDGagnant) REFERENCES Athlete(IDAthlete)
);

CREATE TABLE MedailleCollective (
	--
	-- liste les médailles gagnées par une équipe avec id, épreuve, et athlète/équipe
	-- si une équipe remporte une épreuve c'est l'équipe qui gagne qui obtient la médaille, pas les membres
	--
	IDMedaille serial primary key,
	IDEpreuve int,
	IDGagnant int,
	type text,

	FOREIGN KEY (IDEpreuve) REFERENCES EpreuveCollective(IDEpreuve),
	FOREIGN KEY (IDGagnant) REFERENCES Equipe(IDequipe)
);

CREATE TABLE ParticipationCollective (
	--
	-- liste des participants à un match avec id d'équipe, statut
	-- fais le lien entre la table MatchIndividuel et la table Équipe
	-- status détermine si le participant à gagné ou perdu
	-- score est de type text et contient soit un score, soit un temps
	--
	IDMatch int,
	IDParticipant int,
	statut text,
	score text,

	CHECK (statut IN ('Victoire', 'Défaite')),
	PRIMARY KEY (IDMatch, IDParticipant),
	FOREIGN KEY (IDParticipant) REFERENCES Equipe(IDEquipe),
	FOREIGN KEY (IDMatch) REFERENCES MatchCollectif(IDMatch)
);

CREATE TABLE ParticipationIndividuelle (
	--
	-- liste des participants à un match avec id d'athlete, statut
	-- fais le lien entre la table MatchIndividuel et la table Athlete
	-- status détermine si le participant à gagné ou perdu
	-- score est de type text et contient soit un score, soit un temps
	--
	IDMatch int,
	IDParticipant int,
	statut text,
	score text,

	CHECK (statut IN ('Victoire', 'Défaite')),
	PRIMARY KEY (IDMatch, IDParticipant),
	FOREIGN KEY (IDParticipant) REFERENCES Athlete(IDAthlete),
	FOREIGN KEY (IDMatch) REFERENCES MatchIndividuel(IDMatch)

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
