--vérifie si le médecin innséré est un kiné pour les tests d'effort
CREATE OR REPLACE TRIGGER check_speciality_kiné
BEFORE INSERT ON analyse_effort
FOR EACH ROW
DECLARE
  specialite VARCHAR2(255);
BEGIN

  SELECT specialite INTO specialite FROM medecin_auxilaire WHERE num_adeli = :NEW.num_adeli;
  IF (specialite <> 'kiné') or (specialite <> 'kine') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Le médecin associé doit être un kiné.');
  END IF;
END;