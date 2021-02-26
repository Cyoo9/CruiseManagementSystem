DROP TABLE IF EXISTS Schedule CASCADE;
DROP TABLE IF EXISTS Cruise CASCADE;
/* DROP TABLE has CASCADE; */
/* DROP TABLE works CASCADE; */
/* DROP TABLE crew CASCADE; */
DROP TABLE IF EXISTS Captain CASCADE;
/* DROP TABLE request CASCADE; */
DROP TABLE IF EXISTS Ship CASCADE;
DROP TABLE IF EXISTS repairs CASCADE;
DROP TABLE IF EXISTS Technician CASCADE;

DROP TABLE IF EXISTS Reservation CASCADE;
DROP TABLE IF EXISTS Waitlist CASCADE;
DROP TABLE IF EXISTS Confirmed CASCADE;
DROP TABLE IF EXISTS Reserved CASCADE;
/* DROP TABLE Customer CASCADE; 
   DROP TABLE Reservation CASCADE; 
   DROP TABLE ISA CASCADE;
   DROP TABLE Waitlist CASCADE; 
   DROP TABLE Confirmed CASCADE; 
   DROP TABLE Reserved CASCADE; */
   
CREATE TABLE Captain (
	ID INTEGER NOT NULL, 
	name CHAR(30),
	PRIMARY KEY(ID)
); 


CREATE TABLE Cruise (
	c_num INTEGER NOT NULL,
	cost FLOAT, 
	num_sold INTEGER,
	num_stops INTEGER,
	actual_arrive_date CHAR(20),
	actual_arrive_time CHAR(10),
	actual_depart_time CHAR(10),
	source CHAR(30),
	destination CHAR(30),
	ID INTEGER,
	PRIMARY KEY (c_num),
	FOREIGN KEY (ID) REFERENCES Captain 
	/*might need connection to the aggregated entity here*/

);

CREATE TABLE Schedule ( 
	day CHAR(10),
	depart_time CHAR(10),
	arrive_time CHAR(10),
	c_num INTEGER NOT NULL,
	PRIMARY KEY (c_num),
	FOREIGN KEY (c_num) REFERENCES Cruise
);
	


CREATE TABLE Ship (
	model CHAR(30),
	shipID INTEGER NOT NULL,
	make CHAR(20),
	age INTEGER,
	seats INTEGER,
	PRIMARY KEY(shipID)
);

CREATE TABLE Technician (
	techID INTEGER NOT NULL,
	PRIMARY KEY(techID)
);


CREATE TABLE repairs (
	r_date CHAR(10),
	code INTEGER,
	shipID INTEGER NOT NULL,
	techID INTEGER NOT NULL,
	PRIMARY KEY(shipID, techID),
	FOREIGN KEY(shipID) REFERENCES Ship,
	FOREIGN KEY(techID) REFERENCES Technician
);

CREATE TABLE Reservation (
	rnum NUMERIC NOT NULL,
	PRIMARY KEY(rnum)
);

CREATE TABLE Waitlist (
	rnum NUMERIC NOT NULL,
	FOREIGN KEY(rnum) REFERENCES Reservation(rnum)
);

CREATE TABLE Confirmed (
	rnum NUMERIC NOT NULL,
	FOREIGN KEY(rnum) REFERENCES Reservation(rnum)
);

CREATE TABLE Reserved (
	rnum NUMERIC NOT NULL,
	FOREIGN KEY(rnum) REFERENCES Reservation(rnum)
);
