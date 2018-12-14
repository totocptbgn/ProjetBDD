
-- Ce fichier contient les requetes.

-- Clear la console
--

\! clear

-- Requêtes :
--

\echo '----------------- Dificulté I -----------------'
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

-- 4. Les médailles gagnées par Michael Phelps, avec l\'épreuve et le temps correspondants
  -- /!\ Remplir les médailles remportées par MP et remplir les medailles avec l'id de participation

\echo '5. La liste des sports pratiqués en équipe'

SELECT nomSport AS Sport
FROM Sport
WHERE type = 'Collectif';

\echo '6. Le meilleur temps réalisé au marathon'

SELECT Score
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

\echo '----------------- Dificulté II -----------------'
\echo

-- 1. La moyenne des temps réalisés au 200 mètres nage libre par nationalité

\echo '2. Le nombre de médailles par pays représentés (rappel : une seule médaille est comptée pour une équipe)'

WITH Medailles (IDMedaille, Pays) AS (
  SELECT MedailleIndividuel.IDMedaille, Athlete.Pays
  FROM MedailleIndividuel, Athlete
  WHERE MedailleIndividuel.IDGagnant = Athlete.IDAthlete
  UNION
  SELECT MedailleCollectif.IDMedaille, Equipe.Pays
  FROM MedailleCollectif, Equipe
  WHERE MedailleCollectif.IDGagnant = Equipe.IDequipe
)
SELECT COUNT(IDMedaille) AS NbrMedaille, Pays
FROM Medailles
GROUP BY Pays
ORDER BY NbrMedaille DESC;

-- 3. Pour chaque épreuve, le nom et la nationalité de l'athlète ayant obtenu la médaille d'or, ainsi que le nom et la nationalité de celui ayant obtenu la médaille d'argent (tableau résultat avec 5 attributs)

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

/*
SELECT nomSport
FROM SPORT
WHERE type = 'Individuel'
AND IDSport NOT IN (
);
*/

-- 6. Les coureurs qui n'ont jamais mis plus de dix secondes au 100m Implémentez ensuite au minimum 4 requêtes au choix parmi les 6 suivantes :

\echo '----------------- Dificulté III -----------------'
\echo
-- 1. L'athlète qui a concouru sept jours consécutifs et a gagné à chaque fois
-- 2. Les pays qui ont eu une médaille dans chaque catégorie sportive (pas forcément à toutes les épreuves de cette catégorie)

\echo '3. Les cinq catégories sportives pour lesquelles il y a le moins d\'épreuves'

WITH Epreuves (IDEpreuves, nomSport) AS (
  SELECT IDEpreuve, Sport.nomSport
  FROM EpreuveIndividuel, Sport
  WHERE EpreuveIndividuel.IDSport = Sport.IDSport
  UNION
  SELECT IDEpreuve, Sport.nomSport
  FROM EpreuveCollective, Sport
  WHERE EpreuveCollective.IDSport = Sport.IDSport
)
SELECT COUNT(IDEpreuves) AS NbrEpreuves, nomSport AS Sport
FROM Epreuves
GROUP BY Epreuves.nomSport
ORDER BY NbrEpreuves ASC
LIMIT 5;

-- 4. Le pourcentage de médailles remportées par des femmes (y compris en équipe)
-- 5. Le nombre total de points marqués par l'équipe féminine de handball qui a marqué plus de points que chaque équipe masculine de handball tout au long des jeux
-- 6. Les pays qui ont obtenu plus de médailles que la France dans chaque sport
