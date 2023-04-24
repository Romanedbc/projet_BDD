CREATE OR REPLACE PROCEDURE test_trigger_verif_kine IS

BEGIN


-- Insérer des données de test dans la table medecin_auxiliaire
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('1234567890', 'neurologue','Scott','Joel');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('2345678901', 'biologiste','Hutchinson','Jessica');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('3456789012', 'kine','Ritter','Tanya');


-- Insérer une ligne avec un médecin kine
insert_analyse_effort (3456789012,1,4,5,6); --numero adeli correspondant au kine Ritter Tanya


-- Insérer une ligne avec un médecin non-neurologue
BEGIN
insert_analyse_effort (2345678901,1,4,5,6); --numero adeli correspondant au biologiste Hutchinson Jessica
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001,'Erreur : le médecin n est pas kine');
END;


-- Insérer une ligne avec un médecin inconnu
BEGIN
    insert_analyse_effort (9999999999,1,4,5,6);
EXCEPTION
    WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20001,'Erreur : aucun medecin ne correspond a ce numero adeli ');
END;

END;
/
