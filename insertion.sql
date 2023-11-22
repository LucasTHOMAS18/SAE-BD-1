-- Insertions pour la table Hotel
INSERT INTO Hotel (codeH, nomH, GPS, adresseH, qualite) VALUES
(1, 'Hotel A', '12.345,67.890', 'Adresse A', 4),
(2, 'Hotel B', '23.456,78.901', 'Adresse B', 3),
(3, 'Hotel C', '34.567,89.012', 'Adresse C', 5);

-- Insertions pour la table Chambre
INSERT INTO Chambre (codeH, numC, capacite, superficie) VALUES
(1, 101, 2, 25),
(1, 102, 3, 30),
(2, 201, 2, 28),
(2, 202, 4, 35),
(3, 301, 3, 32),
(3, 302, 2, 26);

-- Insertions pour la table Personne
INSERT INTO Personne (idPersonne, nomPers, adressePers, dateNaissancePers) VALUES
(1, 'Alice', 'Adresse Alice', '1990-05-15'),
(2, 'Bob', 'Adresse Bob', '1985-08-22'),
(3, 'Charlie', 'Adresse Charlie', '1992-11-10');

-- Insertions pour la table Personnel
INSERT INTO Personnel (idPersonnel, fonction, codeH, nomDep) VALUES
(1, 'Réceptionniste', 1, 'Département A'),
(2, 'Serveur', 2, 'Département B'),
(3, 'Gérant', 3, 'Département C');

-- Insertions pour la table Client
INSERT INTO Client (idClient, nationnalite) VALUES
(1, 'Française'),
(2, 'Allemande'),
(3, 'Espagnole');

-- Insertions pour la table Departement
INSERT INTO Departement (codeH, nomDep, directeurDep, telDep) VALUES
(1, 'Département A', 1, '1234567890'),
(2, 'Département B', 2, '2345678901'),
(3, 'Département C', 3, '3456789012');

-- Insertions pour la table Reservation
INSERT INTO Reservation (codeH, numC, dateDebut, prixRes, dateFin, nbAdultes, nbEnfants, idClient) VALUES
(1, 101, '2023-01-01', 150.00, '2023-01-05', 2, 1, 1),
(2, 201, '2023-02-10', 200.50, '2023-02-15', 1, 0, 2),
(3, 301, '2023-03-20', 180.75, '2023-03-25', 2, 2, 3);

-- Insertions pour la table Service
INSERT INTO Service (codeH, numC, nomDep, dateS, heure, nomS, prixS, quantiteS, paye, idClient) VALUES
(1, 101, 'Département A', '2023-01-02', '14:00', 'Service A', 50.00, 2, 1, 1),
(2, 201, 'Département B', '2023-02-12', '19:30', 'Service B', 30.00, 1, 1, 2),
(3, 301, 'Département C', '2023-03-22', '12:45', 'Service C', 40.50, 2, 0, 3);
