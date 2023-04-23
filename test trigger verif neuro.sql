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

-- Créer une table de test pour les analyses EEG
CREATE TABLE analyse_EEG (
    id_analyse_eeg NUMBER,
    res_electro NUMBER,
    num_adeli VARCHAR2(10)
);

-- Insérer une ligne avec un médecin neurologue
INSERT INTO analyse_EEG (id_analyse_eeg, res_electro, num_adeli) VALUES (1,4, '1234567890'); --numero adeli correspondant au neurologue Scott Joel


-- Insérer une ligne avec un médecin non-neurologue
BEGIN
    INSERT INTO analyse_EEG (id_analyse_eeg, res_electro, num_adeli) VALUES (1,2, '2345678901'); --numero adeli correspondant à un medecin biologiste Hutchinson Jessica
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : le médecin n est pas neurologue' || SQLCODE);
END;


-- Insérer une ligne avec un médecin inconnu
BEGIN
    INSERT INTO analyse_EEG (id_analyse_eeg, res_electro, num_adeli) VALUES (1,3, '9999999999');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : aucun medecin ne correspond a ce numero adeli ' || SQLCODE );
END;

-- Vérifier que la seule seule ligne valide a bien été insérée dans la table analyse_EEG
SELECT * FROM analyse_EEG;





