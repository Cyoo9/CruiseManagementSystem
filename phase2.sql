DROP TABLE Crew CASCADE;
DROP TABLE Works CASCADE;
DROP TABLE Customer CASCADE;
DROP TABLE Captain CASCADE;
DROP TABLE Cruise CASCADE;
DROP TABLE Schedule CASCADE;
DROP TABLE Ship CASCADE;
DROP TABLE Technician CASCADE;
DROP TABLE repairs CASCADE;
DROP TABLE Reservation CASCADE;
DROP TABLE has CASCADE;
DROP TABLE Waitlist CASCADE;
DROP TABLE Confirmed CASCADE;
DROP TABLE Reserved CASCADE;
DROP TABLE request CASCADE;

CREATE TABLE Crew (
	crew_ID INTEGER NOT NULL,
	crew_name CHAR(30),
	PRIMARY KEY(crew_ID)
);

CREATE TABLE Works (
	crew_ID INTEGER NOT NULL,
	c_num INTEGER NOT NULL, 
	PRIMARY KEY(crew_ID, c_num),
	FOREIGN KEY(crew_ID) REFERENCES Crew,
	FOREIGN KEY(c_num) REFERENCES Cruise
);
	

CREATE TABLE Customer ( 
	c_ID INTEGER NOT NULL, 
	first_name CHAR(30),
	last_name CHAR(30),
	gender CHAR(10),
	date_of_birth CHAR(11),
	address CHAR(30),
	contact_num INTEGER, 
	zip_code INTEGER,
	PRIMARY KEY(c_ID)
);


		       
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
	shipID INTEGER,
	PRIMARY KEY (c_num),
	FOREIGN KEY (ID) REFERENCES Captain,
	FOREIGN KEY(shipID) REFERENCES Ship
	
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

CREATE TABLE has (
	c_num INTEGER NOT NULL,
	c_ID INTEGER NOT NULL,
	rnum NUMERIC NOT NULL, 
	PRIMARY KEY(c_num, c_ID, rnum), 
	FOREIGN KEY(c_num) REFERENCES Cruise,
	FOREIGN KEY(c_ID) REFERENCES Customer,
	FOREIGN KEY(rnum) REFERENCES Reservation
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

CREATE TABLE request (
	request_id INTEGER NOT NULL,
	ID INTEGER NOT NULL, 
	shipID INTEGER NOT NULL, 
	techID INTEGER NOT NULL, 
	PRIMARY KEY(request_id, ID, shipID, techID),
	FOREIGN KEY(ID) REFERENCES Captain,
	FOREIGN KEY(shipID) REFERENCES Ship,
	FOREIGN KEY(techID) REFERENCES Technician
);
