
-- Ce fichier contient les requetes.

/*
    SELECT * FROM Athlete;
    SELECT * FROM Equipe;
    SELECT * FROM Sport;
    SELECT * FROM EpreuveIndividuel;
    SELECT * FROM EpreuveCollective;
    SELECT * FROM Match;
    SELECT * FROM Medaille;
    SELECT * FROM Particpation;
    SELECT * FROM Membres;

*/

-- Dificulté I

-- 1
SELECT NomAthlete
FROM Athlete, Medaille
WHERE Athlete.IDAthlete = Medaille.IDGagnant
AND Athlete.Pays = 'Italie';

-- 2
SELECT NomAthlete, Pays, type
FROM Medaille, Athlete, EpreuveIndividuel
WHERE Athlete.IDAthlete = Medaille.IDGagnant
AND Medaille.IDEpreuve = EpreuveIndividuel.IDEpreuve
AND (EpreuveIndividuel.nomEpreuve = '100m'
  OR EpreuveIndividuel.nomEpreuve = '200m'
  OR EpreuveIndividuel.nomEpreuve = '400m'
);
