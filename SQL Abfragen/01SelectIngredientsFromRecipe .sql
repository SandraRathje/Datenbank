﻿SELECT REZEPT.NAME, ZUTAT.BEZEICHNUNG 
FROM REZEPT
INNER JOIN REZEPTZUTAT ON REZEPT.REZEPTNR = REZEPTZUTAT.REZEPTNR
INNER JOIN ZUTAT ON REZEPTZUTAT.ZUTATENNR = ZUTAT.ZUTATENNR
WHERE REZEPT.NAME = 'Bratkartoffeln';