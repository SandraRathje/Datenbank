SELECT
    rezept.REZEPTNR,
    rezept.NAME,
    COUNT(rezept.REZEPTNR) AS "Zutatenanzahl"
FROM
    rezeptzutat
RIGHT JOIN rezept ON rezeptzutat.REZEPTNR = rezept.REZEPTNR
GROUP BY
    rezeptzutat.REZEPTNR
HAVING
    Zutatenanzahl < 5;