CREATE OR REPLACE PROCEDURE test_trigger_verif_kine IS

BEGIN

-- Créer une table de test pour les médecins auxiliaires
CREATE TABLE medecin_auxiliaire (
    num_adeli VARCHAR2(10),
    specialite VARCHAR2(15)
    nom_medecin VARCHAR2(25),
    prenom_medecin VARCHAR2(25)
);

-- Insérer des données de test dans la table medecin_auxiliaire
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('1234567890', 'neurologue','Scott','Joel');
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('2345678901', 'biologiste','Hutchinson','Jessica');
INSERT INTO medecin_auxiliaire (num_adeli, specialite, nom_medecin,prenom_medecin) VALUES ('3456789012', 'kine','Ritter','Tanya');

-- Créer une table de test pour les tests d effort
CREATE TABLE analyse_effort (
    id_analyse_effort NUMBER,
    rythme_av_effort NUMBER,
    rythme_ap_effort NUMBER,
    rythme_av_repos NUMBER,
    num_adeli VARCHAR2(10)
);

-- Insérer une ligne avec un médecin kine
INSERT INTO analyse_effort (id_analyse_effort, rythme_av_effort,rythme_ap_effort,rythme_av_repos, num_adeli) VALUES (1,4,5,6,'3456789012'); --numero adeli correspondant au kine Ritter Tanya


-- Insérer une ligne avec un médecin non-neurologue
BEGIN
    INSERT INTO analyse_effort (id_analyse_effort, rythme_av_effort,rythme_ap_effort,rythme_av_repos, num_adeli) VALUES (1,4,5,6,'2345678901'); --numero adeli correspondant au biologiste Hutchinson Jessica
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : le médecin n est pas kine' || SQLCODE);
END;


-- Insérer une ligne avec un médecin inconnu
BEGIN
    INSERT INTO analyse_EEG (id_analyse_effort, rythme_av_effort,rythme_ap_effort,rythme_av_repos, num_adeli) VALUES (1,4,5,6,'9999999999');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : aucun medecin ne correspond a ce numero adeli ' || SQLCODE );
END;

-- Vérifier que la seule seule ligne valide a bien été insérée dans la table analyse_EEG
SELECT * FROM analyse_effort;

END;
/