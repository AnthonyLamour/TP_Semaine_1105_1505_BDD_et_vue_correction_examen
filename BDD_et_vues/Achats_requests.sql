SELECT client, sum(tarif)
from ACHATS
group by client
HAVING sum(tarif)>= 40
order by client asc

SELECT client, sum(tarif) as PrixTotal
from ACHATS
group by client
HAVING PrixTotal>= 40
order by client asc

CREATE TABLE TotalClient
AS  
SELECT client, sum(tarif) as PrixTotal
from ACHATS
group by client
HAVING PrixTotal>= 40
order by client asc

SELECT sum(tarif) as PrixTotal, MONTH(date_achat)
from ACHATS
group by MONTH(date_achat)
order by MONTH(date_achat)

CREATE VIEW Total_Achats_Clients AS(
SELECT client, sum(tarif) as PrixTotal
from ACHATS
group by client
order by client asc)


SELECT * FROM Total_Achats_Clients

insert into ACHATS (client,tarif ,date_achat) 
values ('ALF',200,STR_TO_DATE("2012 October 28","%Y %M %d"));

SELECT client, PrixTotal
from Total_Achats_Clients
where PrixTotal>=40
group by client
order by client asc