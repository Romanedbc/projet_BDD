
create or replace trigger renouv_prise_sang 
after update on fiche_quotidienne for each row
begin
    for i in 1..6 loop
        if NEW.datejour > OLD.datejour and date_pro_exam!=0 then
        update fiche_quotidienne set date_pro_exam = date_pro_exam -1;
        i:=i+1;
        end if
end;


create or replace trigger renouv_EEG
after update on fiche_quotidienne for each row
begin
    for i in 1..4 loop
        if NEW.datejour > OLD.datejour and date_pro_exam!=0 then
        update fiche_quotidienne set date_pro_exam = date_pro_exam -1;
        i:=i+1;
        end if
end;



date du jour incr: 
a faire dans peuplement, 
for i in 1..30
    (rempli la table patient)
    datejour:=i 
