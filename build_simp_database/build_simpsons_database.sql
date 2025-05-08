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

