DROP TABLE Schedule CASCADE;
DROP TABLE Cruise CASCADE;
/* DROP TABLE has CASCADE; */
/* DROP TABLE works CASCADE; */
/* DROP TABLE crew CASCADE; */
DROP TABLE Captain CASCADE;
/* DROP TABLE request CASCADE; */
DROP TABLE Ship CASCADE;
DROP TABLE repairs CASCADE;
DROP TABLE Technician CASCADE;
/* DROP TABLE Customer CASCADE; 
   DROP TABLE Reservation CASCADE; 
   DROP TABLE ISA CASCADE;
   DROP TABLE Waitlist CASCADE; 
   DROP TABLE Confirmed CASCADE; 
   DROP TABLE Reserved CASCADE; */

CREATE TABLE Schedule ( 
	day CHAR(10),
	depart_time CHAR(10),
	arrive_time CHAR(10),
	c_num INTEGER,
	PRIMARY KEY (c_num),
	FOREIGN KEY (c_num) REFERENCES Cruise
);
	
CREATE TABLE Cruise (
	c_num INTEGER,
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
CREATE TABLE Captain (
	ID INTEGER, 
	name CHAR(30),
	PRIMARY KEY(ID)
); 

CREATE TABLE Ship (
	model CHAR(30),
	shipID INTEGER,
	make CHAR(20),
	age INTEGER,
	seats INTEGER,
	PRIMARY KEY(shipID)
);

CREATE TABLE repairs (
	r_date CHAR(10),
	code INTEGER,
	shipID INTEGER,
	techID INTEGER,
	PRIMARY KEY(shipID, techID),
	FOREIGN KEY(shipID) REFERENCES Ship,
	FOREIGN KEY(techID) REFERENCES Technician
);

CREATE TABLE Technician (
	techID INTEGER,
	PRIMARY KEY(techID)
);



