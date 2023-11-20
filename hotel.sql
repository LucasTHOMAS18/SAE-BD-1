DROP TABLE Hotel;
DROP TABLE Chambre;
DROP TABLE Departement;
DROP TABLE Personne;
DROP TABLE Personnel;
DROP TABLE Client;
DROP TABLE Reservation;
DROP TABLE Service;


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

CREATE TABLE Departement (
    codeH INT,
    nomDep VARCHAR(255),
    directeurDep VARCHAR(255),
    telDep VARCHAR(255),
    PRIMARY KEY (codeH, nomDep),
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH),
    FOREIGN KEY (directeurDep) REFERENCES Personnel(idPersonnel)
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
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH),
    FOREIGN KEY (nomDep) REFERENCES Departement(nomDep)
);

CREATE TABLE Client (
    idClient INT PRIMARY KEY,
    nationnalite VARCHAR(255),
    FOREIGN KEY (idClient) REFERENCES Personne(idPersonne)
);

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
    FOREIGN KEY (codeH) REFERENCES Hotel(codeH),
    FOREIGN KEY (numC) REFERENCES Chambre(numC),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);

CREATE TABLE Service (
    codeH INT,
    numC INT,
    nomDep VARCHAR(255),
    date DATE,
    heure TIME,
    nomS VARCHAR(255),
    prixS DECIMAL(10, 2),
    quantiteS INT,
    paye BOOLEAN,
    idClient INT,
    PRIMARY KEY (codeH, numC, nomDep, date, heure),
    FOREIGN KEY (numC) REFERENCES Chambre(numC),
    FOREIGN KEY (nomDep, codeH) REFERENCES Departement(nomDep, codeH),
    FOREIGN KEY (idClient) REFERENCES Client(idClient)
);