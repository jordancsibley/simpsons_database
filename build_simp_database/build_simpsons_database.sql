-- create simpsons data base 

-- define characters table
CREATE TABLE characters(
    id INTEGER NOT NULL, 
    name VARCHAR, 
    normalized_name VARCHAR, 
    gender VARCHAR, 
    PRIMARY KEY (id)
);
-- insert data into characters table
INSERT INTO characters
SELECT id, name, normalized_name, gender
FROM read_csv_auto('/Users/jordansibley/Desktop/MEDS/EDS_213/section_database_proj/simpsons_database/data/characters_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1, NULLSTR = 'NA');


-- define locations table 
CREATE TABLE locations(
    id INTEGER NOT NULL,
    name VARCHAR,
    normalized_name VARCHAR,
    PRIMARY KEY (id)
);

-- insert data into locations table 
INSERT INTO locations
SELECT id, name, normalized_name
FROM read_csv_auto('/Users/jordansibley/Desktop/MEDS/EDS_213/section_database_proj/simpsons_database/data/locations_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1, NULLSTR = 'NA');

-- define episodes table 
CREATE TABLE episodes (
    id INTEGER NOT NULL,
    image_url VARCHAR,
    imdb_rating INTEGER,
    imdb_votes INTEGER,
    number_in_season INTEGER,
    number_in_series INTEGER,
    original_air_date DATE,
    production_code VARCHAR,
    season INTEGER,
    title VARCHAR,
    us_viewers_in_millions INTEGER,
    video_url VARCHAR,
    views INTEGER,
    PRIMARY KEY (id)
);

-- insert data into episodes table 
INSERT INTO episodes
SELECT id, image_url, imdb_rating, imdb_votes, number_in_season, number_in_series, original_air_date, production_code, season, title, us_viewers_in_millions, video_url, views
FROM read_csv_auto('/Users/jordansibley/Desktop/MEDS/EDS_213/section_database_proj/simpsons_database/data/episodes_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1, NULLSTR = 'NA');


-- define script_lines table with foreign keys
CREATE TABLE script_lines (
    id INTEGER NOT NULL,
    episode_id INTEGER NOT NULL,
    number INTEGER,
    raw_text VARCHAR,
    timestamp_in_ms INTEGER,
    speaking_line BOOLEAN,
    character_id INTEGER,
    location_id INTEGER,
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

-- insert data into script_lines table 
INSERT INTO script_lines
SELECT id, episode_id, number, raw_text, timestamp_in_ms, speaking_line, character_id, location_id, raw_character_text, raw_location_text, spoken_words, normalized_text, word_count
FROM read_csv_auto('/Users/jordansibley/Desktop/MEDS/EDS_213/section_database_proj/simpsons_database/data/script_lines_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1, NULLSTR = 'NA');

