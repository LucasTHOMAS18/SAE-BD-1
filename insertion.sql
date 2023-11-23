-- Insertions pour la table Hotel
INSERT INTO Hotel VALUES (1, 'Hotel A', 'GPS_A', 'Adresse A', 4);
INSERT INTO Hotel VALUES (2, 'Hotel B', 'GPS_B', 'Adresse B', 3);

-- Insertions pour la table Chambre
INSERT INTO Chambre VALUES (1, 101, 2, 30);
INSERT INTO Chambre VALUES (1, 102, 3, 40);
INSERT INTO Chambre VALUES (2, 201, 2, 35);
INSERT INTO Chambre VALUES (2, 202, 4, 50);

-- Insertions pour la table Personne
INSERT INTO Personne VALUES (1, 'John Doe', 'Adresse 1', TO_DATE('01-01-1990', 'DD-MM-YYYY'));
INSERT INTO Personne VALUES (2, 'Jane Doe', 'Adresse 2', TO_DATE('15-05-1985', 'DD-MM-YYYY'));

-- Insertions pour la table Client
INSERT INTO Client VALUES (1, 'Française');
INSERT INTO Client VALUES (2, 'Anglaise');

-- Insertions pour la table Reservation
INSERT INTO Reservation VALUES (1, 101, TO_DATE('01-02-2023', 'DD-MM-YYYY'), 150.00, TO_DATE('05-02-2023', 'DD-MM-YYYY'), 2, 0, 1);
INSERT INTO Reservation VALUES (2, 201, TO_DATE('10-03-2023', 'DD-MM-YYYY'), 200.00, TO_DATE('15-03-2023', 'DD-MM-YYYY'), 1, 1, 2);

-- Insertions pour la table Departement
INSERT INTO Departement VALUES (1, 'Département A', NULL, '1234567890');
INSERT INTO Departement VALUES (2, 'Département B', NULL, '0987654321');

-- Insertions pour la table Service
INSERT INTO Service VALUES (1, 101, 'Département A', TO_DATE('02-02-2023', 'DD-MM-YYYY'), TO_DATE('10:00', 'HH24:MI'), 'Service A', 50.00, 2, 0, 1);
INSERT INTO Service VALUES (2, 201, 'Département B', TO_DATE('12-03-2023', 'DD-MM-YYYY'), TO_DATE('15:30', 'HH24:MI'), 'Service B', 75.00, 1, 1, 2);

-- Insertions pour la table Personnel
INSERT INTO Personnel VALUES (1, 'Réceptionniste', 1, 'Département A');
INSERT INTO Personnel VALUES (2, 'Gérant', 2, 'Département B');

-- Updates des directeurs des départements
UPDATE Departement SET directeurDep=1 WHERE codeH=1 AND nomDep='Département A';
UPDATE Departement SET directeurDep=2 WHERE codeH=2 AND nomDep='Département B';
