ALTER TABLE MatchIndividuel ADD Lieu varchar;
ALTER TABLE MatchIndividuel ADD nbrVolontaires int;
ALTER TABLE MatchCollectif ADD Lieu varchar;
ALTER TABLE MatchCollectif ADD nbrVolontaires int;

INSERT INTO MatchIndividuel (Lieu,nbrVolontaires) VALUES
