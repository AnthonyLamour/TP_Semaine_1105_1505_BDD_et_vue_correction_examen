Create schema ACHATS_TP;

Create dbspace ACH_TP;

DROP TABLE IF EXISTS ACHATS; 

Create table ACHATS(ID 	        int not null AUTO_INCREMENT,
					CLIENT 	    char(40) not null,
					TARIF       float not null,
					DATE_ACHAT  date not null,
				constraint ACHATSPK primary key (ID));