DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Depatment CASCADE;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS work_proj;
DROP TABLE IF EXISTS advise;


CREATE TABLE Professor 	(ssn CHAR(11) NOT NULL, 
			name CHAR(40) NOT NULL, 
			age INTEGER NOT NULL, 
			rank INTEGER NOT NULL, 
			specialty CHAR(40) NOT NULL, 
			PRIMARY KEY(ssn));  

CREATE TABLE Depatment 	(dno INTEGER, 
		    	dname CHAR(40), 
		    	office CHAR(40), 
		    	runs CHAR(11) NOT NULL, 
		    	PRIMARY KEY(dno), 
		    	FOREIGN KEY(runs) REFERENCES Professor(ssn)
	            	); 

CREATE TABLE work_dept 	(time_pc CHAR(20) NOT NULL, 
			ssn CHAR(11) NOT NULL, 
			dno INTEGER NOT NULL, 
			PRIMARY KEY(ssn, dno), 
		 	FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			FOREIGN KEY(dno) REFERENCES Dept(dno));  
 

CREATE TABLE Project 	(pno INTEGER, 
		        sponsor CHAR(40), 
			start_date CHAR(11), 
			end_date CHAR(11), 
			budget INTEGER,
			ssn CHAR(11) NOT NULL, 
			PRIMARY KEY(pno), 
			FOREIGN KEY(ssn) REFERENCES Professor(ssn)); 

CREATE TABLE work_in	(ssn CHAR(11) NOT NULL, 
			pno INTEGER NOT NULL, 
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn), 
			FOREIGN KEY(pno) REFERENCES Project(pno)); 
  		

CREATE TABLE Graduate   (SSN CHAR(11) NOT NULL,
                        name CHAR(40),
                        dno INTEGER NOT NULL,
                        age INTEGER,
                        deg_pg CHAR(20),
                        PRIMARY KEY(SSN),
                        FOREIGN KEY (dno) REFERENCES Dept(dno),
                        FOREIGN KEY (ssn) REFERENCES Professor(ssn)
                        );

CREATE TABLE work_proj 	(pno INTEGER NOT NULL, 
		 	SSN CHAR(11) NOT NULL, 
			PRIMARY KEY(pno, SSN), 
			FOREIGN KEY(pno) REFERENCES Project(pno), 
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN));

CREATE TABLE advise 	(SSN CHAR(11) NOT NULL, 
			PRIMARY KEY(SSN),
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN));
