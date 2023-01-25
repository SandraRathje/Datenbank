SELECT
    bestellung.KUNDENNR,
    AVG(zutat.KALORIEN) AS "Kalorien",
    AVG(zutat.KOHLENHYDRATE) AS "Kohlenhydrate",
    AVG(zutat.PROTEIN) AS "Proteine"
FROM
    bestellung
INNER JOIN bestellungrezept ON bestellung.BESTELLNR = bestellungrezept.BESTELLNR
INNER JOIN rezept ON bestellungrezept.REZEPTNR = rezept.REZEPTNR
INNER JOIN rezeptzutat ON rezept.REZEPTNR = rezeptzutat.REZEPTNR
INNER JOIN zutat ON rezeptzutat.ZUTATENNR = zutat.ZUTATENNR
WHERE
    bestellung.KUNDENNR = '2001';