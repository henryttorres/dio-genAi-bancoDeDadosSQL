INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection)
VALUES 
('Base Set', '1999-01-09', 102),
('Jungle', '1999-06-16', 64),
('Fossil', '1999-10-10', 62);

INSERT INTO tbl_types (typeName)
VALUES 
('Fire'),
('Water'),
('Grass'),
('Electric'),
('Psychic'),
('Fighting'),
('Dark'),
('Steel'),
('Dragon'),
('Fairy');

INSERT INTO tbl_stages (stageName)
VALUES 
('Basic'),
('Stage 1'),
('Stage 2');

INSERT INTO tbl_cards 
(hp, name, info, attack, damage, weak, resistance, retreat, cardNumberInCollection, tablecollection_id, typeid, stageid)
VALUES
(60, 'Charmander', 'Lizard PokÃ©mon', 'Scratch', 10, 'Water', NULL, '1 Energy', 46, 1, 1, 1),
(100, 'Charmeleon', 'Flame PokÃ©mon', 'Flamethrower', 50, 'Water', NULL, '2 Energy', 24, 1, 1, 2),
(120, 'Charizard', 'Flame PokÃ©mon', 'Fire Spin', 100, 'Water', 'Fighting', '3 Energy', 4, 1, 1, 3),
(50, 'Bulbasaur', 'Seed PokÃ©mon', 'Vine Whip', 20, 'Fire', NULL, '1 Energy', 44, 1, 3, 1),
(80, 'Ivysaur', 'Seed PokÃ©mon', 'Razor Leaf', 30, 'Fire', NULL, '2 Energy', 30, 1, 3, 2),
(100, 'Venusaur', 'Seed PokÃ©mon', 'Solar Beam', 60, 'Fire', 'Water', '3 Energy', 15, 1, 3, 3),
(40, 'Pikachu', 'Mouse PokÃ©mon', 'Thunder Shock', 20, 'Fighting', 'Steel', '1 Energy', 58, 1, 4, 1),
(90, 'Raichu', 'Mouse PokÃ©mon', 'Thunder', 60, 'Fighting', 'Steel', '2 Energy', 14, 1, 4, 2);
