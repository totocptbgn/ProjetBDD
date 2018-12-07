
-- Ce fichier est à utiliser pour remplir les tables crées avec 'arch.sql'.


INSERT INTO Sport (type, nomSport) VALUES
  ('Individuel', 'Natation'),
  ('Individuel', 'Equitation'),
  ('Individuel', 'Athlétisme'),
  ('Collectif', 'Athlétisme'),
  ('Individuel', 'Gymnastique'),
  ('Collectif', 'Aviron'),
  ('Collectif', 'Badminton'),
  ('Collectif', 'Baseball'),
  ('Collectif', 'Basketball'),
  ('Individuel', 'Judo'),
  ('Individuel', 'Escrime'),
  ('Collectif', 'Escrime'),
  ('Collectif', 'Tennis'),
  ('Individuel', 'Tennis'),
  ('Collectif', 'Escrime'),
  ('Collectif', 'Tennis de Table'),
  ('Individuel', 'Tennis de Table'),
  ('Individuel', 'Tir à l Arc'),
  ('Collectif', 'Volley Ball');

INSERT INTO Athlete (NomAthlete, Pays, IDSport, sexe, age) VALUES
  ('Carlito Neves', 'Portugal', 5, 'Homme', 25),
  ('Zhen Shun', 'Chine', 12, 'Homme', 22),
  ('Tolstaya Valerievna', 'Russie', 5, 'Femme', 19),
  ('Tsuo Yixing', 'Chine', 11, 'Femme', 35),
  ('Berend Pultz', 'Allemagne', 4, 'Homme', 33),
  ('David Brown', 'Etats Unis', 5, 'Homme', 33),
  ('Ramla Badie', 'Algerie', 1, 'Femme', 18),
  ('Paula Anjos', 'Brésil', 10, 'Femme', 22),
  ('Grace Dixon', 'Etats Unis', 4, 'Femme', 22),
  ('Jean-François Dupont', 'France', 8, 'Homme', 19),
  ('Nardin Timurovich', 'Russie', 9, 'Homme', 26),
  ('Fabiano Ávila', 'Portugal', 3, 'Homme', 19),
  ('Shao Zan', 'Chine', 10, 'Femme', 25),
  ('Shi Lingxin', 'Chine', 7, 'Homme', 17),
  ('Marie Sharpe', 'Etats Unis', 9, 'Femme', 23),
  ('Elliot Robinson', 'Etats Unis', 8, 'Homme', 28),
  ('Ana Velázquez', 'Espagne', 3, 'Femme', 23),
  ('Tolstaya Valerievna', 'Russie', 7, 'Femme', 31),
  ('Pong Woo-Jin', 'Corée Du Sud', 3, 'Homme', 26),
  ('Arina Vitalievna', 'Russie', 5, 'Femme', 35),
  ('Violeta Tamayo', 'Espagne', 1, 'Femme', 29),
  ('Shao Feng', 'Chine', 13, 'Femme', 31),
  ('Ri Hae-Seong', 'Corée Du Sud', 4, 'Homme', 32),
  ('Luzia Henriques', 'Portugal', 1, 'Femme', 25),
  ('Eto Masaharu', 'Japon', 6, 'Homme', 33),
  ('Melissa Booth', 'Etats Unis', 3, 'Femme', 18),
  ('Harako Ito', 'Japon', 4, 'Femme', 23),
  ('Lena Cavoli', 'Italie', 5, 'Femme', 32),
  ('Azeema al-Farra', 'Algerie', 3, 'Homme', 29),
  ('Lena Sequeira', 'Portugal', 3, 'Femme', 20),
  ('Katerine Bauer', 'Allemagne', 5, 'Femme', 27),
  ('Kyong Tohyon', 'Corée Du Sud', 4, 'Homme', 23),
  ('Hawraa al-Zaidi', 'Algerie', 4, 'Femme', 23),
  ('Takemoto Katsunosuki', 'Japon', 5, 'Homme', 28),
  ('Tharwa el-Beydoun', 'Algerie', 3, 'Femme', 20),
  ('Usain Balt', 'Jamaique', 6, 'Homme', 20),
  ('Zufar al-Jabara', 'Algerie', 6, 'Homme', 29),
  ('Eli Osborn', 'Canada', 12, 'Homme', 27),
  ('Louis Morel', 'France', 3, 'Homme', 24),
  ('Wu Cai', 'Chine', 4, 'Femme', 22),
  ('Yoshiyuki Eiko', 'Japon', 9, 'Femme', 27),
  ('Kum Ki-Nam', 'Corée Du Sud', 10, 'Homme', 33),
  ('Scott Davies', 'Etats Unis', 2, 'Homme', 17),
  ('Arefyev Dmitrievich', 'Russie', 1, 'Homme', 35),
  ('Eristov Makarovich', 'Russie', 3, 'Homme', 23),
  ('Wang Hui', 'Chine', 3, 'Homme', 35),
  ('Harley Parry', 'Canada', 13, 'Homme', 32),
  ('Petrichia Paccollu', 'Italie', 3, 'Femme', 24),
  ('Naiara Cruz', 'Portugal', 8, 'Femme', 28),
  ('Tsu Xi', 'Chine', 5, 'Femme', 34),
  ('Chi Shi-Won', 'Corée Du Sud', 8, 'Femme', 20),
  ('Celso Matos', 'Portugal', 1, 'Homme', 27),
  ('Swen Hildebrandt', 'Allemagne', 9, 'Homme', 31),
  ('Alexandre Peletier', 'France', 5, 'Homme', 33),
  ('Dylan Elliott', 'Etats Unis', 8, 'Homme', 20),
  ('Zoe Chapman', 'Royaume Uni', 1, 'Femme', 17),
  ('Keyla Atkins', 'Royaume Uni', 7, 'Femme', 32),
  ('Archer Wood', 'Canada', 3, 'Homme', 24),
  ('Lillie Slater', 'Royaume Uni', 7, 'Femme', 33),
  ('Hilda Bohlen', 'Allemagne', 11, 'Femme', 19),
  ('Xuan Nuan', 'Chine', 5, 'Femme', 32),
  ('Trayvon Vernon', 'Jamaique', 10, 'Homme', 32),
  ('Harvey Carney', 'Etats Unis', 10, 'Homme', 28),
  ('Matilda Walker', 'Canada', 10, 'Femme', 19),
  ('Hyon Chunho', 'Corée Du Sud', 12, 'Femme', 18),
  ('Isaac Williams', 'Etats Unis', 7, 'Homme', 28),
  ('Ewan Hussain', 'Etats Unis', 11, 'Homme', 30),
  ('Françoise Levet', 'France', 13, 'Femme', 20),
  ('Théodore Hauet', 'France', 4, 'Homme', 28),
  ('Joana Queiros', 'Portugal', 12, 'Femme', 34),
  ('Jesús Campos', 'Espagne', 3, 'Homme', 35),
  ('Jack Webb', 'Royaume Uni', 2, 'Homme', 30),
  ('Valfrido Ciminelli', 'Italie', 11, 'Homme', 25),
  ('Ding Chun', 'Chine', 8, 'Femme', 32),
  ('Camila Elvira', 'Espagne', 3, 'Femme', 30),
  ('Friedrich Klengel', 'Allemagne', 9, 'Homme', 26),
  ('Lillie Slater', 'Royaume Uni', 4, 'Homme', 29),
  ('Quinzio Casagranda', 'Italie', 3, 'Homme', 20),
  ('Huo Zhelan', 'Chine', 13, 'Femme', 32),
  ('Gautier Cartier', 'France', 3, 'Homme', 30),
  ('Leeroy Jenkins', 'Royaume Uni', 7, 'Homme', 24),
  ('Oscar Mills', 'Etats Unis', 3, 'Homme', 25),
  ('Riley Dean', 'Royaume Uni', 1, 'Homme', 27),
  ('Grete Reichenbach', 'Allemagne', 3, 'Femme', 26),
  ('Tarasov Andreevich', 'Russie', 6, 'Homme', 24),
  ('Silvio Cafarella', 'Italie', 3, 'Homme', 29),
  ('Mo Seong', 'Corée Du Sud', 8, 'Femme', 33),
  ('Ruy Rego', 'Brésil', 13, 'Homme', 31),
  ('Pedro Lopes', 'Portugal', 7, 'Homme', 19),
  ('Tyjon Stackpole', 'Jamaique', 5, 'Homme', 34),
  ('Kendra Prince', 'Canada', 4, 'Femme', 21),
  ('Luana Sancho', 'Espagne', 4, 'Femme', 31),
  ('Johanna Pöpel', 'Allemagne', 2, 'Femme', 33),
  ('Phoebe Cooke', 'Royaume Uni', 13, 'Femme', 29),
  ('Mao Cai', 'Chine', 4, 'Femme', 21),
  ('Samuel Bötticher', 'Allemagne', 4, 'Homme', 35),
  ('Yokoyama Kiemon', 'Japon', 11, 'Homme', 25),
  ('Ercolano Tartaglione', 'Italie', 1, 'Homme', 35),
  ('Miriam Olberding', 'Allemagne', 13, 'Femme', 24),
  ('Melissa Saavedra', 'Espagne', 2, 'Femme', 27),
  ('Hans Zimmer', 'Allemagne', 3, 'Homme', 23),
  ('Maisie Clark', 'Etats Unis', 5, 'Femme', 29),
  ('Corey Lane', 'Royaume Uni', 6, 'Homme', 27),
  ('Ewan Porter', 'Etats Unis', 13, 'Homme', 29),
  ('Zita Di Donato', 'Italie', 6, 'Femme', 21),
  ('Chun Kun-Woo', 'Corée Du Sud', 13, 'Homme', 29),
  ('Chekib Hamila', 'Algerie', 2, 'Homme', 21),
  ('Ulisse Pellecchia', 'Italie', 13, 'Homme', 26),
  ('Kilian Fassbender', 'Allemagne', 8, 'Homme', 17),
  ('Duda Bento', 'Portugal', 2, 'Homme', 23),
  ('Krutina Nikitovna', 'Russie', 2, 'Femme', 33),
  ('Simone Neufeld', 'Allemagne', 1, 'Femme', 27),
  ('Maida Del Grosso', 'Italie', 9, 'Femme', 30),
  ('Brisa Andrade', 'Espagne', 5, 'Femme', 25),
  ('Elías Cambeiro', 'Espagne', 2, 'Homme', 33),
  ('Chikae Megumi', 'Japon', 9, 'Femme', 17),
  ('Maia Morais', 'Portugal', 8, 'Femme', 27),
  ('Legend Chen', 'Canada', 10, 'Homme', 19),
  ('Mok Tae-Woo', 'Corée Du Sud', 7, 'Homme', 33),
  ('Josh Miller', 'Canada', 6, 'Homme', 25),
  ('Christelle Maitre', 'France', 5, 'Femme', 22),
  ('Benjamin Courbis', 'France', 6, 'Homme', 20),
  ('Aaden Jimenez', 'Royaume Uni', 5, 'Homme', 34),
  ('Annick Bessette', 'France', 8, 'Femme', 35),
  ('Xuan Yang', 'Chine', 3, 'Homme', 26),
  ('Shao Huo', 'Chine', 2, 'Femme', 32),
  ('Eros Sessa', 'Italie', 7, 'Homme', 27),
  ('Jenson Rees', 'Etats Unis', 3, 'Homme', 24),
  ('Sara Cortes', 'Portugal', 3, 'Femme', 34),
  ('Tsu Pao', 'Corée Du Sud', 12, 'Homme', 35),
  ('Joelle Gordan', 'Jamaique', 11, 'Femme', 33),
  ('Rami Salek', 'Algerie', 8, 'Homme', 22),
  ('Luciana del Pozo', 'Espagne', 3, 'Femme', 18),
  ('Sigfrido Bottone', 'Italie', 9, 'Homme', 31),
  ('Ludwig Haussegger', 'Allemagne', 13, 'Homme', 26),
  ('Ollie Hamilton', 'Canada', 2, 'Homme', 28),
  ('Alyssa Herring', 'Royaume Uni', 9, 'Femme', 21),
  ('Pabla Escobaras', 'Espagne', 7, 'Femme', 22),
  ('Abram Conner', 'Etats Unis', 3, 'Homme', 35),
  ('Mônica Luz', 'Portugal', 11, 'Femme', 28),
  ('Benedita Mendez', 'Portugal', 2, 'Femme', 27),
  ('Timoshenko Yakovich', 'Russie', 4, 'Homme', 33),
  ('Zac Doyle', 'Etats Unis', 4, 'Homme', 34),
  ('Kale Mcclure', 'Canada', 5, 'Homme', 21),
  ('Cyka Annikov', 'Russie', 5, 'Femme', 35),
  ('Joe Moore', 'Etats Unis', 3, 'Homme', 31),
  ('Marie Pluchart', 'France', 8, 'Femme', 22),
  ('Shmelev Stanislavovich', 'Russie', 5, 'Homme', 27),
  ('Shao Feng', 'Chine', 1, 'Femme', 21),
  ('Paolo Castronovo', 'Italie', 7, 'Homme', 26),
  ('Liu Shun', 'Chine', 13, 'Homme', 24),
  ('Jeremy Delaney', 'Etats Unis', 2, 'Homme', 29),
  ('Greta Giardino', 'Italie', 6, 'Femme', 20),
  ('Julia Simmons', 'Etats Unis', 11, 'Femme', 23),
  ('Euduard', 'Italie', 1, 'Homme', 24),
  ('Lilyana West', 'Royaume Uni', 1, 'Femme', 20),
  ('Sunada Tadashi', 'Japon', 1, 'Homme', 35),
  ('Chang Chun', 'Chine', 1, 'Homme', 22),
  ('Andreas Wernz', 'Allemagne', 5, 'Homme', 17),
  ('Dominga Alvas', 'Portugal', 9, 'Femme', 27),
  ('Luis López', 'Espagne', 4, 'Homme', 20),
  ('Loris Calcagni', 'Italie', 3, 'Homme', 31),
  ('Jean-Charles Jacquet', 'France', 9, 'Homme', 24),
  ('Kryukova Semyonovna', 'Russie', 9, 'Femme', 20),
  ('Cheng Da', 'Chine', 4, 'Homme', 29),
  ('Oscar James', 'Royaume Uni', 7, 'Homme', 29),
  ('Lexi Barnes', 'Etats Unis', 2, 'Femme', 27),
  ('Cody Foster', 'Royaume Uni', 2, 'Homme', 18),
  ('Bella Reynolds', 'Etats Unis', 11, 'Femme', 28),
  ('Fujiwara Toyozo', 'Japon', 5, 'Homme', 27),
  ('Nashka Artemievna', 'Russie', 13, 'Femme', 32),
  ('Laila Rahaim', 'Algerie', 3, 'Femme', 21),
  ('Nina Mancebo', 'Espagne', 8, 'Femme', 17),
  ('Matthew Fox', 'Canada', 1, 'Homme', 23),
  ('Madilynn Mullins', 'Etats Unis', 10, 'Femme', 18),
  ('Elda Liberati', 'Italie', 9, 'Femme', 25),
  ('Felicita Da Silva', 'Brésil', 2, 'Femme', 22),
  ('Miguel Patao', 'Portugal', 2, 'Homme', 32),
  ('Scott White', 'Royaume Uni', 3, 'Homme', 34),
  ('Lúcia Dias', 'Brésil', 7, 'Femme', 33),
  ('Aleksei Dima', 'Russie', 3, 'Homme', 35),
  ('Giosuele Scacco', 'Italie', 3, 'Homme', 24),
  ('Spencer Rogers', 'Etats Unis', 4, 'Femme', 22),
  ('Tommy Lane', 'Etats Unis', 6, 'Homme', 17),
  ('Guillaume Bassot', 'France', 3, 'Homme', 31),
  ('Jordan Philippon', 'France', 10, 'Homme', 29),
  ('Caitlin Dawson', 'Royaume Uni', 11, 'Femme', 34),
  ('Ramon Morillo', 'Espagne', 13, 'Homme', 18),
  ('Eleonora Felicetti', 'Italie', 13, 'Femme', 23),
  ('Shiroma Sakamae', 'Japon', 1, 'Femme', 25),
  ('Nagao Yukichi', 'Japon', 3, 'Homme', 29),
  ('Travis Whitaker', 'Etats Unis', 11, 'Homme', 25),
  ('Husni al-Kalil', 'Algerie', 7, 'Homme', 31),
  ('Hong Yo-Han', 'Corée Du Sud', 12, 'Homme', 29),
  ('John Padding', 'Canada', 5, 'Homme', 25),
  ('Long Hu', 'Chine', 13, 'Homme', 35),
  ('Lívia Silvestra', 'Brésil', 8, 'Femme', 33),
  ('Snetkova Vitalievna', 'Espagne', 9, 'Femme', 23),
  ('Gilberto Seixas', 'Portugal', 8, 'Homme', 27),
  ('Adrian Barrios', 'Espagne', 5, 'Homme', 24),
  ('Emily Williams', 'Canada', 4, 'Femme', 20),
  ('Lai Shi', 'Chine', 12, 'Femme', 34),
  ('Mohammed Henni','Algerie',14,'Homme',28),
  ('Emily Ratashowski','Russie',14,'Femme',22),
  ('Sabrina Fieno','Italie',14,'Femme',19),
  ('Brigitte Copt','France',14,'Femme',38),
  ('Marjorie Edisson','Etats Unis',14,'Femme',30),
  ('Nathaniel Lahey','Etats Unis',14,'Homme',32),
  ('Robert Patinson','Royaume Uni',14,'Homme',28),
  ('Christophe Mae','France',14,'Homme',23),
  ('Wolfgang Amadeus','Allemagne',14,'Homme',20),
  ('Mario Mammamia','Italie',14,'Homme',35),
  ('Eikichi Onizuka','Japon',14,'Homme',22),
  ('Chuck Lee','Chine',14,'Homme',25),
  ('Raphael Nadal','Espagne',14,'Homme',27),
  ('Roger Federrer','Royaume Uni',14,'Homme',33),
  ('Serena Williams','Etats Unis',14,'Femme',27),
  ('Jeanne Tennis','France',14,'Femme',22),
  ('Alexandra Leprevault','France',14,'Femme',25),
  ('Amelie Nothomb','France',17,'Femme',23),
  ('Amelia Chelouf','Algerie',17,'Femme',22),
  ('Amir Malik','Algerie',17,'Homme',18),
  ('Bruce Lee','Chine',17,'Homme',20),
  ('XinPeng Xiu','Chine',17,'Femme',23),
  ('Amina Bennai','France',17,'Femme',20),
  ('Sid Ali Zitoun','Belgique',17,'Homme',21),
  ('Zakaria Haddad','Belgique',17,'Homme',21),
  ('Zoe Kravitz','Etats Unis',17,'Femme',20),
  ('Isabelle Maria','Portugal',17,'Femme',18),
  ('Cherine Xanax','Chine',17,'Femme',18),
  ('Emilio Santos','Brésil',17,'Homme',30),
  ('Akira Toheiyama','Japon',17,'Homme',24),
  ('Remi Argentino','Portugal',17,'Homme',23),
  ('Link Topasta','Etats Unis',18,'Homme',17),
  ('Robin Hood','Royaume Uni',18,'Homme',26),
  ('Adrian Velba','France',18,'Homme',17),
  ('Richard Aldana','France',18,'Homme',40),
  ('Catherine Beauregard','France',18,'Femme',22),
  ('Kennedy Connecticut','Etats Unis',18,'Homme',24),
  ('Andre Malraux','Belgique',18,'Homme',28),
  ('Elise Radot','France',18,'Femme',22),
  ('Alexia Proust','Allemagne',18,'Femme',19),
  ('Helena Moricia','Portugal',18,'Femme',30),
  ('Emilia Zendi','Canada',18,'Femme',20),
  ('Lina Doufenchmirt','Allemagne',18,'Femme',25),
  ('Amelia Pond','Australie',18,'Femme',22),
  ('Rachel Adams','Etats Unis',18,'Femme',22),
  ('Mickael Kors','Australie',18,'Homme',24),
  ('Ralph Lauren','France',18,'Homme',25),
  ('Maria Cercos','Bresil',18,'Femme',22),
  ('Pedro Bennicio','Italie',18,'Homme',24);

