Hotel[codeH, nomH, GPS, adresseH, qualite]
PK: codeH

Chambre[codeH, numC, capacite, superficie]
PK: (codeH, numC)
FK: codeH ⊆ Hotel (codeH)
NOT NULL: capacite, superficie

Departement[codeH, nomDep, directeurDep, telDep]
PK: (codeH, nomDep)
FK: codeH ⊆ Hotel (codeH)
    directeurDep ⊆ Personnel (idPersonnel)
NOT NULL: directeurDep, telDep

Personne[idPersonne, nomPers, adresserPers, dateNaissancePers]
PK: idPersonne
NOT NULL: nomPers, adresserPers, dateNaissancePers

Personnel[idPersonnel, nomPers, adresserPers, dateNaissancePers, fonction, codeH, nomDep]
PK: idPersonnel
FK: idPersonnel ⊆ Personne (idPersonne)
    codeH ⊆ Hotel (codeH)
    nomDep ⊆ Departement (nomDep)
NOT NULL: nomPers, adresserPers, dateNaissancePers, fonction

Client[idClient, nomPers, adresserPers, dateNaissancePers, nationalite]
PK: idClient
FK: idClient ⊆ Personne (idPersonne)
NOT NULL: nomPers, adresserPers, dateNaissancePers, nationalite

Reservation[codeH, numC, dateDebut, prixRes, dateFin, nbAdultes, nbEnfants, idClient]
PK: (codeH, numC, dateDebut)
FK: codeH ⊆ Hotel (codeH)
    numC ⊆ Chambre (numC)
    idClient ⊆ Client (idClient)
NOT NULL: prixRes, dateFin

Service[codeH, numC, dateDebut, nomDep, dateS, heureS, nomS, prixS, quantiteS, paye, idClient]
PK: (codeH, numC, dateDebut, nomDep, dateS, heureS)
FK: (nomDep, codeH) ⊆ Departement (nomDep, codeH)
    (dateDebut, numC, codeH) ⊆ Reservation (dateDebut, numC, codeH) 
    idClient ⊆ Client (idClient)
NOT NULL: nomS
