CREATE OR REPLACE PROCEDURE test_trigger_verif_neuro IS

BEGIN

-- Insérer des données de test dans la table medecin_auxiliaire
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('1234567890', 'neurologue','Scott','Joel');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('2345678901', 'biologiste','Hutchinson','Jessica');
INSERT INTO medecin_auxilaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('3456789012', 'kine','Ritter','Tanya');



-- Insérer une ligne avec un médecin neurologue
insert_analyse_EEG (1234567890,1,4); --numero adeli correspondant au neurologue Scott Joel


-- Insérer une ligne avec un médecin non-neurologue
BEGIN
    insert_analyse_EEG (2345678901,1,2); --numero adeli correspondant à un medecin biologiste Hutchinson Jessica
EXCEPTION
    WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001,'Erreur : le médecin n est pas neurologue');
END;


-- Insérer une ligne avec un médecin inconnu
BEGIN
    insert_analyse_EEG (9999999999,1,3);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001,'Erreur : aucun medecin ne correspond a ce numero adeli ');
END;

END;
/
