
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

-- Clear la console
--
\! clear

-- Requêtes :
--

-- Dificulté I --

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

\echo
-- /!\ Remplir les médailles remportées par MP et remplir les medailles avec l'id de participation

\echo '5. La liste des sports pratiqués en équipe'

SELECT nomSport AS Sport
FROM Sport
WHERE type = 'Collectif';

\echo '6. Le meilleur temps réalisé au marathon'

SELECT Score
FROM Particpation
WHERE IDMatch IN (
  SELECT IDMatch
  FROM Match
  WHERE IDEpreuve IN (
    SELECT IDEpreuve
    FROM EpreuveIndividuel
    WHERE nomEpreuve = 'Marathon'
  )
);

-- Dificulté II --

-- 1. La moyenne des temps réalisés au 200 mètres nage libre par nationalité
-- 2. Le nombre de médailles par pays représentés (rappel : une seule médaille est comptée pour une équipe)
-- 3. Pour chaque épreuve, le nom et la nationalité de l'athlète ayant obtenu la médaille d'or, ainsi que le nom et la nationalité de celui ayant obtenu la médaille d'argent (tableau résultat avec 5 attributs)
-- 4. Les athlètes qui n'ont obtenu aucune médaille d'or
-- 5. Les sports individuels dans lesquels la France n'a pas obtenu de médaille
-- 6. Les coureurs qui n'ont jamais mis plus de dix secondes au 100m Implémentez ensuite au minimum 4 requêtes au choix parmi les 6 suivantes :

-- Dificulté III --

-- 1. L'athlète qui a concouru sept jours consécutifs et a gagné à chaque fois
-- 2. Les pays qui ont eu une médaille dans chaque catégorie sportive (pas forcément à toutes les épreuves de cette catégorie)
-- 3. Les cinq catégories sportives pour lesquelles il y a le moins d'épreuves
-- 4. Le pourcentage de médailles remportées par des femmes (y compris en équipe)
-- 5. Le nombre total de points marqués par l'équipe féminine de handball qui a marqué plus de points que chaque équipe masculine de handball tout au long des jeux
-- 6. Les pays qui ont obtenu plus de médailles que la France dans chaque sport
