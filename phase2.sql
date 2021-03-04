DROP TABLE IF EXISTS Crew CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Captain CASCADE;
DROP TABLE IF EXISTS Cruise CASCADE;
DROP TABLE IF EXISTS Schedule CASCADE;
DROP TABLE IF EXISTS Ship CASCADE;
DROP TABLE IF EXISTS Technician CASCADE;
DROP TABLE IF EXISTS repairs CASCADE;
DROP TABLE IF EXISTS Reservation CASCADE;
DROP TABLE IF EXISTS has CASCADE;
DROP TABLE IF EXISTS Waitlist CASCADE;
DROP TABLE IF EXISTS Confirmed CASCADE;
DROP TABLE IF EXISTS Reserved CASCADE;
DROP TABLE IF EXISTS request CASCADE;
DROP TABLE IF EXISTS Works CASCADE;
DROP TABLE IF EXISTS uses CASCADE;

CREATE TABLE Crew (
	crew_ID INTEGER NOT NULL,
	crew_name CHAR(30),
	PRIMARY KEY(crew_ID)
);

CREATE TABLE Customer ( 
	cust_ID INTEGER NOT NULL, 
	first_name CHAR(30),
	last_name CHAR(30),
	gender CHAR(10),
	date_of_birth CHAR(11),
	address CHAR(30),
	contact_num INTEGER, 
	zip_code INTEGER,
	PRIMARY KEY(cust_ID)
);
	       
CREATE TABLE Captain (
	capt_ID INTEGER NOT NULL, 
	name CHAR(30),
	PRIMARY KEY(capt_ID)
);

CREATE TABLE Ship (
        model CHAR(30),
        ship_ID INTEGER NOT NULL,
        make CHAR(20),
        age INTEGER,
        seats INTEGER,
        PRIMARY KEY(ship_ID)
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
	capt_ID INTEGER NOT NULL,
	ship_ID INTEGER,
	PRIMARY KEY(c_num),
	FOREIGN KEY(capt_ID) REFERENCES Captain ON DELETE NO ACTION,
	FOREIGN KEY(ship_ID) REFERENCES Ship ON DELETE NO ACTION
);

CREATE TABLE Works (
        crew_ID INTEGER NOT NULL,
        c_num INTEGER NOT NULL,
        PRIMARY KEY(crew_ID, c_num),
        FOREIGN KEY(crew_ID) REFERENCES Crew,
        FOREIGN KEY(c_num) REFERENCES Cruise
);

CREATE TABLE Schedule ( 
	day CHAR(10),
	depart_time CHAR(10),
	arrive_time CHAR(10),
	c_num INTEGER NOT NULL,
	PRIMARY KEY(c_num, day),
	FOREIGN KEY(c_num) REFERENCES Cruise ON DELETE CASCADE
);

CREATE TABLE Technician (
	tech_ID INTEGER NOT NULL,
	PRIMARY KEY(tech_ID)
);

CREATE TABLE repairs (
	r_date CHAR(10),
	code INTEGER,
	ship_ID INTEGER NOT NULL,
	tech_ID INTEGER NOT NULL,
	PRIMARY KEY(ship_ID, tech_ID),
	FOREIGN KEY(ship_ID) REFERENCES Ship ON DELETE NO ACTION,
	FOREIGN KEY(tech_ID) REFERENCES Technician 
);

CREATE TABLE Reservation (
	rnum NUMERIC NOT NULL,
	PRIMARY KEY(rnum)
);

CREATE TABLE has (
	c_num INTEGER NOT NULL,
	cust_ID INTEGER NOT NULL,
	rnum NUMERIC NOT NULL, 
	PRIMARY KEY(c_num, cust_ID, rnum), 
	FOREIGN KEY(c_num) REFERENCES Cruise,
	FOREIGN KEY(cust_ID) REFERENCES Customer ON DELETE NO ACTION,
	FOREIGN KEY(rnum) REFERENCES Reservation  ON DELETE NO ACTION
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
	req_ID INTEGER NOT NULL,
	capt_ID INTEGER NOT NULL, 
	ship_ID INTEGER NOT NULL, 
	tech_ID INTEGER NOT NULL, 
	PRIMARY KEY(req_ID, capt_ID, ship_ID, tech_ID),
	FOREIGN KEY(capt_ID) REFERENCES Captain ON DELETE NO ACTION,
	FOREIGN KEY(ship_ID) REFERENCES Ship,
	FOREIGN KEY(tech_ID) REFERENCES Technician
);
