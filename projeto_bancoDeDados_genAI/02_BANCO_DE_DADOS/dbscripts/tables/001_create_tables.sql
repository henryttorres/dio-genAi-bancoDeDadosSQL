CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collectionSetName VARCHAR(100) NOT NULL,
    releaseDate DATE NOT NULL,
    totalCardsInCollection SMALLINT NOT NULL
);

CREATE TABLE tbl_types (
    id SERIAL PRIMARY KEY,
    typeName VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stageName VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    hp SMALLINT,
    name VARCHAR(80) NOT NULL,
    info TEXT,
    attack VARCHAR(80),
    damage SMALLINT,
    weak VARCHAR(30),
    resistance VARCHAR(30),
    retreat VARCHAR(20),
    cardNumberInCollection SMALLINT,
    tablecollection_id INT NOT NULL,
    typeid INT NOT NULL,
    stageid INT NOT NULL,
    CONSTRAINT fk_collection
        FOREIGN KEY (tablecollection_id)
        REFERENCES tbl_collections (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_type
        FOREIGN KEY (typeid)
        REFERENCES tbl_types (id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_stage
        FOREIGN KEY (stageid)
        REFERENCES tbl_stages (id)
        ON DELETE RESTRICT
);