INSERT INTO Equipe (Pays, IDSport, sexe) VALUES
  ('Etats Unis', 4, 'Homme'),
  ('Etats Unis', 4, 'Femme'),
  ('Etats Unis', 6, 'Homme'),
  ('Etats Unis', 6, 'Femme'),
  ('Etats Unis', 7, 'Homme'),
  ('Etats Unis', 7, 'Femme'),
  ('Etats Unis', 8, 'Homme'),
  ('Etats Unis', 8, 'Femme'),
  ('Etats Unis', 9, 'Homme'),
  ('Etats Unis', 9, 'Femme'),
  ('Etats Unis', 12, 'Homme'),
  ('Etats Unis', 12, 'Femme'),
  ('Etats Unis', 13, 'Homme'),
  ('Etats Unis', 13, 'Femme'),
  ('Etats Unis', 15, 'Homme'),
  ('Etats Unis', 15, 'Femme'),
  ('Etats Unis', 16, 'Homme'),
  ('Etats Unis', 16, 'Femme'),
  ('France', 4, 'Homme'),
  ('France', 4, 'Femme'),
  ('France', 6, 'Homme'),
  ('France', 6, 'Femme'),
  ('France', 7, 'Homme'),
  ('France', 7, 'Femme'),
  ('France', 8, 'Homme'),
  ('France', 8, 'Femme'),
  ('France', 9, 'Homme'),
  ('France', 9, 'Femme'),
  ('France', 12, 'Homme'),
  ('France', 12, 'Femme'),
  ('France', 13, 'Homme'),
  ('France', 13, 'Femme'),
  ('France', 15, 'Homme'),
  ('France', 15, 'Femme'),
  ('France', 16, 'Homme'),
  ('France', 16, 'Femme'),
  ('Espagne', 4, 'Homme'),
  ('Espagne', 4, 'Femme'),
  ('Espagne', 6, 'Homme'),
  ('Espagne', 6, 'Femme'),
  ('Espagne', 7, 'Homme'),
  ('Espagne', 7, 'Femme'),
  ('Espagne', 8, 'Homme'),
  ('Espagne', 8, 'Femme'),
  ('Espagne', 9, 'Homme'),
  ('Espagne', 9, 'Femme'),
  ('Espagne', 12, 'Homme'),
  ('Espagne', 12, 'Femme'),
  ('Espagne', 13, 'Homme'),
  ('Espagne', 13, 'Femme'),
  ('Espagne', 15, 'Homme'),
  ('Espagne', 15, 'Femme'),
  ('Espagne', 16, 'Homme'),
  ('Espagne', 16, 'Femme'),
  ('Portugal', 4, 'Homme'),
  ('Portugal', 4, 'Femme'),
  ('Portugal', 6, 'Homme'),
  ('Portugal', 6, 'Femme'),
  ('Portugal', 7, 'Homme'),
  ('Portugal', 7, 'Femme'),
  ('Portugal', 8, 'Homme'),
  ('Portugal', 8, 'Femme'),
  ('Portugal', 9, 'Homme'),
  ('Portugal', 9, 'Femme'),
  ('Portugal', 12, 'Homme'),
  ('Portugal', 12, 'Femme'),
  ('Portugal', 13, 'Homme'),
  ('Portugal', 13, 'Femme'),
  ('Portugal', 15, 'Homme'),
  ('Portugal', 15, 'Femme'),
  ('Portugal', 16, 'Homme'),
  ('Portugal', 16, 'Femme'),
  ('Brésil', 4, 'Homme'),
  ('Brésil', 4, 'Femme'),
  ('Brésil', 6, 'Homme'),
  ('Brésil', 6, 'Femme'),
  ('Brésil', 7, 'Homme'),
  ('Brésil', 7, 'Femme'),
  ('Brésil', 8, 'Homme'),
  ('Brésil', 8, 'Femme'),
  ('Brésil', 9, 'Homme'),
  ('Brésil', 9, 'Femme'),
  ('Brésil', 12, 'Homme'),
  ('Brésil', 12, 'Femme'),
  ('Brésil', 13, 'Homme'),
  ('Brésil', 13, 'Femme'),
  ('Brésil', 15, 'Homme'),
  ('Brésil', 15, 'Femme'),
  ('Brésil', 16, 'Homme'),
  ('Brésil', 16, 'Femme'),
  ('Chine', 4, 'Homme'),
  ('Chine', 4, 'Femme'),
  ('Chine', 6, 'Homme'),
  ('Chine', 6, 'Femme'),
  ('Chine', 7, 'Homme'),
  ('Chine', 7, 'Femme'),
  ('Chine', 8, 'Homme'),
  ('Chine', 8, 'Femme'),
  ('Chine', 9, 'Homme'),
  ('Chine', 9, 'Femme'),
  ('Chine', 12, 'Homme'),
  ('Chine', 12, 'Femme'),
  ('Chine', 13, 'Homme'),
  ('Chine', 13, 'Femme'),
  ('Chine', 15, 'Homme'),
  ('Chine', 15, 'Femme'),
  ('Chine', 16, 'Homme'),
  ('Chine', 16, 'Femme'),
  ('Allemagne', 4, 'Homme'),
  ('Allemagne', 4, 'Femme'),
  ('Allemagne', 6, 'Homme'),
  ('Allemagne', 6, 'Femme'),
  ('Allemagne', 7, 'Homme'),
  ('Allemagne', 7, 'Femme'),
  ('Allemagne', 8, 'Homme'),
  ('Allemagne', 8, 'Femme'),
  ('Allemagne', 9, 'Homme'),
  ('Allemagne', 9, 'Femme'),
  ('Allemagne', 12, 'Homme'),
  ('Allemagne', 12, 'Femme'),
  ('Allemagne', 13, 'Homme'),
  ('Allemagne', 13, 'Femme'),
  ('Allemagne', 15, 'Homme'),
  ('Allemagne', 15, 'Femme'),
  ('Allemagne', 16, 'Homme'),
  ('Allemagne', 16, 'Femme'),
  ('Japon', 4, 'Homme'),
  ('Japon', 4, 'Femme'),
  ('Japon', 6, 'Homme'),
  ('Japon', 6, 'Femme'),
  ('Japon', 7, 'Homme'),
  ('Japon', 7, 'Femme'),
  ('Japon', 8, 'Homme'),
  ('Japon', 8, 'Femme'),
  ('Japon', 9, 'Homme'),
  ('Japon', 9, 'Femme'),
  ('Japon', 12, 'Homme'),
  ('Japon', 12, 'Femme'),
  ('Japon', 13, 'Homme'),
  ('Japon', 13, 'Femme'),
  ('Japon', 15, 'Homme'),
  ('Japon', 15, 'Femme'),
  ('Japon', 16, 'Homme'),
  ('Japon', 16, 'Femme'),
  ('Russie', 4, 'Homme'),
  ('Russie', 4, 'Femme'),
  ('Russie', 6, 'Homme'),
  ('Russie', 6, 'Femme'),
  ('Russie', 7, 'Homme'),
  ('Russie', 7, 'Femme'),
  ('Russie', 8, 'Homme'),
  ('Russie', 8, 'Femme'),
  ('Russie', 9, 'Homme'),
  ('Russie', 9, 'Femme'),
  ('Russie', 12, 'Homme'),
  ('Russie', 12, 'Femme'),
  ('Russie', 13, 'Homme'),
  ('Russie', 13, 'Femme'),
  ('Russie', 15, 'Homme'),
  ('Russie', 15, 'Femme'),
  ('Russie', 16, 'Homme'),
  ('Russie', 16, 'Femme'),
  ('Italie', 4, 'Homme'),
  ('Italie', 4, 'Femme'),
  ('Italie', 6, 'Homme'),
  ('Italie', 6, 'Femme'),
  ('Italie', 7, 'Homme'),
  ('Italie', 7, 'Femme'),
  ('Italie', 8, 'Homme'),
  ('Italie', 8, 'Femme'),
  ('Italie', 9, 'Homme'),
  ('Italie', 9, 'Femme'),
  ('Italie', 12, 'Homme'),
  ('Italie', 12, 'Femme'),
  ('Italie', 13, 'Homme'),
  ('Italie', 13, 'Femme'),
  ('Italie', 15, 'Homme'),
  ('Italie', 15, 'Femme'),
  ('Italie', 16, 'Homme'),
  ('Italie', 16, 'Femme'),
  ('Royaume Uni', 4, 'Homme'),
  ('Royaume Uni', 4, 'Femme'),
  ('Royaume Uni', 6, 'Homme'),
  ('Royaume Uni', 6, 'Femme'),
  ('Royaume Uni', 7, 'Homme'),
  ('Royaume Uni', 7, 'Femme'),
  ('Royaume Uni', 8, 'Homme'),
  ('Royaume Uni', 8, 'Femme'),
  ('Royaume Uni', 9, 'Homme'),
  ('Royaume Uni', 9, 'Femme'),
  ('Royaume Uni', 12, 'Homme'),
  ('Royaume Uni', 12, 'Femme'),
  ('Royaume Uni', 13, 'Homme'),
  ('Royaume Uni', 13, 'Femme'),
  ('Royaume Uni', 15, 'Homme'),
  ('Royaume Uni', 15, 'Femme'),
  ('Royaume Uni', 16, 'Homme'),
  ('Royaume Uni', 16, 'Femme'),
  ('Algerie', 4, 'Homme'),
  ('Algerie', 4, 'Femme'),
  ('Algerie', 6, 'Homme'),
  ('Algerie', 6, 'Femme'),
  ('Algerie', 7, 'Homme'),
  ('Algerie', 7, 'Femme'),
  ('Algerie', 8, 'Homme'),
  ('Algerie', 8, 'Femme'),
  ('Algerie', 9, 'Homme'),
  ('Algerie', 9, 'Femme'),
  ('Algerie', 12, 'Homme'),
  ('Algerie', 12, 'Femme'),
  ('Algerie', 13, 'Homme'),
  ('Algerie', 13, 'Femme'),
  ('Algerie', 15, 'Homme'),
  ('Algerie', 15, 'Femme'),
  ('Algerie', 16, 'Homme'),
  ('Algerie', 16, 'Femme'),
  ('Jamaique', 4, 'Homme'),
  ('Jamaique', 4, 'Femme'),
  ('Jamaique', 6, 'Homme'),
  ('Jamaique', 6, 'Femme'),
  ('Jamaique', 7, 'Homme'),
  ('Jamaique', 7, 'Femme'),
  ('Jamaique', 8, 'Homme'),
  ('Jamaique', 8, 'Femme'),
  ('Jamaique', 9, 'Homme'),
  ('Jamaique', 9, 'Femme'),
  ('Jamaique', 12, 'Homme'),
  ('Jamaique', 12, 'Femme'),
  ('Jamaique', 13, 'Homme'),
  ('Jamaique', 13, 'Femme'),
  ('Jamaique', 15, 'Homme'),
  ('Jamaique', 15, 'Femme'),
  ('Jamaique', 16, 'Homme'),
  ('Jamaique', 16, 'Femme'),
  ('Canada', 4, 'Homme'),
  ('Canada', 4, 'Femme'),
  ('Canada', 6, 'Homme'),
  ('Canada', 6, 'Femme'),
  ('Canada', 7, 'Homme'),
  ('Canada', 7, 'Femme'),
  ('Canada', 8, 'Homme'),
  ('Canada', 8, 'Femme'),
  ('Canada', 9, 'Homme'),
  ('Canada', 9, 'Femme'),
  ('Canada', 12, 'Homme'),
  ('Canada', 12, 'Femme'),
  ('Canada', 13, 'Homme'),
  ('Canada', 13, 'Femme'),
  ('Canada', 15, 'Homme'),
  ('Canada', 15, 'Femme'),
  ('Canada', 16, 'Homme'),
  ('Canada', 16, 'Femme'),
  ('Corée Du Sud', 4, 'Homme'),
  ('Corée Du Sud', 4, 'Femme'),
  ('Corée Du Sud', 6, 'Homme'),
  ('Corée Du Sud', 6, 'Femme'),
  ('Corée Du Sud', 7, 'Homme'),
  ('Corée Du Sud', 7, 'Femme'),
  ('Corée Du Sud', 8, 'Homme'),
  ('Corée Du Sud', 8, 'Femme'),
  ('Corée Du Sud', 9, 'Homme'),
  ('Corée Du Sud', 9, 'Femme'),
  ('Corée Du Sud', 12, 'Homme'),
  ('Corée Du Sud', 12, 'Femme'),
  ('Corée Du Sud', 13, 'Homme'),
  ('Corée Du Sud', 13, 'Femme'),
  ('Corée Du Sud', 15, 'Homme'),
  ('Corée Du Sud', 15, 'Femme'),
  ('Corée Du Sud', 16, 'Homme'),
  ('Corée Du Sud', 16, 'Femme'),
  ('Corée Du Sud',19,'Femme'),
  ('Corée Du Sud',19,'Homme'),
  ('Canada',19,'Femme'),
  ('Canada',19,'Homme'),
  ('Allemagne',19,'Femme'),
  ('Allemagne',19,'Homme'),
  ('Chine',19,'Femme'),
  ('Chine',19,'Homme'),
  ('Japon',19,'Femme'),
  ('Japon',19,'Homme'),
  ('Russie',19,'Femme'),
  ('Russie',19,'Homme'),
  ('Italie',19,'Femme'),
  ('Italie',19,'Homme'),
  ('Algerie',19,'Femme'),
  ('Algerie',19,'Homme'),
  ('Canada',19,'Femme'),
  ('Canada',19,'Femme'),
  ('Jamaique',19,'Femme'),
  ('Jamaique',19,'Homme'),
  ('Royaume Uni',19,'Femme'),
 ('Royaume Uni',19,'Homme'),
 ('Portugal', 19, 'Femme'),
 ('Portugal', 19, 'Homme'),
 ('Brésil', 19, 'Femme'),
 ('Brésil', 19, 'Homme'),
 ('France',19,'Femme'),
 ('France',19,'Homme'),
 ('Espagne', 19, 'Femme'),
 ('Espagne', 19, 'Homme'),
 ('Etats Unis',19,'Femme'),
 ('Etats Unis',19,'Homme');

