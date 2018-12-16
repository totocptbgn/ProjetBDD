
-- Ce fichier contient les requetes.

-- Clear la console
--
\! clear

-- Requêtes :
--
\echo '+---------------------------------------| Dificulté I |---------------------------------------+'
\echo

\echo '1. La liste des athlètes italiens ayant obtenu une médaille :'

SELECT DISTINCT NomAthlete AS Athlete
FROM Athlete, MedailleIndividuelle
WHERE Athlete.IDAthlete = MedailleIndividuelle.IDGagnant
AND Athlete.Pays = 'Italie';

\echo '2. Le nom et la nationalité des médaillés du 100m, 200m, et 400m avec à chaque fois le type de médaille (or, argent, bronze) :'

SELECT Athlete.NomAthlete AS Nom, Athlete.Pays, MedailleIndividuelle.type
FROM Athlete, MedailleIndividuelle
WHERE Athlete.IDAthlete = MedailleIndividuelle.IDGagnant
AND IDEpreuve IN (
  SELECT IDEpreuve
  FROM EpreuveIndividuelle
  WHERE nomEpreuve = '100m'
  OR nomEpreuve = '200m'
  OR nomEpreuve = '400m'
);

\echo '3. Les membres de l\'équipe féminine de handball de moins de 25 ans :'

SELECT NomAthlete AS Athlete
FROM Athlete
WHERE Age < 25
AND IDAthlete IN (
  SELECT IDAthlete
  FROM Membres
  WHERE IDEquipe IN (
    SELECT IDEquipe
    FROM Equipe
    WHERE sexe = 'Femme'
    AND IDSport IN (
      SELECT IDSport
      FROM Sport
      WHERE nomSport = 'Handball'
    )
  )
);

\echo '4. Les médailles gagnées par Michael Phelps, avec l\'épreuve et le temps correspondants :'

\echo '   (Pas faisable sans ratacher la participation à la médaille...) Requête sans le temps :'

SELECT EpreuveIndividuelle.nomEpreuve, MedailleIndividuelle.type
FROM EpreuveIndividuelle, MedailleIndividuelle
WHERE EpreuveIndividuelle.IDEpreuve = MedailleIndividuelle.IDEpreuve
AND MedailleIndividuelle.IDGagnant IN (
  SELECT IDAthlete
  FROM Athlete
  WHERE nomAthlete = 'Michael Phelps'
);

\echo '5. La liste des sports pratiqués en équipe'

SELECT nomSport AS Sport
FROM Sport
WHERE type = 'Collectif';

\echo '6. Le meilleur temps réalisé au marathon'

SELECT MIN(Score)
FROM ParticipationIndividuelle
WHERE IDMatch IN (
  SELECT IDMatch
  FROM MatchIndividuel
  WHERE IDEpreuve IN (
    SELECT IDEpreuve
    FROM EpreuveIndividuelle
    WHERE nomEpreuve = 'Marathon'
  )
);

\echo '+---------------------------------------| Dificulté II |---------------------------------------+'
\echo

\echo '1. La moyenne des temps réalisés au 200 mètres nage libre par nationalité :'

SELECT CONCAT(CAST(CAST(AVG(CAST(SUBSTRING(ParticipationIndividuelle.score, 1, 2) AS INT)) AS INT) AS TEXT), ' sec') AS TempsMoyen, Athlete.Pays
FROM ParticipationIndividuelle, Athlete
WHERE Athlete.IDAthlete = ParticipationIndividuelle.IDParticipant
AND IDMatch IN (
  SELECT IDMatch
  FROM MatchIndividuel
  WHERE IDEpreuve IN (
    SELECT IDEpreuve
    FROM EpreuveIndividuelle
    WHERE nomEpreuve = '200m nage libre'
  )
)
GROUP BY Pays;

\echo '2. Le nombre de médailles par pays représentés (rappel : une seule médaille est comptée pour une équipe) :'

WITH Medailles (IDMedaille, Pays) AS (
  SELECT MedailleIndividuelle.IDMedaille, Athlete.Pays
  FROM MedailleIndividuelle, Athlete
  WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
  UNION ALL
  SELECT MedailleCollective.IDMedaille, Equipe.Pays
  FROM MedailleCollective, Equipe
  WHERE MedailleCollective.IDGagnant = Equipe.IDequipe
)
SELECT COUNT(IDMedaille) AS NbrMedaille, Pays
FROM Medailles
GROUP BY Pays
ORDER BY NbrMedaille DESC;

