Create schema EIAP;

DROP DATABASE IF EXISTS EIAP_DAT;
Create dbspace EIAP_DAT;

DROP TABLE IF EXISTS TECHNICIEN; 
Create table TECHNICIEN (NUM_TECHNICIEN	 int  not null,
			constraint TECHNICIENPK primary key (NUM_TECHNICIEN)
);

DROP TABLE IF EXISTS EQUIPEMENT; 
Create table EQUIPEMENT (NUM_EQUIPEMENT int  not null,
			       NOM_EQUIPEMENT char(20) not null,
			constraint EQUIPEMENTPK primary key (NUM_EQUIPEMENT) 
);

DROP TABLE IF EXISTS SITEDISTANT; 
Create table SITEDISTANT (NUM_SITE_DISTANT	 int  not null,
			constraint SITEDISTANTPK primary key (NUM_SITE_DISTANT) );

DROP TABLE IF EXISTS SITE; 
Create table SITE (NUM_SITE  int  not null,
		       NOM_SITE char(20) not null,
		       ADRESSE_SITE char(20) not null,
		       NOM_SIEGE char(20) not null,
		       NUM_EQUIPEMENT int not null,
		       NUM_DIRECTION int not null,
			constraint SITEPK primary key (NUM_SITE),
			constraint SITEFK foreign key (NOM_SIEGE) references SIEGE(NOM_SIEGE),
            constraint SITEFK2 foreign key (NUM_EQUIPEMENT) references EQUIPEMENT(NUM_EQUIPEMENT),
            constraint SITEFK3 foreign key (NUM_DIRECTION) references DIRECTION(NUM_DIRECTION));
            
DROP TABLE IF EXISTS SIEGE; 
Create table SIEGE (NOM_SIEGE  char(20)  not null,
		       NUM_SITE_DISTANT int not null,
		       NUM_SITE int not null,
			constraint SIEGEPK primary key (NOM_SIEGE),
			constraint SIEGEFK foreign key (NUM_SITE_DISTANT) references SITEDISTANT(NUM_SITE_DISTANT),
            constraint SIEGEFK2 foreign key (NUM_SITE) references SITE(NUM_SITE));

DROP TABLE IF EXISTS DIRECTION; 
Create table DIRECTION (NUM_DIRECTION  int  not null,
		       	  NOM_DIRECTION char(20) not null,
                  NUM_SITE int not null,
                  NUM_DEMANDEUR int not null,
			constraint DIRECTIONPK primary key (NUM_DIRECTION),
			constraint DIRECTIONFK foreign key (NUM_SITE) references SITE(NUM_SITE),
            constraint DIRECTIONFK2 foreign key (NUM_DEMANDEUR) references DEMANDEURINTERVENTION(NUM_DEMANDEUR));
            
DROP TABLE IF EXISTS SOUSDIRECTION; 
Create table SOUSDIRECTION (NUM_SOUS_DIRECTION  int  not null,
                NOM_SOUS_DIRECTION char(20) not null,
		      	NUM_TECHNICIEN int not null,
				NUM_DIRECTION int not null,
			constraint SOUSDIRECTIONPK primary key (NUM_SOUS_DIRECTION),
			constraint SOUSDIRECTIONFK foreign key (NUM_TECHNICIEN) references TECHNICIEN(NUM_TECHNICIEN),
            constraint SOUSDIRECTIONFK2 foreign key (NUM_DIRECTION) references DIRECTION(NUM_DIRECTION));

DROP TABLE IF EXISTS EMPLOYE; 
Create table EMPLOYE (NUM_EMPLOYE  int  not null,
		       NOM_EMPLOYE char(20) not null,
		       NUM_DEMANDEUR int not null,
		       NUM_TECHNICIEN int not null,
			constraint EMPLOYEPK primary key (NUM_EMPLOYE),
			constraint EMPLOYEFK foreign key (NUM_DEMANDEUR) references DEMANDEURINTERVENTION(NUM_DEMANDEUR),
            constraint EMPLOYEFK2 foreign key (NUM_TECHNICIEN) references TECHNICIEN(NUM_TECHNICIEN));

DROP TABLE IF EXISTS DEMANDEURINTERVENTION; 
Create table DEMANDEURINTERVENTION (NUM_DEMANDEUR  int  not null,
		       			     NUM_EMPLOYE int not null,
		       			     NUM_INTERVENTION int not null,
			constraint DEMANDEURINTERVENTIONPK primary key (NUM_DEMANDEUR),
			constraint DEMANDEURINTERVENTIONFK foreign key (NUM_EMPLOYE) references  EMPLOYE(NUM_EMPLOYE),
            constraint DEMANDEURFK2 foreign key (NUM_INTERVENTION) references INTERVENTION(NUM_INTERVENTION));

DROP TABLE IF EXISTS INTERVENTION; 
Create table INTERVENTION (NUM_INTERVENTION  int  not null,
		       	 	DESC_INTERVENTION char(50) not null,
		       		DATE_PREVUE date not null,
                    DATE_EFFECTIVE date not  null,
                    ETAT_INTERVENTION ENUM('traité', 'en cours','non traité') not null,
                    NUM_TECHNICIEN int not null,
			constraint INTERVENTIONPK primary key (NUM_INTERVENTION),
			constraint INTERVENTIONFK foreign key (NUM_TECHNICIEN) references TECHNICIEN(NUM_TECHNICIEN));

DROP TABLE IF EXISTS TYPEINTERVENTION; 
Create table TYPEINTERVENTION (NUM_TYPE  int  not null,
		       			NOM_TYPE char(20) not null,
		       			NUM_INTERVENTION int not null,
			constraint TYPEINTERVENTIONPK primary key (NUM_TYPE),
			constraint TYPEINTERVENTIONFK foreign key (NUM_INTERVENTION) references INTERVENTION(NUM_INTERVENTION));
