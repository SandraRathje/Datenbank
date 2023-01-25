SELECT
    kunde.*, bestellung.BESTELLNR,bestellung.BESTELLDATUM, bestellung.RECHNUNGSBETRAG
FROM
    kunde
INNER JOIN bestellung ON kunde.KUNDENNR = bestellung.KUNDENNR
WHERE
    kunde.KUNDENNR = '2007';