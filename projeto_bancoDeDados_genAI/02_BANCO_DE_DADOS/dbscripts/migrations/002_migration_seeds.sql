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
(60, 'Charmander', 'Lizard PokÃƒÂ©mon', 'Scratch', 10, 'Water', NULL, '1 Energy', 46, 1, 1, 1),
(100, 'Charmeleon', 'Flame PokÃƒÂ©mon', 'Flamethrower', 50, 'Water', NULL, '2 Energy', 24, 1, 1, 2),
(120, 'Charizard', 'Flame PokÃƒÂ©mon', 'Fire Spin', 100, 'Water', 'Fighting', '3 Energy', 4, 1, 1, 3),
(50, 'Bulbasaur', 'Seed PokÃƒÂ©mon', 'Vine Whip', 20, 'Fire', NULL, '1 Energy', 44, 1, 3, 1),
(80, 'Ivysaur', 'Seed PokÃƒÂ©mon', 'Razor Leaf', 30, 'Fire', NULL, '2 Energy', 30, 1, 3, 2),
(100, 'Venusaur', 'Seed PokÃƒÂ©mon', 'Solar Beam', 60, 'Fire', 'Water', '3 Energy', 15, 1, 3, 3),
(40, 'Pikachu', 'Mouse PokÃƒÂ©mon', 'Thunder Shock', 20, 'Fighting', 'Steel', '1 Energy', 58, 1, 4, 1),
(90, 'Raichu', 'Mouse PokÃƒÂ©mon', 'Thunder', 60, 'Fighting', 'Steel', '2 Energy', 14, 1, 4, 2);
GO
INSERT INTO tbl_cards 
(hp, name, info, attack, damage, weak, resistance, retreat, cardNumberInCollection, tablecollection_id, typeid, stageid)
VALUES
(60, 'Charmander', 'Lizard PokÃƒÂ©mon', 'Scratch', 10, 'Water', NULL, '1 Energy', 46, 1, 1, 1),
(100, 'Charmeleon', 'Flame PokÃƒÂ©mon', 'Flamethrower', 50, 'Water', NULL, '2 Energy', 24, 1, 1, 2),
(120, 'Charizard', 'Flame PokÃƒÂ©mon', 'Fire Spin', 100, 'Water', 'Fighting', '3 Energy', 4, 1, 1, 3),
(50, 'Bulbasaur', 'Seed PokÃƒÂ©mon', 'Vine Whip', 20, 'Fire', NULL, '1 Energy', 44, 1, 3, 1),
(80, 'Ivysaur', 'Seed PokÃƒÂ©mon', 'Razor Leaf', 30, 'Fire', NULL, '2 Energy', 30, 1, 3, 2),
(100, 'Venusaur', 'Seed PokÃƒÂ©mon', 'Solar Beam', 60, 'Fire', 'Water', '3 Energy', 15, 1, 3, 3),
(40, 'Pikachu', 'Mouse PokÃƒÂ©mon', 'Thunder Shock', 20, 'Fighting', 'Steel', '1 Energy', 58, 1, 4, 1),
(90, 'Raichu', 'Mouse PokÃƒÂ©mon', 'Thunder', 60, 'Fighting', 'Steel', '2 Energy', 14, 1, 4, 2),
(60, 'Squirtle', 'Tiny Turtle PokÃƒÂ©mon', 'Bubble', 20, 'Electric', NULL, '1 Energy', 7, 1, 2, 1),
(90, 'Wartortle', 'Turtle PokÃƒÂ©mon', 'Water Gun', 40, 'Electric', NULL, '2 Energy', 42, 1, 2, 2),
(120, 'Blastoise', 'Shellfish PokÃƒÂ©mon', 'Hydro Pump', 60, 'Electric', 'Steel', '3 Energy', 2, 1, 2, 3),
(70, 'Gastly', 'Gas PokÃƒÂ©mon', 'Lick', 10, 'Psychic', NULL, '1 Energy', 33, 1, 5, 1),
(90, 'Haunter', 'Gas PokÃƒÂ©mon', 'Nightmare', 30, 'Psychic', NULL, '2 Energy', 29, 1, 5, 2),
(130, 'Gengar', 'Shadow PokÃƒÂ©mon', 'Dark Mind', 60, 'Psychic', 'Fighting', '3 Energy', 5, 1, 5, 3),
(60, 'Machop', 'Superpower PokÃƒÂ©mon', 'Karate Chop', 20, 'Psychic', NULL, '1 Energy', 52, 1, 6, 1),
(90, 'Machoke', 'Superpower PokÃƒÂ©mon', 'Submission', 50, 'Psychic', NULL, '2 Energy', 34, 1, 6, 2),
(130, 'Machamp', 'Superpower PokÃƒÂ©mon', 'Seismic Toss', 60, 'Psychic', 'Steel', '3 Energy', 8, 1, 6, 3),
(70, 'Abra', 'Psi PokÃƒÂ©mon', 'Psyshock', 20, 'Psychic', NULL, '1 Energy', 63, 1, 5, 1),
(90, 'Kadabra', 'Psi PokÃƒÂ©mon', 'Recover', 30, 'Psychic', NULL, '2 Energy', 50, 1, 5, 2),
(120, 'Alakazam', 'Psi PokÃƒÂ©mon', 'Confuse Ray', 50, 'Psychic', 'Fighting', '3 Energy', 1, 1, 5, 3);
GO
INSERT INTO tbl_cards 
(hp, name, info, attack, damage, weak, resistance, retreat, cardNumberInCollection, tablecollection_id, typeid, stageid)
VALUES
(70, 'Scyther', 'Mantis PokÃƒÂ©mon', 'Slash', 30, 'Fire', NULL, '1 Energy', 10, 2, 3, 1),
(90, 'Pinsir', 'Stag Beetle PokÃƒÂ©mon', 'Guillotine', 50, 'Fire', NULL, '2 Energy', 6, 2, 6, 1),
(80, 'Electrode', 'Ball PokÃƒÂ©mon', 'Explosion', 60, 'Fighting', 'Steel', '1 Energy', 2, 2, 4, 2),
(100, 'Snorlax', 'Sleeping PokÃƒÂ©mon', 'Body Slam', 30, 'Fighting', NULL, '4 Energy', 11, 2, 6, 1),
(60, 'Jigglypuff', 'Balloon PokÃƒÂ©mon', 'Sing', 10, 'Steel', NULL, '1 Energy', 54, 2, 10, 1),
(90, 'Wigglytuff', 'Balloon PokÃƒÂ©mon', 'Do the Wave', 60, 'Steel', NULL, '2 Energy', 32, 2, 10, 2),
(70, 'Kangaskhan', 'Parent PokÃƒÂ©mon', 'Comet Punch', 20, 'Fighting', NULL, '3 Energy', 5, 2, 6, 1),
(60, 'Meowth', 'Scratch Cat PokÃƒÂ©mon', 'Pay Day', 20, 'Fighting', NULL, '1 Energy', 56, 2, 6, 1),
(90, 'Persian', 'Classy Cat PokÃƒÂ©mon', 'Scratch', 30, 'Fighting', NULL, '2 Energy', 36, 2, 6, 2),
(80, 'Butterfree', 'Butterfly PokÃƒÂ©mon', 'Whirlwind', 30, 'Fire', NULL, '1 Energy', 33, 2, 3, 2),
(60, 'Zubat', 'Bat PokÃƒÂ©mon', 'Leech Life', 20, 'Electric', NULL, '1 Energy', 40, 3, 6, 1),
(80, 'Golbat', 'Bat PokÃƒÂ©mon', 'Wing Attack', 30, 'Electric', NULL, '2 Energy', 21, 3, 6, 2),
(120, 'Muk', 'Sludge PokÃƒÂ©mon', 'Sludge', 60, 'Psychic', NULL, '3 Energy', 13, 3, 5, 2),
(100, 'Kabutops', 'Shellfish PokÃƒÂ©mon', 'Slash', 50, 'Grass', NULL, '2 Energy', 9, 3, 6, 2),
(110, 'Aerodactyl', 'Fossil PokÃƒÂ©mon', 'Wing Attack', 30, 'Electric', NULL, '2 Energy', 1, 3, 6, 1),
(90, 'Lapras', 'Transport PokÃƒÂ©mon', 'Water Gun', 30, 'Electric', NULL, '2 Energy', 20, 3, 2, 1),
(70, 'Omanyte', 'Spiral PokÃƒÂ©mon', 'Water Gun', 20, 'Grass', NULL, '1 Energy', 44, 3, 2, 1),
(100, 'Omastar', 'Spiral PokÃƒÂ©mon', 'Hydro Pump', 40, 'Grass', NULL, '2 Energy', 26, 3, 2, 2),
(80, 'Hypno', 'Hypnosis PokÃƒÂ©mon', 'Prophecy', 30, 'Psychic', NULL, '2 Energy', 8, 3, 5, 2),
(120, 'Dragonite', 'Dragon PokÃƒÂ©mon', 'Slam', 60, 'Fairy', 'Steel', '3 Energy', 4, 3, 9, 3);
GO
INSERT INTO tbl_cards 
(hp, name, info, attack, damage, weak, resistance, retreat, cardNumberInCollection, tablecollection_id, typeid, stageid)
VALUES
(130, 'Mewtwo', 'Genetic PokÃƒÂ©mon', 'Psychic', 60, 'Psychic', NULL, '3 Energy', 10, 1, 5, 1),
(120, 'Articuno', 'Freeze PokÃƒÂ©mon', 'Ice Beam', 50, 'Steel', NULL, '2 Energy', 2, 3, 2, 1),
(120, 'Zapdos', 'Electric PokÃƒÂ©mon', 'Thunderstorm', 60, 'Fighting', 'Steel', '3 Energy', 15, 1, 4, 1),
(120, 'Moltres', 'Flame PokÃƒÂ©mon', 'Fire Blast', 60, 'Water', NULL, '3 Energy', 12, 3, 1, 1),
(150, 'Dragonite', 'Dragon PokÃƒÂ©mon', 'Hyper Beam', 70, 'Fairy', 'Steel', '3 Energy', 4, 3, 9, 3),
(130, 'Gyarados', 'Atrocious PokÃƒÂ©mon', 'Dragon Rage', 50, 'Electric', NULL, '3 Energy', 6, 1, 2, 2),
(120, 'Lapras', 'Transport PokÃƒÂ©mon', 'Water Gun', 40, 'Electric', NULL, '2 Energy', 20, 3, 2, 1),
(110, 'Kabutops', 'Shellfish PokÃƒÂ©mon', 'Slash', 50, 'Grass', NULL, '2 Energy', 9, 3, 6, 2),
(110, 'Aerodactyl', 'Fossil PokÃƒÂ©mon', 'Wing Attack', 40, 'Electric', NULL, '2 Energy', 1, 3, 6, 1),
(100, 'Hitmonchan', 'Punching PokÃƒÂ©mon', 'Special Punch', 40, 'Psychic', NULL, '2 Energy', 7, 1, 6, 1),
(100, 'Hitmonlee', 'Kicking PokÃƒÂ©mon', 'Stretch Kick', 50, 'Psychic', NULL, '2 Energy', 8, 2, 6, 1),
(120, 'Snorlax', 'Sleeping PokÃƒÂ©mon', 'Body Slam', 30, 'Fighting', NULL, '4 Energy', 11, 2, 6, 1),
(100, 'Electrode', 'Ball PokÃƒÂ©mon', 'Explosion', 60, 'Fighting', 'Steel', '1 Energy', 2, 2, 4, 2),
(90, 'Jolteon', 'Lightning PokÃƒÂ©mon', 'Thunderbolt', 60, 'Fighting', 'Steel', '2 Energy', 4, 2, 4, 2),
(90, 'Flareon', 'Flame PokÃƒÂ©mon', 'Flamethrower', 60, 'Water', NULL, '2 Energy', 3, 2, 1, 2),
(90, 'Vaporeon', 'Bubble Jet PokÃƒÂ©mon', 'Water Gun', 40, 'Electric', NULL, '2 Energy', 12, 2, 2, 2),
(120, 'Chansey', 'Egg PokÃƒÂ©mon', 'Double-Edge', 80, 'Fighting', NULL, '1 Energy', 3, 1, 10, 1),
(100, 'Clefable', 'Fairy PokÃƒÂ©mon', 'Metronome', 40, 'Steel', NULL, '2 Energy', 5, 2, 10, 2),
(90, 'Wigglytuff', 'Balloon PokÃƒÂ©mon', 'Do the Wave', 60, 'Steel', NULL, '2 Energy', 32, 2, 10, 2),
(100, 'Scyther', 'Mantis PokÃƒÂ©mon', 'Slash', 30, 'Fire', NULL, '1 Energy', 10, 2, 3, 1),
(110, 'Pinsir', 'Stag Beetle PokÃƒÂ©mon', 'Guillotine', 50, 'Fire', NULL, '2 Energy', 6, 2, 6, 1),
(120, 'Muk', 'Sludge PokÃƒÂ©mon', 'Sludge', 60, 'Psychic', NULL, '3 Energy', 13, 3, 5, 2),
(100, 'Hypno', 'Hypnosis PokÃƒÂ©mon', 'Prophecy', 30, 'Psychic', NULL, '2 Energy', 8, 3, 5, 2),
(130, 'Gengar', 'Shadow PokÃƒÂ©mon', 'Dark Mind', 60, 'Psychic', 'Fighting', '3 Energy', 5, 1, 5, 3),
(120, 'Alakazam', 'Psi PokÃƒÂ©mon', 'Confuse Ray', 50, 'Psychic', 'Fighting', '3 Energy', 1, 1, 5, 3),
(110, 'Machamp', 'Superpower PokÃƒÂ©mon', 'Seismic Toss', 60, 'Psychic', 'Steel', '3 Energy', 8, 1, 6, 3),
(120, 'Nidoking', 'Drill PokÃƒÂ©mon', 'Thrash', 60, 'Psychic', NULL, '3 Energy', 11, 1, 6, 3),
(120, 'Nidoqueen', 'Drill PokÃƒÂ©mon', 'Mega Punch', 50, 'Psychic', NULL, '3 Energy', 12, 1, 6, 3),
(100, 'Rhydon', 'Drill PokÃƒÂ©mon', 'Horn Attack', 50, 'Grass', NULL, '3 Energy', 20, 2, 6, 2),
(120, 'Magneton', 'Magnet PokÃƒÂ©mon', 'Thunder Wave', 40, 'Fighting', 'Steel', '2 Energy', 9, 1, 4, 2);
GO

