CREATE OR REPLACE VIEW vw_cards_detalhados AS
SELECT 
    c.id,
    c.hp,
    c.name,
    c.info,
    c.attack,
    c.damage,
    c.weak,
    c.resistance,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionSetName AS collectionName,
    col.releaseDate AS collectionReleaseDate,
    col.totalCardsInCollection,
    t.typeName AS typeName,
    s.stageName AS stageName
FROM tbl_cards c
INNER JOIN tbl_collections col ON c.tablecollection_id = col.id
INNER JOIN tbl_types t ON c.typeid = t.id
INNER JOIN tbl_stages s ON c.stageid = s.id;

