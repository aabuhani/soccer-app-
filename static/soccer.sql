DROP DATABASE IF EXISTS soccer;
CREATE DATABASE soccer;

USE soccer;

DROP TABLE IF EXISTS Team;

CREATE TABLE Team(
    id SMALLINT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(35),
	color VARCHAR(35),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS Coach;

CREATE TABLE Coach (
  id SMALLINT UNSIGNED AUTO_INCREMENT,
  firstname varchar(35) DEFAULT NULL,
  lastname varchar(35) DEFAULT NULL,
  email varchar(100) NOT NULL UNIQUE,
  teamid SMALLINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_teamid FOREIGN KEY (teamid) REFERENCES Team (id)
  ON UPDATE CASCADE
  ON DELETE SET NULL
) ;

CREATE INDEX coach_lastname_ix ON Coach(lastName);

DROP TABLE IF EXISTS Player;

CREATE TABLE Player (
  id SMALLINT UNSIGNED AUTO_INCREMENT,
  firstname varchar(35) DEFAULT NULL,
  lastname varchar(35) DEFAULT NULL,
  birthdate date DEFAULT NULL,
  rating char(1) DEFAULT NULL,
  teamid SMALLINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_player_teamid FOREIGN KEY (teamid) REFERENCES Team(id)
) ;

CREATE INDEX player_lastname_ix ON Player(lastName);

INSERT INTO Team(name, color) VALUES('Rockets',	'Red/White');
INSERT INTO Team(name, color) VALUES('Comets',	'Blue/White');
INSERT INTO Team(name, color) VALUES('Bulldogs',	'Red/Black');
INSERT INTO Team(name, color) VALUES('Tar Heels',	'Orange/Green');
INSERT INTO Team(name, color) VALUES('Tornadoes',	'Blue/Gold');
INSERT INTO Team(name, color) VALUES('Eagles',	'Orange/Blue');
INSERT INTO Team(name, color) VALUES('Blue Devils',	'Maroon/Gold');

INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Steve', 'Zion', 'zion@yahoo.com',	1);
INSERT INTO Coach(firstname, lastname, email) VALUES ('Michael', 'Moldof', 'mm@gmail.com');
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Neil', 'Goodman', 'ngood@comcast.net',	1);
INSERT INTO Coach(firstname, lastname, email) VALUES ('David', 'Stone',	'stoner@yahoo.com');
INSERT INTO Coach(firstname, lastname, email) VALUES ('Frank', 'Barber',	'barber@yahoo.com');
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Curtis', 'Kimble', 'ckimble@gmail.com', 7);
INSERT INTO Coach(firstname, lastname, email) VALUES ('Caren', 'Zarinsky','carenZ@gmail.com');
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Derek', 'Anderson', 'andyson@mymail.net',	3);
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Karen', 'Kinzer',	'kk123@me.com',	6);
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Alex', 'Fraser',	'fraze@mail.com',	4);
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Lorenzo', 'Pearson',	'pearson@gmail.com', 3);
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Shira', 'Citron',	'citron@gmail.com',	6);
INSERT INTO Coach(firstname, lastname, email, teamid) VALUES ('Bob', 'Instructor',	'bobbyboy@mail.com', 2);

INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Julie', 'Zion', '2000-08-08', 'B', 1);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Britta', 'Zarinsky', '2001-09-09', 'B', 7);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Jenna', 'Koester', '2001-12-26', 'B', 5);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Melissa', 'Kimble', '2000-05-31', 'C', 7);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Jessica', 'Anderson', '2001-03-16', 'A', 3);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Leslie', 'Ericson', '2000-12-21', 'B', 3);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Jessica', 'Goodman', '2000-03-16', 'A', 1);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Marci', 'Barber', '2001-05-15', 'A', 4);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Nancy', 'Dorman', '2001-12-12', 'A', 2);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Julie', 'Fraser', '2000-04-04', 'C', 4);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Kelly', 'James', '2002-07-01', 'A', 3);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Sherrie', 'Green', '2000-08-22', 'A', 4);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Priscilla', 'Pearson', '2002-02-03', 'B', 3);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Kerri', 'Stone', '2000-04-04', 'C', 5);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Toni', 'Moldof', '2002-11-11', 'B', 5);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Shelly', 'Parker', '2001-11-14', 'C', 2);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Amy', 'Kinzer', '2001-05-05', 'C', 6);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Mary', 'Citron', '2000-03-16', 'A', 6);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Jessica', 'Grauer', '2000-03-16', 'A', 1);
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Sonja', 'Freed', '2001-07-01', 'B', 6);
INSERT INTO Player(firstname, lastname, birthdate, rating) Values('Lori', 'Pryor', '2001-06-18', 'C');
INSERT INTO Player(firstname, lastname, birthdate, rating) Values('Lauren', 'Howard', '2000-11-01', 'A');
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Katie', 'Remmen', '2002-04-18', 'A', 1);
INSERT INTO Player(firstname, lastname, birthdate, rating) Values('Katherine', 'Akong', '2000-02-02', 'C' );
INSERT INTO Player(firstname, lastname, birthdate, rating) Values('Lilly', 'Taboas', '2001-05-21', 'B');
INSERT INTO Player(firstname, lastname, birthdate, rating, teamid) Values('Jessica', 'Benjamin', '2001-10-31', 'A', 2);
