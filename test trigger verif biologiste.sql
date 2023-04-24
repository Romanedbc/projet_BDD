create or replace PROCEDURE test_trigger_verif_bio IS
BEGIN


-- Insérer des données de test dans la table medecin_auxiliaire
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('1234567890', 'Neurologue','Scott','Joel');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('2345678901', 'Biologiste','Hutchinson','Jessica');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('3456789012', 'Kine','Ritter','Tanya');

-- Insérer une ligne avec un médecin biologiste
insert_analyse_sang(2345678901, 5, 8, 3, 7, 2, 10, 2, 10);



-- Insérer une ligne avec un médecin non-biologiste
begin
insert_analyse_sang(1234567890, 5, 8, 3, 7, 2, 10, 2, 10);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erreur : le médecin n est pas biologiste');

end;

-- Insérer une ligne avec un médecin inconnu
begin
insert_analyse_sang(09874736, 5, 8, 3, 7, 2, 10, 2, 10);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erreur : ce médecin nexiste pas');
end;

end;
