DROP TABLE IF EXISTS Musicians CASCADE; 
DROP TABLE IF EXISTS Place CASCADE;
DROP TABLE IF EXISTS Lives CASCADE;
DROP TABLE IF EXISTS Instrument CASCADE;
DROP TABLE IF EXISTS Plays CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Songs CASCADE;
DROP TABLE IF EXISTS Perform CASCADE;


CREATE TABLE Musicians	(name CHAR(40) NOT NULL,
                        ssn CHAR(11) NOT NULL,
                        PRIMARY KEY (ssn));

CREATE TABLE Place 	(phone_no char(11),
			home CHAR(20) NOT NULL, 
			address CHAR(40) NOT NULL,
			PRIMARY KEY(address)
			FOREIGN KEY(home) REFERENCES Telephone(phone_no));   

CREATE TABLE Lives 	(address CHAR(40) NOT NULL, 
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY(address, ssn), 
			FOREIGN KEY(address) REFERENCES Place(address), 
			FOREIGN KEY(ssn) REFERENCES Musicians(ssn)); 

CREATE TABLE Instrument (instrid CHAR(11) NOT NULL, 
			key CHAR(11), 
			dname CHAR(40), 
			PRIMARY KEY(instrid)); 

CREATE TABLE Plays 	(ssn CHAR(11) NOT NULL, 
			instrid CHAR(11) NOT NULL, 
			PRIMARY KEY (ssn, instrid), 
			FOREIGN KEY (ssn) REFERENCES Musicians(ssn), 
			FOREIGN KEY (instrId) REFERENCES Instrument(instrid));  

CREATE TABLE Album 	(albumidentifier CHAR(11), 
			speed INTEGER, 
			copyrightDate CHAR(11), 
			title CHAR(40), 
			ssn CHAR(11) NOT NULL,
			PRIMARY KEY (albumidentifier), 
			FOREIGN KEY(ssn) REFERENCES Musicians(ssn)); 

CREATE TABLE Songs 	(songid CHAR(11), 
			title CHAR(40), 
			author CHAR(40),  
			appears CHAR(20) NOT NULL,
			PRIMARY KEY (songid), 
			FOREIGN KEY (appears) REFERENCES Album(albumidentifier)); 

CREATE TABLE Perform 	(ssn CHAR(11) NOT NULL, 
			songid CHAR(11) NOT NULL, 
			PRIMARY KEY (ssn, songid), 
			FOREIGN KEY (ssn) REFERENCES Musicians(ssn), 
			FOREIGN KEY (songid) REFERENCES Songs (songid)); 
