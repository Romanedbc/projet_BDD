--vérifie si le médecin innséré est un neurologue pour les EEG
CREATE OR REPLACE TRIGGER check_speciality_neuro
BEFORE INSERT ON analyse_EEG
FOR EACH ROW
DECLARE
  specialite VARCHAR2(255);
BEGIN

  SELECT specialite INTO specialite FROM medecin_auxilaire WHERE num_adeli = :NEW.num_adeli;
  IF (specialite <> 'neurologue') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Le médecin associé doit être un neurologue.');
  END IF;
END;