\echo '3. Pour chaque épreuve, le nom et la nationalité de l\'athlète ayant obtenu la médaille d\'or, ainsi que le nom et la nationalité de'
\echo '   celui ayant obtenu la médaille d\'argent (tableau résultat avec 5 attributs) :'

SELECT EpreuveIndividuelle.nomEpreuve,
A_OR.nomAthlete AS Gagnant_OR,
A_OR.pays,
A_ARGENT.nomAthlete AS Gagnant_Argent,
A_ARGENT.pays
FROM EpreuveIndividuelle,
Athlete AS A_OR,
Athlete AS A_Argent,
MedailleIndividuelle AS M_OR,
MedailleIndividuelle AS M_Argent
WHERE (A_OR.IDAthlete = M_OR.IDGagnant
  AND M_OR.type = 'Or'
  AND M_OR.IDEpreuve = EpreuveIndividuelle.IDEpreuve)
AND (A_ARGENT.IDAthlete = M_ARGENT.IDGagnant
  AND M_ARGENT.type = 'Argent'
  AND M_ARGENT.IDEpreuve = EpreuveIndividuelle.IDEpreuve);

\echo '4. Les athlètes qui n\'ont obtenu aucune médaille d\'or :'

SELECT *
FROM Athlete
WHERE IDAthlete NOT IN (
  SELECT IDGagnant
  FROM MedailleIndividuelle
  WHERE type = 'Or'
)
LIMIT 10; -- On affiche seulement 10 tuples pour ne pas à avoir à afficher tout les athlètes.

\echo '5. Les sports individuels dans lesquels la France n\'a pas obtenu de médaille :'

SELECT DISTINCT nomSport AS Sport
FROM Sport
WHERE Sport.IDSport IN (
  SELECT IDSport
  FROM EpreuveIndividuelle
  WHERE EpreuveIndividuelle.IDEpreuve IN (
    SELECT IDEpreuve
    FROM MedailleIndividuelle
    WHERE MedailleIndividuelle.IDGagnant NOT IN (
      SELECT IDAthlete
      FROM Athlete
      WHERE Athlete.Pays = 'France'
    )
  )
);

\echo '6. Les coureurs qui n\'ont jamais mis plus de dix secondes au 100m :'

WITH Temps (seconds, IDParticipant) AS (
  SELECT CAST(SUBSTRING(score, 7, 2) AS INT) AS seconds, IDParticipant
  FROM ParticipationIndividuelle
  WHERE IDmatch IN (
    SELECT IDMatch
    FROM MatchIndividuel
    WHERE IDEpreuve IN (
      SELECT IDEpreuve
      FROM EpreuveIndividuelle
      WHERE nomEpreuve = '100m'
    )
  )
)
SELECT nomAthlete
FROM Athlete
WHERE IDAthlete IN (
  SELECT IDParticipant
  FROM ParticipationIndividuelle
  WHERE IDmatch IN (
    SELECT IDMatch
    FROM MatchIndividuel
    WHERE IDEpreuve IN (
      SELECT IDEpreuve
      FROM EpreuveIndividuelle
      WHERE nomEpreuve = '100m'
    )
  )
)
AND IDAthlete NOT IN (
  SELECT IDParticipant
  FROM temps
  WHERE seconds > 10
);

\echo '+---------------------------------------| Dificulté III |---------------------------------------+'
\echo

\echo '1. L\'athlète qui a concouru sept jours consécutifs et a gagné à chaque fois :'

\echo
\echo '   Pas fait...'
\echo

\echo '2. Les pays qui ont eu une médaille dans chaque catégorie sportive (pas forcément à toutes les épreuves de cette catégorie et'
\echo '   par catégorie, on considère ici Sport :'

WITH SportPays (nomSport, Pays) AS (
  SELECT Sport.nomSport, Athlete.Pays
  FROM MedailleIndividuelle, Athlete, EpreuveIndividuelle, Sport
  WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
  AND EpreuveIndividuelle.IDEpreuve = MedailleIndividuelle.IDEpreuve
  AND EpreuveIndividuelle.IDSport = Sport.IDSport
  UNION ALL
  SELECT Sport.nomSport, Equipe.Pays
  FROM MedailleCollective, Equipe, EpreuveCollective, Sport
  WHERE MedailleCollective.IDGagnant = Equipe.IDEquipe
  AND EpreuveCollective.IDEpreuve = MedailleCollective.IDEpreuve
  AND EpreuveCollective.IDSport = Sport.IDSport
)
SELECT Pays
FROM SportPays
GROUP BY Pays
HAVING COUNT(DISTINCT nomSport) > (SELECT COUNT(nomSport) FROM Sport);

