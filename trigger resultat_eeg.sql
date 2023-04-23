--si deux résultats d'un eeg sont <3 alors il faut en refaire un le lendemain
CREATE OR REPLACE TRIGGER resultat_eeg before insert or update on Analyse_EEG for each row
declare
    res_eeg_1 Analyse_EEG.res_electro%TYPE;
    res_eeg_2 Analyse_EEG.res_electro%TYPE;
    num_anom Fiche_quotidienne.num_anonymat%TYPE;
    
begin
    select res_electro,res_electro, Fiche_quotidienne.num_anonymat into res_eeg_1,res_eeg_2, num_anom from Analyse_EEG inner join Fiche_quotidienne on Analyse_EEG.id_analyse_EEG = Fiche_quotidienne.id_fiche inner join Patient on Fiche_quotidienne.num_anonymat=Patient.num_anonymat;
    if res_eeg_1<3 and res_eeg_2<3 then
    update Fiche_quotidienne set date_pro_exam= datejour+1 where :new.num_anonymat = num_anonymat;
    end if;
end;
/