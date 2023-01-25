SELECT
    rezept.REZEPTNR,
    rezept.NAME,
    SUM(zutat.CO2) AS "CO2"
FROM
    rezept
INNER JOIN rezeptzutat ON rezept.REZEPTNR = rezeptzutat.REZEPTNR
INNER JOIN zutat ON rezeptzutat.ZUTATENNR = zutat.ZUTATENNR
GROUP BY rezept.REZEPTNR
HAVING CO2 <=400;