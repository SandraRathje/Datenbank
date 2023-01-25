SELECT
    ernaehrungskategorie.KATEGORIENR,
    ernaehrungskategorie.NAME,
    rezept.REZEPTNR,
    rezept.NAME
FROM
    (
        (
            ernaehrungskategorie
        LEFT JOIN rezepternaehrungskategorie ON ernaehrungskategorie.KATEGORIENR = rezepternaehrungskategorie.KATEGORIENR
        )
    LEFT JOIN rezept ON rezepternaehrungskategorie.REZEPTNR = rezept.REZEPTNR
    )
WHERE
    ernaehrungskategorie.NAME = 'Vegan';