INSERT INTO EpreuveCollective (IDSport,nomEpreuve,sexe,IDEquipeGagnanteOr,IDEquipeGagnanteArgent,IDEquipeGagnanteBronze) VALUES
    (4,'relais 4*400','femme',2,20,38),
    (4,'relais 4*400','homme',19,37,73),
    (6,'Deux de couple','femme',256,238,165),
    (6,'Quatre de couple','femme',184,130,111),
    (6,'Huit','femme', 256,130,76),
    (6,'Deux avec barreur','femme',238,4,22),
    (6,'Deux de couple','homme',3,93,111),
    (6,'Quatre de couple','homme',93,183,237),
    (6,'Huit','homme',183,129,3),
    (6,'Deux avec barreur','homme',165,147,111),
    (7,'Double','femme',186,168,96),
    (7,'Double','homme',95,113,149),
    (8,'Tournois','femme',116,134,152),
    (8,'Tournois','homme',151,169,115),
    (9,'Tournois','femme',46,10,28),
    (9,'Tournois','homme',81,99,117),
    (15,'Fleuret par équipe','femme',16,88,124),
    (15,'Fleuret par équipe','homme',123,15,87),
    (15,'Epee par équipe','femme',15,160,195),
    (15,'Epee par equipe','homme',213,267,87),
    (15,'sabre par equipe','femme',160,88,124),
    (15,'sabre par equipe','homme',213,15,87),
    (13,'double','femme',86,68,32),
    (13,'double','homme',85,31,13),
    (16,'double','femme',18,54,72),
    (16,'double','homme',17,53,107),
    (19,'Tournois','femme',271,287,291),
    (19,'Tournois','homme',296,261,286);

