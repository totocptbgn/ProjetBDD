
-- Ce fichier contient les requetes.

-- Clear la console
--

\! clear

-- Requêtes :
--

\echo '---------------------------------- Dificulté I ----------------------------------'
\echo

\echo '1. La liste des athlètes italiens ayant obtenu une médaille :'

SELECT DISTINCT NomAthlete AS Athlete
FROM Athlete, MedailleIndividuel
WHERE Athlete.IDAthlete = MedailleIndividuel.IDGagnant
AND Athlete.Pays = 'Italie';

\echo '2. Le nom et la nationalité des médaillés du 100m, 200m, et 400m avec à chaque fois le type de médaille (or, argent, bronze) :'

SELECT Athlete.NomAthlete AS Nom, Athlete.Pays, MedailleIndividuel.type
FROM Athlete, MedailleIndividuel
WHERE Athlete.IDAthlete = MedailleIndividuel.IDGagnant
AND IDEpreuve IN (
  SELECT IDEpreuve
  FROM EpreuveIndividuel
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

SELECT EpreuveIndividuel.nomEpreuve, MedailleIndividuel.type
FROM EpreuveIndividuel, MedailleIndividuel
WHERE EpreuveIndividuel.IDEpreuve = MedailleIndividuel.IDEpreuve
AND MedailleIndividuel.IDGagnant IN (
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
    FROM EpreuveIndividuel
    WHERE nomEpreuve = 'Marathon'
  )
);

\echo '---------------------------------- Dificulté II ----------------------------------'
\echo

\echo '1. La moyenne des temps réalisés au 200 mètres nage libre par nationalité'

SELECT CONCAT(CAST(CAST(AVG(CAST(SUBSTRING(ParticipationIndividuelle.score, 1, 2) AS INT)) AS INT) AS TEXT), ' sec') AS TempsMoyen, Athlete.Pays
FROM ParticipationIndividuelle, Athlete
WHERE Athlete.IDAthlete = ParticipationIndividuelle.IDParticipant
AND IDMatch IN (
  SELECT IDMatch
  FROM MatchIndividuel
  WHERE IDEpreuve IN (
    SELECT IDEpreuve
    FROM EpreuveIndividuel
    WHERE nomEpreuve = '200m nage libre'
  )
)
GROUP BY Pays;

\echo '2. Le nombre de médailles par pays représentés (rappel : une seule médaille est comptée pour une équipe)'

WITH Medailles (IDMedaille, Pays) AS (
  SELECT MedailleIndividuel.IDMedaille, Athlete.Pays
  FROM MedailleIndividuel, Athlete
  WHERE MedailleIndividuel.IDGagnant = Athlete.IDAthlete
  UNION ALL
  SELECT MedailleCollectif.IDMedaille, Equipe.Pays
  FROM MedailleCollectif, Equipe
  WHERE MedailleCollectif.IDGagnant = Equipe.IDequipe
)
SELECT COUNT(IDMedaille) AS NbrMedaille, Pays
FROM Medailles
GROUP BY Pays
ORDER BY NbrMedaille DESC;

\echo '3. Pour chaque épreuve, le nom et la nationalité de l\'athlète ayant obtenu la médaille d\'or, ainsi que le nom et la nationalité de'
\echo '   celui ayant obtenu la médaille d\'argent (tableau résultat avec 5 attributs)'

SELECT EpreuveIndividuel.nomEpreuve,
A_OR.nomAthlete AS Gagnant_OR,
A_OR.pays,
A_ARGENT.nomAthlete AS Gagnant_Argent,
A_ARGENT.pays
FROM EpreuveIndividuel,
Athlete AS A_OR,
Athlete AS A_Argent,
MedailleIndividuel AS M_OR,
MedailleIndividuel AS M_Argent
WHERE (A_OR.IDAthlete = M_OR.IDGagnant
  AND M_OR.type = 'Or'
  AND M_OR.IDEpreuve = EpreuveIndividuel.IDEpreuve)
AND (A_ARGENT.IDAthlete = M_ARGENT.IDGagnant
  AND M_ARGENT.type = 'Argent'
  AND M_ARGENT.IDEpreuve = EpreuveIndividuel.IDEpreuve);

\echo '4. Les athlètes qui n\'ont obtenu aucune médaille d\'or'

SELECT *
FROM Athlete
WHERE IDAthlete NOT IN (
  SELECT IDGagnant
  FROM MedailleIndividuel
  WHERE type = 'Or'
)
LIMIT 10; -- On affiche seulement 10 tuples pour ne pas à avoir à afficher tout les athlètes.

\echo '5. Les sports individuels dans lesquels la France n\'a pas obtenu de médaille'

SELECT DISTINCT nomSport AS Sport
FROM Sport
WHERE Sport.IDSport IN (
  SELECT IDSport
  FROM EpreuveIndividuel
  WHERE EpreuveIndividuel.IDEpreuve IN (
    SELECT IDEpreuve
    FROM MedailleIndividuel
    WHERE MedailleIndividuel.IDGagnant NOT IN (
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
      FROM EpreuveIndividuel
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
      FROM EpreuveIndividuel
      WHERE nomEpreuve = '100m'
    )
  )
)
AND IDAthlete NOT IN (
  SELECT IDParticipant
  FROM temps
  WHERE seconds > 10
);

\echo '---------------------------------- Dificulté III ----------------------------------'
\echo

\echo '1. L\'athlète qui a concouru sept jours consécutifs et a gagné à chaque fois :'

\echo
\echo '   /!\\ PAS ENCORE FAIT /!\\'
\echo

\echo '2. Les pays qui ont eu une médaille dans chaque catégorie sportive (pas forcément à toutes les épreuves de cette catégorie) :'

\echo
\echo '   /!\\ PAS ENCORE FAIT /!\\'
\echo

\echo '3. Les cinq catégories sportives pour lesquelles il y a le moins d\'épreuves'

WITH Epreuves (IDEpreuves, nomSport) AS (
  SELECT IDEpreuve, Sport.nomSport
  FROM EpreuveIndividuel, Sport
  WHERE EpreuveIndividuel.IDSport = Sport.IDSport
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
  SELECT MedailleIndividuel.IDGagnant, Athlete.sexe
  FROM MedailleIndividuel, Athlete
  WHERE MedailleIndividuel.IDGagnant = Athlete.IDAthlete
  UNION ALL
  SELECT MedailleCollectif.IDGagnant, Equipe.sexe
  FROM MedailleCollectif, Equipe
  WHERE MedailleCollectif.IDGagnant = Equipe.IDEquipe
)
SELECT CONCAT(CAST(COUNT(Sexe) * 100 / (Select COUNT(*) FROM Medailles) AS TEXT), ' %') AS Femme_Medailles
FROM Medailles
WHERE Sexe = 'Femme'
GROUP BY Sexe;

\echo '5. Le nombre total de points marqués par l\'équipe féminine de handball qui a marqué plus de points que chaque équipe masculine'
\echo '   de handball tout au long des jeux :'

\echo
\echo '   /!\\ PAS ENCORE FAIT /!\\'
\echo

\echo '6. Les pays qui ont obtenu plus de médailles que la France dans chaque sport'

\echo
\echo '   /!\\ PAS ENCORE FAIT /!\\'
\echo
