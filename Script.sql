/*==============================================================*/
/* Table : ACTE_MEDICAL                                     	*/
/*==============================================================*/
create table ACTE_MEDICAL
(
   ID_ACTE          	INTEGER          	not null,
   NUM_ANONYMAT     	INTEGER          	not null,
   NOM_ACTE         	CHAR(50)         	not null,
   REGULARITE_ACTE  	SMALLINT         	not null,
   constraint PK_ACTE_MEDICAL primary key (ID_ACTE)
);

/*==============================================================*/
/* Index : RECEVOIR_FK                                      	*/
/*==============================================================*/
create index RECEVOIR_FK on ACTE_MEDICAL (
   NUM_ANONYMAT ASC
);

/*==============================================================*/
/* Table : AFFECTER                                         	*/
/*==============================================================*/
create table AFFECTER
(
   NUM_ADELI        	INTEGER          	not null,
   ID_CENTRE        	INTEGER          	not null,
   ID_ARC           	INTEGER          	not null,
   constraint PK_AFFECTER primary key (NUM_ADELI, ID_CENTRE, ID_ARC)
);

/*==============================================================*/
/* Index : AFFECTER_FK                                      	*/
/*==============================================================*/
create index AFFECTER_FK on AFFECTER (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : AFFECTER2_FK                                     	*/
/*==============================================================*/
create index AFFECTER2_FK on AFFECTER (
   ID_CENTRE ASC
);

/*==============================================================*/
/* Index : AFFECTER3_FK                                     	*/
/*==============================================================*/
create index AFFECTER3_FK on AFFECTER (
   ID_ARC ASC
);

/*==============================================================*/
/* Table : ANALYSE_COVID                                    	*/
/*==============================================================*/
create table ANALYSE_COVID
(
   ID_ANALYSE_COVID 	INTEGER          	not null,
   ID_FICHE         	INTEGER          	not null,
   NUM_ADELI        	INTEGER          	not null,
   RES_COVID_ANTIGENIQUE SMALLINT         	not null,
   RES_COVID_PCR    	SMALLINT         	not null,
   constraint PK_ANALYSE_COVID primary key (ID_ANALYSE_COVID)
);

/*==============================================================*/
/* Index : REALISERC_FK                                     	*/
/*==============================================================*/
create index REALISERC_FK on ANALYSE_COVID (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_16_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_16_FK on ANALYSE_COVID (
   ID_FICHE ASC
);

/*==============================================================*/
/* Table : ANALYSE_EEG                                      	*/
/*==============================================================*/
create table ANALYSE_EEG
(
   ID_ANALYSE_EEG   	INTEGER          	not null,
   ID_FICHE         	INTEGER,
   NUM_ADELI        	INTEGER          	not null,
   RES_ELECTRO      	INTEGER          	not null,
   constraint PK_ANALYSE_EEG primary key (ID_ANALYSE_EEG)
);

/*==============================================================*/
/* Index : REALISEREEG_FK                                   	*/
/*==============================================================*/
create index REALISEREEG_FK on ANALYSE_EEG (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_18_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_18_FK on ANALYSE_EEG (
   ID_FICHE ASC
);

/*==============================================================*/
/* Table : ANALYSE_EFFORT                                   	*/
/*==============================================================*/
create table ANALYSE_EFFORT
(
   ID_ANALYSE_EFFORT	INTEGER          	not null,
   ID_FICHE         	INTEGER,
   NUM_ADELI        	INTEGER          	not null,
   RYTHME_AV_EFFORT 	INTEGER          	not null,
   RYTHME_AP_EFFORT 	INTEGER          	not null,
   RYTHME_AV_REPOS  	INTEGER          	not null,
   constraint PK_ANALYSE_EFFORT primary key (ID_ANALYSE_EFFORT)
);

/*==============================================================*/
/* Index : REALISERE_FK                                     	*/
/*==============================================================*/
create index REALISERE_FK on ANALYSE_EFFORT (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_14_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_14_FK on ANALYSE_EFFORT (
   ID_FICHE ASC
);

/*==============================================================*/
/* Table : ANALYSE_SANG                                     	*/
/*==============================================================*/
create table ANALYSE_SANG
(
   ID_ANALYSE_SANG  	INTEGER          	not null,
   ID_FICHE         	INTEGER,
   NUM_ADELI        	INTEGER          	not null,
   C_CHOLESTEROL    	FLOAT            	not null,
   C_GLYCEMIE       	FLOAT            	not null,
   C_PLAQUETTE      	FLOAT            	not null,
   C_4              	FLOAT            	not null,
   C_5              	FLOAT            	not null,
   C_6              	FLOAT            	not null,
   RES_PRISE_SANG   	SMALLINT         	not null,
   constraint PK_ANALYSE_SANG primary key (ID_ANALYSE_SANG)
);

/*==============================================================*/
/* Index : REALISER_FK                                      	*/
/*==============================================================*/
create index REALISER_FK on ANALYSE_SANG (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_12_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_12_FK on ANALYSE_SANG (
   ID_FICHE ASC
);

/*==============================================================*/
/* Table : ARC                                              	*/
/*==============================================================*/
create table ARC
(
   ID_ARC           	INTEGER          	not null,
   NOM_ARC          	CHAR(50)         	not null,
   PRENOM_ARC       	CHAR(50)         	not null,
   constraint PK_ARC primary key (ID_ARC)
);

/*==============================================================*/
/* Table : CENTRE                                           	*/
/*==============================================================*/
create table CENTRE
(
   ID_CENTRE        	INTEGER          	not null,
   NOM_CENTRE       	CHAR(50)         	not null,
   SERVICE          	CHAR(50)         	not null,
   constraint PK_CENTRE primary key (ID_CENTRE)
);

/*==============================================================*/
/* Table : CONTRACTER                                       	*/
/*==============================================================*/
create table CONTRACTER
(
   NUM_ANONYMAT     	INTEGER          	not null,
   ID_PATHO         	INTEGER          	not null,
   constraint PK_CONTRACTER primary key (NUM_ANONYMAT, ID_PATHO)
);

/*==============================================================*/
/* Index : CONTRACTER_FK                                    	*/
/*==============================================================*/
create index CONTRACTER_FK on CONTRACTER (
   NUM_ANONYMAT ASC
);

/*==============================================================*/
/* Index : CONTRACTER2_FK                                   	*/
/*==============================================================*/
create index CONTRACTER2_FK on CONTRACTER (
   ID_PATHO ASC
);

/*==============================================================*/
/* Table : FICHE_QUOTIDIENNE                                	*/
/*==============================================================*/
create table FICHE_QUOTIDIENNE
(
   ID_FICHE         	INTEGER          	not null,
   ID_ANALYSE_EFFORT	INTEGER,
   NUM_ADELI        	INTEGER          	not null,
   ID_ANALYSE_EEG   	INTEGER,
   ID_ANALYSE_COVID 	INTEGER          	not null,
   NUM_ANONYMAT     	INTEGER          	not null,
   ID_ANALYSE_SANG  	INTEGER,
   ID_LOT           	INTEGER          	not null,
   POIDS            	FLOAT            	not null,
   PRESSION_ARTERIELLE  INTEGER          	not null,
   NUM_CHAMBRE      	INTEGER          	not null,
   RYTHME_CARDIAQUE 	INTEGER          	not null,
   TEMPERATURE      	INTEGER          	not null,
   NOM_EXAM         	CHAR(50)         	not null,
   OBSERVATIONS     	CHAR(50)         	not null,
   "DATE"           	INTEGER,
   MEDECIN_VERIF    	INTEGER,
   DATE_PRO_EXAM    	INTEGER,
   constraint PK_FICHE_QUOTIDIENNE primary key (ID_FICHE)
);

/*==============================================================*/
/* Index : POSSEDER_FK                                      	*/
/*==============================================================*/
create index POSSEDER_FK on FICHE_QUOTIDIENNE (
   NUM_ANONYMAT ASC
);

/*==============================================================*/
/* Index : VALIDER_FK                                       	*/
/*==============================================================*/
create index VALIDER_FK on FICHE_QUOTIDIENNE (
   NUM_ADELI ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_13_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_13_FK on FICHE_QUOTIDIENNE (
   ID_ANALYSE_SANG ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_15_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_15_FK on FICHE_QUOTIDIENNE (
   ID_ANALYSE_EFFORT ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_17_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_17_FK on FICHE_QUOTIDIENNE (
   ID_ANALYSE_COVID ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_19_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_19_FK on FICHE_QUOTIDIENNE (
   ID_ANALYSE_EEG ASC
);

/*==============================================================*/
/* Table : GROUPE                                           	*/
/*==============================================================*/
create table GROUPE
(
   ID_GRP           	INTEGER          	not null
  	constraint CKC_ID_GRP_GROUPE check (ID_GRP in (TP,VP,TV,PP)),
   ID_SSGRP         	NUMBER           	not null
  	constraint CKC_ID_SSGRP_GROUPE check (ID_SSGRP in (1,2,3)),
   NB_GRP           	INTEGER          	not null,
   NB_SSGRP         	INTEGER          	not null,
   constraint PK_GROUPE primary key (ID_GRP)
);

/*==============================================================*/
/* Table : MEDECIN___AUXILAIRE                              	*/
/*==============================================================*/
create table MEDECIN___AUXILAIRE
(
   NUM_ADELI        	INTEGER          	not null,
   SPECIALITE       	CHAR(50)         	not null,
   NOM_MEDECIN      	CHAR(50)         	not null,
   PRENOM_MEDECIN   	CHAR(50)         	not null,
   constraint PK_MEDECIN___AUXILAIRE primary key (NUM_ADELI)
);

/*==============================================================*/
/* Table : PATHOLOGIE                                       	*/
/*==============================================================*/
create table PATHOLOGIE
(
   ID_PATHO         	INTEGER          	not null,
   NOM_PATHO        	CHAR(50)         	not null,
   PATHO_RISQUE     	NUMBER           	not null
  	constraint CKC_PATHO_RISQUE_PATHOLOG check (PATHO_RISQUE in (0,1,2)),
   constraint PK_PATHOLOGIE primary key (ID_PATHO)
);

/*==============================================================*/
/* Table : PATIENT                                          	*/
/*==============================================================*/
create table PATIENT
(
   NUM_ANONYMAT     	INTEGER          	not null,
   ID_GRP           	INTEGER          	not null
  	constraint CKC_ID_GRP_PATIENT check (ID_GRP in (TP,VP,TV,PP)),
   ID_FICHE         	INTEGER          	not null,
   NOM_P            	CHAR(50)         	not null,
   PRENOM_P         	CHAR(50)         	not null,
   STATUT_PATHO     	SMALLINT         	not null,
   ID_GROUPE        	CHAR(50)       	 
  	constraint CKC_ID_GROUPE_PATIENT check (ID_GROUPE is null or (ID_GROUPE in ('TP','VP','TV','PP'))),
   ID_SOUS_GROUPE   	NUMBER         	 
  	constraint CKC_ID_SOUS_GROUPE_PATIENT check (ID_SOUS_GROUPE is null or (ID_SOUS_GROUPE in (1,2,3))),
   AGE_P            	NUMBER           	not null
  	constraint CKC_AGE_P_PATIENT check (AGE_P between 18 and 53),
   MED_REF          	INTEGER          	not null,
   constraint PK_PATIENT primary key (NUM_ANONYMAT)
);

/*==============================================================*/
/* Index : POSSEDER2_FK                                     	*/
/*==============================================================*/
create index POSSEDER2_FK on PATIENT (
   ID_FICHE ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_20_FK                                	*/
/*==============================================================*/
create index ASSOCIATION_20_FK on PATIENT (
   ID_GRP ASC
);

/*==============================================================*/
/* Table : TRAITEMENT                                       	*/
/*==============================================================*/
create table TRAITEMENT
(
   ID_TRAITEMENT    	INTEGER          	not null,
   NUM_ANONYMAT     	INTEGER          	not null,
   NOM_TRAITEMENT   	CHAR(50)         	not null,
   DUREE_TRAITEMENT 	INTEGER          	not null,
   constraint PK_TRAITEMENT primary key (ID_TRAITEMENT)
);

/*==============================================================*/
/* Index : TRAITER_FK                                       	*/
/*==============================================================*/
create index TRAITER_FK on TRAITEMENT (
   NUM_ANONYMAT ASC
);

alter table ACTE_MEDICAL
   add constraint FK_ACTE_MED_RECEVOIR_PATIENT foreign key (NUM_ANONYMAT)
  	references PATIENT (NUM_ANONYMAT);

alter table AFFECTER
   add constraint FK_AFFECTER_AFFECTER_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table AFFECTER
   add constraint FK_AFFECTER_AFFECTER2_CENTRE foreign key (ID_CENTRE)
  	references CENTRE (ID_CENTRE);

alter table AFFECTER
   add constraint FK_AFFECTER_AFFECTER3_ARC foreign key (ID_ARC)
  	references ARC (ID_ARC);

alter table ANALYSE_COVID
   add constraint FK_ANALYSE__ASSOCIATI_FICHE_QU foreign key (ID_FICHE)
  	references FICHE_QUOTIDIENNE (ID_FICHE);

alter table ANALYSE_COVID
   add constraint FK_ANALYSE__REALISERC_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table ANALYSE_EEG
   add constraint FK_ANALYSE__ASSOCIATI_FICHE_QU foreign key (ID_FICHE)
  	references FICHE_QUOTIDIENNE (ID_FICHE);

alter table ANALYSE_EEG
   add constraint FK_ANALYSE__REALISERE_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table ANALYSE_EFFORT
   add constraint FK_ANALYSE__ASSOCIATI_FICHE_QU foreign key (ID_FICHE)
  	references FICHE_QUOTIDIENNE (ID_FICHE);

alter table ANALYSE_EFFORT
   add constraint FK_ANALYSE__REALISERE_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table ANALYSE_SANG
   add constraint FK_ANALYSE__ASSOCIATI_FICHE_QU foreign key (ID_FICHE)
  	references FICHE_QUOTIDIENNE (ID_FICHE);

alter table ANALYSE_SANG
   add constraint FK_ANALYSE__REALISER_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table CONTRACTER
   add constraint FK_CONTRACT_CONTRACTE_PATIENT foreign key (NUM_ANONYMAT)
  	references PATIENT (NUM_ANONYMAT);

alter table CONTRACTER
   add constraint FK_CONTRACT_CONTRACTE_PATHOLOG foreign key (ID_PATHO)
  	references PATHOLOGIE (ID_PATHO);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_ASSOCIATI_ANALYSE_ foreign key (ID_ANALYSE_SANG)
  	references ANALYSE_SANG (ID_ANALYSE_SANG);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_ASSOCIATI_ANALYSE_ foreign key (ID_ANALYSE_EFFORT)
  	references ANALYSE_EFFORT (ID_ANALYSE_EFFORT);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_ASSOCIATI_ANALYSE_ foreign key (ID_ANALYSE_COVID)
  	references ANALYSE_COVID (ID_ANALYSE_COVID);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_ASSOCIATI_ANALYSE_ foreign key (ID_ANALYSE_EEG)
  	references ANALYSE_EEG (ID_ANALYSE_EEG);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_POSSEDER_PATIENT foreign key (NUM_ANONYMAT)
  	references PATIENT (NUM_ANONYMAT);

alter table FICHE_QUOTIDIENNE
   add constraint FK_FICHE_QU_VALIDER_MEDECIN_ foreign key (NUM_ADELI)
  	references MEDECIN___AUXILAIRE (NUM_ADELI);

alter table PATIENT
   add constraint FK_PATIENT_ASSOCIATI_GROUPE foreign key (ID_GRP)
  	references GROUPE (ID_GRP);

alter table PATIENT
   add constraint FK_PATIENT_POSSEDER2_FICHE_QU foreign key (ID_FICHE)
  	references FICHE_QUOTIDIENNE (ID_FICHE);

alter table TRAITEMENT
   add constraint FK_TRAITEME_TRAITER_PATIENT foreign key (NUM_ANONYMAT)
  	references PATIENT (NUM_ANONYMAT);