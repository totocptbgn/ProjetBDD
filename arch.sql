/*
Ce fichier créer et paramètre les tables.
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
	PRIMARY KEY (IDpays)
);
