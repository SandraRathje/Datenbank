SELECT
ernaehrungskategorie.NAME AS "KATEGORIENAME",
    rezept.REZEPTNR,
    rezept.NAME,
    COUNT(rezept.REZEPTNR) AS "ZUTATENANZAHL"
FROM
    (
        (
            (
                rezeptzutat
            RIGHT JOIN rezept ON rezeptzutat.REZEPTNR = rezept.REZEPTNR
            )
        LEFT JOIN rezepternaehrungskategorie ON rezept.REZEPTNR = rezepternaehrungskategorie.REZEPTNR
        )
    LEFT JOIN ernaehrungskategorie ON ernaehrungskategorie.KATEGORIENR = rezepternaehrungskategorie.KATEGORIENR
    )
WHERE
    ernaehrungskategorie.NAME = 'Vegetarisch'
GROUP BY
    rezeptzutat.REZEPTNR
HAVING
    Zutatenanzahl < 5;