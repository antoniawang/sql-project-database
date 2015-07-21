PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Students (
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    github VARCHAR(30) PRIMARY KEY
    );
INSERT INTO "Students" VALUES('Jane','Hacker','jhacks');
INSERT INTO "Students" VALUES('Sarah','Developer','sdevelops');
CREATE TABLE Projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(30),
    description TEXT,
    max_grade INTEGER);
INSERT INTO "Projects" VALUES(1,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(2,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(3,'Guessing Game','Guessing a number the computer generates',25);
INSERT INTO "Projects" VALUES(4,'Ubermelon Page','Creating an Ubermelon order page',40);
INSERT INTO "Projects" VALUES(5,'Madlibs','Creating a Madlibs game in Flask',50);
CREATE TABLE Grades(
student_github VARCHAR(30),
project_title VARCHAR(30),
grade INTEGER);
INSERT INTO "Grades" VALUES('jhacks','Markov',10);
INSERT INTO "Grades" VALUES('jhacks','Blockly',2);
INSERT INTO "Grades" VALUES('sdevelops','Markov',50);
INSERT INTO "Grades" VALUES('sdevelops','Blockly',100);
INSERT INTO "Grades" VALUES('sdevelops','Guessing Game',20);
INSERT INTO "Grades" VALUES('jhacks','Guessing Game',15);
INSERT INTO "Grades" VALUES('jhacks','Ubermelon Page',40);
INSERT INTO "Grades" VALUES('sdevelops','Ubermelon Page',30);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('Projects',5);
CREATE VIEW ReportCardView AS
SELECT Students.first_name,
       Students.last_name,
       Projects.title,
       Projects.max_grade,
       Grades.grade
FROM Students
  JOIN Grades ON (Students.github = Grades.student_github)
  JOIN Projects ON (Projects.title = Grades.project_title);
COMMIT;