\echo '3. Les cinq catégories sportives pour lesquelles il y a le moins d\'épreuves :'

WITH Epreuves (IDEpreuves, nomSport) AS (
  SELECT IDEpreuve, Sport.nomSport
  FROM EpreuveIndividuelle, Sport
  WHERE EpreuveIndividuelle.IDSport = Sport.IDSport
  UNION ALL
  SELECT IDEpreuve, Sport.nomSport
  FROM EpreuveCollective, Sport
  WHERE EpreuveCollective.IDSport = Sport.IDSport
)
SELECT COUNT(IDEpreuves) AS NbrEpreuves, nomSport AS Sport
FROM Epreuves
GROUP BY Epreuves.nomSport
ORDER BY NbrEpreuves ASC
LIMIT 5;

\echo '4. Le pourcentage de médailles remportées par des femmes (y compris en équipe) :'

WITH Medailles (IDGagnant, Sexe) AS (
  SELECT MedailleIndividuelle.IDGagnant, Athlete.sexe
  FROM MedailleIndividuelle, Athlete
  WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
  UNION ALL
  SELECT MedailleCollective.IDGagnant, Equipe.sexe
  FROM MedailleCollective, Equipe
  WHERE MedailleCollective.IDGagnant = Equipe.IDEquipe
)
SELECT CONCAT(CAST(COUNT(Sexe) * 100 / (Select COUNT(*) FROM Medailles) AS TEXT), ' %') AS Femme_Medailles
FROM Medailles
WHERE Sexe = 'Femme'
GROUP BY Sexe;

\echo '5. Le nombre total de points marqués par l\'équipe féminine de handball qui a marqué plus de points que chaque équipe masculine :'
\echo '   de handball tout au long des jeux :'

\echo
\echo '   Pas fait...'
\echo

\echo '6. Les pays qui ont obtenu plus de médailles que la France dans chaque sport :'

WITH MedaillePaysPart (Pays, Sport, nbMedaillesTotal) AS (
  SELECT Athlete.Pays, Sport.nomSport, COUNT(MedailleIndividuelle.IDMedaille)
  FROM Athlete, Sport, MedailleIndividuelle, EpreuveIndividuelle
  WHERE EpreuveIndividuelle.IDSport = Sport.IDSport
  AND MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
  GROUP BY Athlete.Pays, Sport.nomSport
  UNION ALL
  SELECT Equipe.Pays, Sport.nomSport, COUNT(MedailleCollective.IDMedaille)
  FROM Equipe, Sport, MedailleCollective, EpreuveCollective
  WHERE EpreuveCollective.IDSport = Sport.IDSport
  AND MedailleCollective.IDGagnant = Equipe.IDEquipe
  GROUP BY Equipe.Pays, Sport.nomSport
)
SELECT MedaillePaysPart.Pays, MedaillePaysPart.Sport
FROM MedaillePaysPart
WHERE nbMedaillesTotal > ALL (
  SELECT nbMedaillesTotal
  FROM MedaillePaysPart
  WHERE Pays IN ('France')
);

\echo '+---------------------------------------| Requêtes Perso |---------------------------------------+'
\echo

\echo 'Classement des pays ayant gagné le plus de medailles avec le nombre de'
\echo 'medailles par type (Or, Argent ou Bronze) :'

CREATE VIEW MedailleOr (nbrOr, Pays) AS (
  WITH MedaillesOr (IDMedaille, Pays) AS (
    SELECT MedailleIndividuelle.IDMedaille, Athlete.Pays
    FROM MedailleIndividuelle, Athlete
    WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
    AND MedailleIndividuelle.type = 'Or'
    UNION ALL
    SELECT MedailleCollective.IDMedaille, Equipe.Pays
    FROM MedailleCollective, Equipe
    WHERE MedailleCollective.IDGagnant = Equipe.IDequipe
    AND MedailleCollective.type = 'Or'
  )
  SELECT COUNT(IDMedaille), Pays
  FROM MedaillesOr
  GROUP BY Pays
);

