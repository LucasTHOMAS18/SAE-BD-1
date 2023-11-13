Hotel[codeH, nomH, GPS, adresseH]
PK: codeH

Chambre[codeH, numC, capacite, superficie]
PK: (codeH, numC)
FK: codeH ⊆ Hotel (codeH)

Departement[codeH, nomDep, directeurDep, telDep]
PK: (codeH, nomDep)
FK: codeH ⊆ Hotel (codeH)
    directeurDep ⊆ Personnel (idPersonnel)

Personne[idPersonne, nomPers, adresserPers, dateNaissancePers]
PK: idPersonne

Personnel[idPersonnel, fonction, dep]
PK: idPersonnel
FK: idPersonnel ⊆ Pesronne (idPersonne)
    dep ⊆ Derpartement (nomDep)

Client[idClient, nationnalite]
PK: idClient
FK: idClient ⊆ Personne (idPersonne)

Reservation[codeH, numC, dateDebut, prixRes, dateFin, nbAdultes, nbEnfants, idClient]
PK: (codeH, numC, dateDebut)
FK: codeH ⊆ Hotel (codeH)
    numC ⊆ Chambre (numC)
    idClient ⊆ Client (idClient)

Service[codeH, numC, nomDep, date, heure, nomS, prixS, quantiteS, paye]
PK: (codeH, numC, nomDep, date, heure)
FK: codeH ⊆ Hotel (codeH)
    numC ⊆ Chambre (numC)
    nomDep ⊆ Departement (nomDep)

