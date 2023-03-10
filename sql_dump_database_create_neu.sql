DROP DATABASE IF EXISTS krautundrueben;
CREATE DATABASE IF NOT EXISTS krautundrueben;
USE krautundrueben;


CREATE TABLE REGION (
    REGIONSNR       INTEGER NOT NULL,
    PLZ             VARCHAR(5),
    ORT             VARCHAR(50),
    PRIMARY KEY (REGIONSNR)
);

CREATE TABLE KUNDE (
    KUNDENNR        INTEGER NOT NULL,
    NACHNAME        VARCHAR(50),
    VORNAME         VARCHAR(50),
    GEBURTSDATUM	DATE,
	STRASSE         VARCHAR(50),
	HAUSNR			VARCHAR(6),			
    REGIONSNR       INTEGER NOT NULL,
    TELEFON         VARCHAR(25),
    EMAIL           VARCHAR(50),
    PRIMARY KEY (KUNDENNR),
    FOREIGN KEY (REGIONSNR) REFERENCES REGION (REGIONSNR)
);

CREATE TABLE LIEFERANT (
    LIEFERANTENNR   INTEGER NOT NULL,
    LIEFERANTENNAME VARCHAR(50),
    STRASSE         VARCHAR(50),
    HAUSNR			VARCHAR(6),
    REGIONSNR       INTEGER NOT NULL,
    TELEFON			VARCHAR(25),
    EMAIL           VARCHAR(50),
    PRIMARY KEY (LIEFERANTENNR),
    FOREIGN KEY (REGIONSNR) REFERENCES REGION (REGIONSNR)
);

CREATE TABLE BESTELLUNG (
    BESTELLNR        INTEGER AUTO_INCREMENT NOT NULL,
    KUNDENNR         INTEGER,
    BESTELLDATUM     DATE,
    RECHNUNGSBETRAG  DECIMAL(10,2),
    PRIMARY KEY (BESTELLNR),
    FOREIGN KEY (KUNDENNR) REFERENCES KUNDE (KUNDENNR)
);


CREATE TABLE REZEPT (
    REZEPTNR    INTEGER NOT NULL,
    NAME        VARCHAR(50),
    ANLEITUNG   VARCHAR(500),
    PRIMARY KEY (REZEPTNR)
);

CREATE TABLE ALLERGENE  (
  ALLERGENNR  INTEGER NOT NULL,
  NAME        VARCHAR (50),
  PRIMARY KEY (ALLERGENNR)
);

CREATE TABLE ERNAEHRUNGSKATEGORIE (
  KATEGORIENR INTEGER NOT NULL,
  NAME        VARCHAR (50),
  PRIMARY KEY (KATEGORIENR)
);

CREATE TABLE REZEPTERNAEHRUNGSKATEGORIE (
  REZEPTNR  INTEGER NOT NULL,
  KATEGORIENR INTEGER NOT NULL,
  PRIMARY KEY (REZEPTNR,KATEGORIENR),
  FOREIGN KEY (REZEPTNR)REFERENCES REZEPT (REZEPTNR), 
  FOREIGN KEY (KATEGORIENR) REFERENCES ERNAEHRUNGSKATEGORIE (KATEGORIENR)
);

CREATE TABLE ZUTAT(
    ZUTATENNR			INTEGER NOT NULL,
    BEZEICHNUNG         VARCHAR(50),
    EINHEIT        		VARCHAR (25),
    NETTOPREIS       	DECIMAL(10,2),
    BESTAND             INTEGER,
    LIEFERANT			INTEGER,
	KALORIEN			INTEGER,
	KOHLENHYDRATE		DECIMAL (10,2),
	PROTEIN			    DECIMAL(10,2),
  ALLERGENNR    INTEGER NOT NULL,
  CO2           INTEGER ,
	PRIMARY KEY (ZUTATENNR),
	FOREIGN KEY (LIEFERANT) REFERENCES LIEFERANT (LIEFERANTENNR),
  FOREIGN KEY (ALLERGENNR) REFERENCES ALLERGENE (ALLERGENNR)
);

CREATE TABLE REZEPTZUTAT  (
    REZEPTNR  INTEGER NOT NULL,
    ZUTATENNR INTEGER NOT NULL,
    MENGE INTEGER NOT NULL,
    PRIMARY KEY (REZEPTNR,ZUTATENNR),
    FOREIGN KEY (REZEPTNR)REFERENCES REZEPT (REZEPTNR),
    FOREIGN KEY (ZUTATENNR)REFERENCES ZUTAT (ZUTATENNR)
);

CREATE TABLE BESTELLUNGREZEPT (
    BESTELLNR       INTEGER NOT NULL,
    REZEPTNR        INTEGER NOT NULL,
    MENGE     		INTEGER,
    PRIMARY KEY (BESTELLNR,REZEPTNR),
    FOREIGN KEY (BESTELLNR) REFERENCES BESTELLUNG (BESTELLNR),
    FOREIGN KEY (REZEPTNR) REFERENCES REZEPT (REZEPTNR)
);