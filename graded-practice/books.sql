-- Drop tables if they already exist
DROP TABLE IF EXISTS Contribution, role1, Contributor, Publisher, Book CASCADE;

-- Create tables
CREATE TABLE Contributor (
    contributor_id INTEGER PRIMARY KEY, 
    first_name1 VARCHAR(30), 
    last_name1 VARCHAR(30)
);

CREATE TABLE Publisher (
    publisher_id INTEGER PRIMARY KEY, 
    name1 VARCHAR(50) NOT NULL
);

CREATE TABLE Book (
    book_id INTEGER PRIMARY KEY, 
    title VARCHAR(90) NOT NULL, 
    year INTEGER NOT NULL, 
    pages INTEGER NOT NULL, 
    rank INTEGER NOT NULL, 
    publisher_id INTEGER REFERENCES Publisher
);

CREATE TABLE role1 (
    book_id INTEGER REFERENCES Book, 
    contributor_id INTEGER REFERENCES Contributor, 
    name1 VARCHAR(70)
);

CREATE TABLE Contribution (
    book_id INTEGER REFERENCES Book, 
    contributor_id INTEGER REFERENCES Contributor,  
    CONSTRAINT contribution_unique UNIQUE(book_id, contributor_id)
);


-- Insertion des éditeurs
INSERT INTO Publisher VALUES 
(1, 'Gallimard'),
(2, 'Flammarion'),
(3, 'Hachette'),
(4, 'Le Livre de Poche'),
(5, 'Albin Michel'),
(6, 'Folio'),
(7, 'Bragelonne'),
(8, 'Denoël'),
(9, 'Actes Sud'),
(10, 'J ai Lu');

-- Insertion des livres avec éditeurs
INSERT INTO Book VALUES 
(2001, 'Les Misérables', 1862, 1463, 1, 1),
(2002, 'Le Comte de Monte-Cristo', 1844, 1312, 2, 2),
(2003, 'Madame Bovary', 1857, 432, 3, 1),
(2004, 'L’Étranger', 1942, 123, 4, 6),
(2005, 'Le Petit Prince', 1943, 96, 5, 3),
(2006, 'Germinal', 1885, 592, 6, 5),
(2007, 'Notre-Dame de Paris', 1831, 940, 7, 1),
(2008, 'Voyage au centre de la Terre', 1864, 320, 8, 4),
(2009, 'Vingt mille lieues sous les mers', 1870, 416, 9, 4),
(2010, 'La Peste', 1947, 352, 10, 1),
(2011, 'La Horde du Contrevent', 2004, 544, 11, 7),
(2012, 'L Homme qui mit fin à l histoire', 2010, 128, 12, 9),
(2013, 'Les Furtifs', 2019, 687, 13, 7),
(2014, 'Dune', 1965, 704, 14, 8),
(2015, 'Neuromancien', 1984, 384, 15, 10),
(2016, 'Hyperion', 1989, 482, 16, 10),
(2017, 'Fondation', 1951, 255, 17, 10),
(2018, 'La Nuit des Temps', 1968, 448, 18, 5),
(2019, 'Ubik', 1969, 320, 19, 10),
(2020, 'Snow Crash', 1992, 480, 20, 10);

INSERT INTO Contributor VALUES 
(1, 'Victor', 'Hugo'),
(2, 'Alexandre', 'Dumas'),
(3, 'Gustave', 'Flaubert'),
(4, 'Albert', 'Camus'),
(5, 'Antoine', 'de Saint-Exupéry'),
(6, 'Émile', 'Zola'),
(7, 'Jules', 'Verne'),
(8, 'Jean', 'Brunhes'), -- Translator
(9, 'Alphonse', 'de Neuville'), -- Illustrator
(10, 'Édouard', 'Riou'), -- Illustrator
(11, 'Alain', 'Damasio'),
(12, 'Ken', 'Liu'),
(13, 'Frank', 'Herbert'),
(14, 'William', 'Gibson'),
(15, 'Dan', 'Simmons'),
(16, 'Isaac', 'Asimov'),
(17, 'René', 'Barjavel'),
(18, 'Philip K.', 'Dick'),
(19, 'Neal', 'Stephenson');

INSERT INTO role1 VALUES 
(2001, 1, 'Author'),
(2002, 2, 'Author'),
(2003, 3, 'Author'),
(2004, 4, 'Author'),
(2005, 5, 'Author'),
(2006, 6, 'Author'),
(2007, 1, 'Author'),
(2008, 7, 'Author'),
(2009, 7, 'Author'),
(2010, 4, 'Author'),
(2008, 8, 'Translator'),
(2009, 9, 'Illustrator'),
(2009, 10, 'Illustrator'),
(2011, 11, 'Author'),
(2012, 12, 'Author'),
(2013, 11, 'Author'),
(2014, 13, 'Author'),
(2015, 14, 'Author'),
(2016, 15, 'Author'),
(2017, 16, 'Author'),
(2018, 17, 'Author'),
(2019, 18, 'Author'),
(2020, 19, 'Author');

INSERT INTO Contribution VALUES 
(2001, 1),
(2002, 2),
(2003, 3),
(2004, 4),
(2005, 5),
(2006, 6),
(2007, 1),
(2008, 7),
(2009, 7),
(2010, 4),
(2008, 8),
(2009, 9),
(2009, 10),
(2011, 11),
(2012, 12),
(2013, 11),
(2014, 13),
(2015, 14),
(2016, 15),
(2017, 16),
(2018, 17),
(2019, 18),
(2020, 19);
