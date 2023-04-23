CREATE OR REPLACE PROCEDURE test_trigger_verif_bio IS

BEGIN

-- Créer une table de test pour les médecins auxiliaires
CREATE TABLE medecin_auxiliaire (
    num_adeli VARCHAR2(10),
    specialite VARCHAR2(15)
    nom_medecin VARCHAR2(25),
    prenom_medecin VARCHAR2(25),
);

-- Insérer des données de test dans la table medecin_auxiliaire
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('1234567890', 'neurologue','Scott','Joel');
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('2345678901', 'biologiste','Hutchinson','Jessica');
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('3456789012', 'kine','Ritter','Tanya');

-- Créer une table de test pour les analyses de sang
CREATE TABLE analyse_sang (
    id_analyse_sang NUMBER,
    c_cholesterol NUMBER,
    c_glycemie NUMBER,
    c_plaquette NUMBER,
    c_4 NUMBER,
    c_5 NUMBER,
    c_6 NUMBER,
    res_prise_sang BOOLEAN,
    num_adeli VARCHAR2(10)
);

-- Insérer une ligne avec un médecin biologiste
INSERT INTO analyse_sang (id_analyse_sang,c_cholesterol,c_glycemie,c_plaquette,c_4,c_5,c_6,res_prise_sang,num_adeli) VALUES (1,4,3,6,8,5,2,9, '2345678901'); --numero adeli correspondant au medecin biologiste Hutchinson Jessica


-- Insérer une ligne avec un médecin non-biologiste
BEGIN
    INSERT INTO analyse_sang (id_analyse_sang,c_cholesterol,c_glycemie,c_plaquette,c_4,c_5,c_6,res_prise_sang,num_adeli) VALUES (1,4,3,6,8,5,2,9, '3456789012'); --numero adeli correspondant à un medecin kine Ritter Tanya
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : le médecin n est pas biologiste' || SQLCODE);
END;


-- Insérer une ligne avec un médecin inconnu
BEGIN
    INSERT INTO analyse_sang (id_analyse_sang,c_cholesterol,c_glycemie,c_plaquette,c_4,c_5,c_6,res_prise_sang,num_adeli) VALUES (1,4,3,6,8,5,2,9, '9999999999');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : aucun medecin ne correspond a ce numero adeli ' || SQLCODE );
END;

-- Vérifier que la seule seule ligne valide a bien été insérée dans la table analyse_sang
SELECT * FROM analyse_sang;

END;
/