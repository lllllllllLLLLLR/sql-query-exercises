-- Drop tables if they already exist
DROP TABLE IF EXISTS Occurs, Participation, Workshop, Activity, Person CASCADE;

-- Person table
CREATE TABLE Person (
   SSN INTEGER PRIMARY KEY,
   Name VARCHAR(30),
   Age INTEGER NOT NULL
);

-- Activity table
CREATE TABLE Activity (
   ActivityID INTEGER PRIMARY KEY,
   Name VARCHAR(30)
);

-- Workshop table
CREATE TABLE Workshop (
   WorkshopID INTEGER PRIMARY KEY,
   Level INTEGER,
   MaxParticipants INTEGER,
   MinParticipants INTEGER,
   InstructorSSN INTEGER NOT NULL,
   ActivityID INTEGER NOT NULL
);

-- Participation table (person attends a workshop)
CREATE TABLE Participation (
   SSN INTEGER REFERENCES Person,
   WorkshopID INTEGER REFERENCES Workshop
);

-- Occurs table (when/where a workshop takes place)
CREATE TABLE Occurs (
   WorkshopID INTEGER REFERENCES Workshop,
   Day INTEGER,
   Slot CHAR(1),
   Room VARCHAR(30)
);


-- Populate Person
INSERT INTO Person VALUES (20, 'Jean', 50);
INSERT INTO Person VALUES (21, 'Lea', 30);
INSERT INTO Person VALUES (22, 'Florent', 30);
INSERT INTO Person VALUES (23, 'Adeline', 17);
INSERT INTO Person VALUES (24, 'Marc', 17);
INSERT INTO Person VALUES (25, 'Fred', 17);
INSERT INTO Person VALUES (26, 'Paul', 50);

-- Populate Activity
INSERT INTO Activity VALUES (101, 'circus');
INSERT INTO Activity VALUES (102, 'violin');
INSERT INTO Activity VALUES (103, 'yoga');
INSERT INTO Activity VALUES (104, 'juggling');
INSERT INTO Activity VALUES (105, 'basket weaving');

-- Populate Workshop (WorkshopID, Level, MaxParticipants, MinParticipants, InstructorSSN, ActivityID)
INSERT INTO Workshop VALUES (201, 1, 10, 2, 24, 101);
INSERT INTO Workshop VALUES (211, 2, 10, 2, 26, 101);
INSERT INTO Workshop VALUES (221, 3, 10, 2, 26, 101);
INSERT INTO Workshop VALUES (204, 1, 10, 2, 22, 104);
INSERT INTO Workshop VALUES (254, 5, 10, 2, 22, 104);
INSERT INTO Workshop VALUES (202, 1, 10, 2, 26, 102);
INSERT INTO Workshop VALUES (203, 1, 10, 2, 26, 103);

-- Populate Participation (SSN, WorkshopID)
INSERT INTO Participation VALUES (20, 211);
INSERT INTO Participation VALUES (20, 221);
INSERT INTO Participation VALUES (20, 202);
INSERT INTO Participation VALUES (20, 203);
INSERT INTO Participation VALUES (20, 204);
INSERT INTO Participation VALUES (25, 203);
INSERT INTO Participation VALUES (22, 254);
INSERT INTO Participation VALUES (22, 201);
INSERT INTO Participation VALUES (22, 211);
INSERT INTO Participation VALUES (23, 202);
INSERT INTO Participation VALUES (24, 201);
INSERT INTO Participation VALUES (24, 211);
INSERT INTO Participation VALUES (24, 221);
INSERT INTO Participation VALUES (24, 202);
INSERT INTO Participation VALUES (24, 203);
INSERT INTO Participation VALUES (24, 204);
INSERT INTO Participation VALUES (24, 254);

-- Populate Occurs (WorkshopID, Day, Slot, Room)
INSERT INTO Occurs VALUES (201, 1, 'A', 'Verlaine');
INSERT INTO Occurs VALUES (201, 3, 'B', 'Jean P');
INSERT INTO Occurs VALUES (201, 4, 'B', 'Rimbaud');
INSERT INTO Occurs VALUES (211, 2, 'B', 'Jean P');
INSERT INTO Occurs VALUES (204, 2, 'A', 'Lili Z');
INSERT INTO Occurs VALUES (204, 3, 'A', 'Verlaine');
INSERT INTO Occurs VALUES (204, 4, 'A', 'Jean P');
INSERT INTO Occurs VALUES (254, 2, 'A', 'Keaton');
INSERT INTO Occurs VALUES (202, 2, 'A', 'Lili Z');
INSERT INTO Occurs VALUES (202, 3, 'A', 'Verlaine');
INSERT INTO Occurs VALUES (203, 4, 'A', 'Verlaine');
INSERT INTO Occurs VALUES (221, 3, 'A', 'Jean P');
INSERT INTO Occurs VALUES (254, 1, 'A', 'Jean P');
INSERT INTO Occurs VALUES (202, 4, 'B', 'Jean P');
INSERT INTO Occurs VALUES (203, 5, 'B', 'Jean P');
