--si un patient est posisitf au covid alors il est exclu de l'étude
create or replace TRIGGER positif_covid before insert or update on Analyse_COVID For each row
declare
   num_anom Fiche_quotidienne.num_anonymat%TYPE;
   res Analyse_Covid.id_analyse_covid%TYPE;
begin 
    select res_covid_PCR, Fiche_quotidienne.num_anonymat into res, num_anom from Analyse_Covid inner join Fiche_quotidienne on Analyse_Covid.id_analyse_covid = Fiche_quotidienne.id_fiche inner join Patient on Fiche_quotidienne.num_anonymat=Patient.num_anonymat;
    if res=1 then
    update Patient set exclu=1 where num_anom = num_anonymat;
    end if;    
end;
/