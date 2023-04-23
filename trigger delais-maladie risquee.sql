-- si un patient a une maladie à risque alors le delais des examens complémentaires est divisé par deux
create or replace TRIGGER maladie_risquee before insert or update on Patient For each row
declare
    pathorisque Pathologie.patho_risque%TYPE;

begin
    select max (patho_risque) into pathorisque from Pathologie inner join Contracter on Pathologie.id_patho = Contracter.id_patho inner join Patient on Contracter.num_anonymat=Patient.num_anonymat;
    if pathorisque=1 then 
    update Fiche_quotidienne set date_pro_exam= (datejour-date_pro_exam)/2 where :new.num_anonymat = num_anonymat;
    end if;
end;