INSERT INTO EpreuveIndividuel(IDSport,nomEpreuve,Sexe,IDGagnantOr,IDGagnantArgent,IDGagnantBronze) VALUES
    (1,'50 mètres nage libre','femme',7,21,56),
    (1,'100 mètres nage libre','femme',112,7,149),
    (1,'200 metres nage libre','femme',156,7,21),
    (1,'100 metres papillon','femme',56,149,7),
    (1,'100 metre papillon','homme',203,157,98),
    (1,'50 metres nage libre','homme',203,52,44),
    (1,'100 metres nage libre','homme',52,203,83),
    (1,'200 metres nage libre','homme',203,157,44),
    (2,'Complet','mixte',72,100,115),
    (2,'Saut d\'obstacle','mixte',152,167,136),
    (2,'Dressage','mixte',100,93,72),
    (5,'Poutre','femme',61,31,50),
    (5,'Sol','femme',102,121,114),
    (5,'Barres asymétriques','femme',61,3,347),
    (5,'Saut de cheval','femme',252,323,304),
    (5,'Poutre','homme',1,6,34),
    (5,'Sol','homme',1,90,123),
    (5,'Saut de cheval','homme',123,144,208),
    (5,'Barres asymétriques','homme',402,325,372),
    (10,'Tournois poids lourd','femme',8,13,64),
    (10,'Tournois poids lourd','homme',42,62,63),
    (10,'Tournois poids leger','femme',377,266,215),
    (10,'Tournois poids leger','homme',244,265,388),
    (11,'Fleuret','femme',4,60,131),
    (11,'Epee','femme',154,140,187),
    (11,'Sabre','femme',333,342,356),
    (11,'Fleuret','homme',67,73,97),
    (11,'Epee','homme',192,269,275),
    (11,'Sabre','homme',299,394,67),
    (14,'Tournois','femme',204,205,218),
    (14,'Tournois','homme',203,208,209),
    (17,'Tournois','femme',439,440,449),
    (17,'Tournois','homme',441,452,445),
    (18,'Tournois','femme',457,460,465),
    (18,'Tournois','Homme',453,458,470);
