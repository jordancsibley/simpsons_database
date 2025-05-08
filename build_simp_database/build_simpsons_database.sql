-- create simpsons data base 

-- define characters table
CREATE TABLE characters(
    id INTEGER NOT NULL, 
    name VARCHAR, 
    normalized_name VARCHAR, 
    gender VARCHAR, 
    PRIMARY KEY (id)
);

-- define locations table 
CREATE TABLE locations(
    id INTEGER NOT NULL,
    name VARCHAR,
    normalized_name VARCHAR,
    PRIMARY KEY (id)
);

-- define episodes table 
CREATE TABLE episodes (
    id INTEGER NOT NULL,
    image_url VARCHAR,
    imbd_rating INTEGER,
    imbd_votes INTEGER,
    number_in_season INTEGER,
    number_in_series INTEGER,
    original_air_date DATE,
    production_code VARCHAR,
    season INTEGER,
    title VARCHAR,
    us_viewers_in_millions INTEGER,
    video_url VARCHAR,
    view INTEGER,
    PRIMARY KEY (id)
);

-- define script_lines table with foreign keys
CREATE TABLE script_lines (
    id INTEGER NOT NULL,
    episode_id INTEGER NOT NULL,
    number INTEGER,
    raw_text VARCHAR,
    timestamp_in_ms INTEGER,
    speaking_line BOOLEAN,
    character_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    raw_character_text VARCHAR,
    raw_location_text VARCHAR,
    spoken_words VARCHAR,
    normalized_text VARCHAR,
    word_count INTEGER,
    PRIMARY KEY (id),

    -- foreign key constraints
    FOREIGN KEY (character_id) REFERENCES characters(id),
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id)
);

-- add data files into database
COPY characters FROM 'data/characters_clean.csv' (header TRUE, DELIM ',');
COPY locations FROM 'data/simpsons_locations.csv' (header TRUE, DELIM ',');
COPY episodes FROM 'data/simpsons_locations.csv' (header TRUE, DELIM ',');
COPY script_lines FROM 'data/simpsons_script_lines.csv' (header TRUE, DELIM ',');