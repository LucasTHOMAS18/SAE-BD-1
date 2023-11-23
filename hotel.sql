DROP TABLE Personne cascade constraints;
DROP TABLE Chambre cascade constraints;
DROP TABLE Departement cascade constraints;
DROP TABLE Personnel cascade constraints;
DROP TABLE Reservation cascade constraints;
DROP TABLE Service cascade constraints;
DROP TABLE Hotel cascade constraints;
DROP TABLE Client cascade constraints; 

CREATE TABLE Hotel (
    codeH INT PRIMARY KEY,
    nomH VARCHAR(255),
    GPS VARCHAR(255),
    adresseH VARCHAR(255),
    qualite INT
);

CREATE TABLE Chambre (
    codeH INT,
    numC INT,
    capacite INT,
    superficie INT,
    PRIMARY KEY (codeH, numC),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH)
);

CREATE TABLE Personne (
    idPersonne INT PRIMARY KEY,
    nomPers VARCHAR(255),
    adressePers VARCHAR(255),
    dateNaissancePers DATE
);

CREATE TABLE Personnel (
    idPersonnel INT PRIMARY KEY,
    fonction VARCHAR(255),
    codeH INT,
    nomDep VARCHAR(255),
    FOREIGN KEY (idPersonnel) REFERENCES Personne(idPersonne),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH)
);

CREATE TABLE Client (
    idClient INT PRIMARY KEY,
    nationnalite VARCHAR(255),
    FOREIGN KEY (idClient) REFERENCES Personne(idPersonne)
);

CREATE TABLE Departement (
    codeH INT,
    nomDep VARCHAR(255),
    directeurDep INT,
    telDep VARCHAR(10),
    PRIMARY KEY (codeH, nomDep),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH),
    FOREIGN KEY (directeurDep) REFERENCES Personnel(idPersonnel)
);

ALTER TABLE Personnel ADD FOREIGN KEY (codeH, nomDep) REFERENCES Departement(codeH, nomDep);

CREATE TABLE Reservation (
    codeH INT,
    numC INT,
    dateDebut DATE,
    prixRes DECIMAL(10, 2),
    dateFin DATE,
    nbAdultes INT,
    nbEnfants INT,
    idClient INT,
    PRIMARY KEY (codeH, numC, dateDebut),
    FOREIGN KEY (codeH, numC) REFERENCES Chambre(codeH, numC),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE Service (
    codeH INT,
    numC INT,
    nomDep VARCHAR(255),
    dateS DATE,
    heure DATE,
    nomS VARCHAR(255),
    prixS DECIMAL(10, 2),
    quantiteS INT,
    paye NUMBER(1),
    idClient INT,
    PRIMARY KEY (codeH, numC, nomDep, dateS, heure),
    FOREIGN KEY (codeH, numC) REFERENCES Chambre(codeH, numC),
    FOREIGN KEY (nomDep, codeH) REFERENCES Departement(nomDep, codeH),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);
