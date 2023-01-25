SELECT
    rezept.REZEPTNR,
    rezept.NAME,
    SUM(zutat.KALORIEN) AS "Kalorien"
FROM
    rezept
INNER JOIN rezeptzutat ON rezept.REZEPTNR = rezeptzutat.REZEPTNR
INNER JOIN zutat ON rezeptzutat.ZUTATENNR = zutat.ZUTATENNR
GROUP BY rezept.REZEPTNR
HAVING Kalorien <=300;