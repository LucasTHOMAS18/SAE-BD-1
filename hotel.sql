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
    nomH VARCHAR(50),
    GPS VARCHAR(25),
    adresseH VARCHAR(50),
    qualite INT
);

CREATE TABLE Chambre (
    codeH INT,
    numC INT,
    capacite INT NOT NULL,
    superficie INT NOT NULL,
    PRIMARY KEY (codeH, numC),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH)
);

CREATE TABLE Personne (
    idPersonne INT PRIMARY KEY,
    nomPers VARCHAR(20) NOT NULL,
    adressePers VARCHAR(50) NOT NULL,
    dateNaissancePers DATE NOT NULL
);

CREATE TABLE Personnel (
    idPersonnel INT PRIMARY KEY,
    fonction VARCHAR(50) NOT NULL,
    codeH INT,
    nomDep VARCHAR(50),
    FOREIGN KEY (idPersonnel) REFERENCES Personne(idPersonne),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH)
);

CREATE TABLE Client (
    idClient INT PRIMARY KEY,
    nationalite VARCHAR(20) NOT NULL,
    FOREIGN KEY (idClient) REFERENCES Personne(idPersonne)
);

CREATE TABLE Departement (
    codeH INT,
    nomDep VARCHAR(50),
    directeurDep INT NOT NULL,
    telDep VARCHAR(10) NOT NULL,
    PRIMARY KEY (codeH, nomDep),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH),
    FOREIGN KEY (directeurDep) REFERENCES Personnel(idPersonnel)
);

ALTER TABLE Personnel ADD FOREIGN KEY (codeH, nomDep) REFERENCES Departement(codeH, nomDep);

CREATE TABLE Reservation (
    codeH INT,
    numC INT,
    dateDebut DATE,
    prixRes DECIMAL(10, 2) NOT NULL,
    dateFin DATE NOT NULL,
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
    dateDebut DATE,
    nomDep VARCHAR(50),
    dateS DATE,
    heureS DATE,
    nomS VARCHAR(50) NOT NULL,
    prixS DECIMAL(10, 2),
    quantiteS INT,
    paye NUMBER(1),
    idClient INT,
    PRIMARY KEY (codeH, numC, dateDebut, nomDep, dateS, heureS),
    FOREIGN KEY (codeH, dateDebut) REFERENCES Reservation(codeH, dateDebut),
    FOREIGN KEY (codeH, numC) REFERENCES Chambre(codeH, numC),
    FOREIGN KEY (nomDep, codeH) REFERENCES Departement(nomDep, codeH),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);