CREATE VIEW MedailleArgent (nbrArgent, Pays) AS (
  WITH MedaillesArgent (IDMedaille, Pays) AS (
    SELECT MedailleIndividuelle.IDMedaille, Athlete.Pays
    FROM MedailleIndividuelle, Athlete
    WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
    AND MedailleIndividuelle.type = 'Argent'
    UNION ALL
    SELECT MedailleCollective.IDMedaille, Equipe.Pays
    FROM MedailleCollective, Equipe
    WHERE MedailleCollective.IDGagnant = Equipe.IDequipe
    AND MedailleCollective.type = 'Argent'
  )
  SELECT COUNT(IDMedaille), Pays
  FROM MedaillesArgent
  GROUP BY Pays
);

CREATE VIEW MedailleBronze (nbrBronze, Pays) AS (
  WITH MedaillesBronze (IDMedaille, Pays) AS (
    SELECT MedailleIndividuelle.IDMedaille, Athlete.Pays
    FROM MedailleIndividuelle, Athlete
    WHERE MedailleIndividuelle.IDGagnant = Athlete.IDAthlete
    AND MedailleIndividuelle.type = 'Bronze'
    UNION ALL
    SELECT MedailleCollective.IDMedaille, Equipe.Pays
    FROM MedailleCollective, Equipe
    WHERE MedailleCollective.IDGagnant = Equipe.IDequipe
    AND MedailleCollective.type = 'Bronze'
  )
  SELECT COUNT(IDMedaille), Pays
  FROM MedaillesBronze
  GROUP BY Pays
);

SELECT MedailleOr.Pays, MedailleOr.nbrOr AS Or, MedailleArgent.NbrArgent AS Argent, MedailleBronze.nbrBronze AS Bronze
FROM MedailleOr, MedailleArgent, MedailleBronze
WHERE MedailleOr.Pays = MedailleArgent.Pays
AND MedailleArgent.Pays = MedailleBronze.Pays
ORDER BY (MedailleOr.nbrOr * 3) + (MedailleArgent.NbrArgent * 2) + (MedailleBronze.nbrBronze) DESC;

DROP VIEW MedailleOr;
DROP VIEW MedailleArgent;
DROP VIEW MedailleBronze;

\echo 'Les athlètes qui n\'ont concouru que le 15 août :'

SELECT Athlete.NomAthlete
FROM Athlete
WHERE Athlete.IDAthlete IN (
  SELECT ParticipationIndividuelle.IDParticipant
  FROM ParticipationIndividuelle
)
AND Athlete.IDAthlete NOT IN (
  SELECT ParticipationIndividuelle.IDParticipant
  FROM ParticipationIndividuelle, MatchIndividuel
  WHERE ParticipationIndividuelle.IDMatch = MatchIndividuel.IDMatch
  AND MatchIndividuel.dateMatch != '2016/08/15'
);

\echo 'Le pourcentage d\'athletes ayant participé à des épreuves d\'athlétisme par pays :'

WITH Athletes (nomAthlete, Pays) AS (
  WITH PleinDAthletes (nomAthlete, Pays) AS (
    SELECT Athlete.nomAthlete, Athlete.Pays
    FROM Athlete, ParticipationIndividuelle, Sport, MatchIndividuel, EpreuveIndividuelle
    WHERE Sport.nomSport = 'Athlétisme'
    AND EpreuveIndividuelle.IDSport = Sport.IDSport
    AND MatchIndividuel.IDEpreuve = EpreuveIndividuelle.IDEpreuve
    AND ParticipationIndividuelle.IDMatch = MatchIndividuel.IDMatch
    AND Athlete.IDAthlete = ParticipationIndividuelle.IDParticipant
    UNION ALL
    SELECT Athlete.nomAthlete, Athlete.Pays
    FROM Athlete, ParticipationCollective, Membres, Sport, MatchCollectif, EpreuveCollective
    WHERE Sport.nomSport = 'Athlétisme'
    AND EpreuveCollective.IDSport = Sport.IDSport
    AND MatchCollectif.IDEpreuve = EpreuveCollective.IDEpreuve
    AND ParticipationCollective.IDMatch = MatchCollectif.IDMatch
    AND Membres.IDEquipe = ParticipationCollective.IDParticipant
    AND Athlete.IDAthlete = Membres.IDAthlete
  )
  SELECT DISTINCT *
  FROM PleinDAthletes
)
SELECT CONCAT('0,', CONCAT(CAST(COUNT(Athletes.nomAthlete) * 1000 / (Select COUNT(*) FROM Athlete) AS TEXT), ' %')) AS Athlt, Pays
FROM Athletes
GROUP BY Pays
ORDER BY Pays;
