--- Search two --- 
-- search for:
-- evolutionary game theory, 
-- emergence of cooperation and 
-- evolution of cooperation in
-- Keywords, Titles and Abstracts. Get references.

-- A total of 27 tables are created of which not all are immediately needed.
-- Executing query might take ~ 5 minutes.
-- Main focus on the 9 refs tables for the citing articles.

-- Ensure the data type structure of the column "abstract" is as assumed.
SELECT abstract[1] FROM wos_b_202210.abstracts;

-- Create tables for the search results of the three keywords in the three different fields.
CREATE TABLE evolgath AS
SELECT *
FROM wos_b_202210.items
WHERE EXISTS (
  SELECT *
  FROM unnest(wos_b_202210.items.keyword) n
  WHERE n LIKE 'evolutionary game theory%'
);

CREATE TABLE evolgath_titles AS
SELECT *
FROM wos_b_202210.items
WHERE item_title LIKE '%evolutionary game theory%';

CREATE TABLE evolgath_abstract AS
SELECT *
FROM wos_b_202210.abstracts
WHERE abstract[1] LIKE '%evolutionary game theory%';
-----------------------------------------------
CREATE TABLE evolcoop
AS
SELECT *
FROM wos_b_202210.items
WHERE EXISTS (
  SELECT *
  FROM unnest(wos_b_202210.items.keyword) n
  WHERE n LIKE 'evolution of cooperation%'
);

CREATE TABLE evolcoop_titles AS
SELECT *
FROM wos_b_202210.items
WHERE item_title LIKE '%evolution of cooperation%';

CREATE TABLE evolcoop_abstract AS
SELECT *
FROM wos_b_202210.abstracts
WHERE abstract[1] LIKE '%evolution of cooperation%';
-----------------------------------------------
CREATE TABLE emcoop AS
SELECT *
FROM wos_b_202210.items
WHERE EXISTS (
  SELECT *
  FROM unnest(wos_b_202210.items.keyword) n
  WHERE n LIKE 'emergence of cooperation%'
);

CREATE TABLE emcoop_titles AS
SELECT *
FROM wos_b_202210.items
WHERE item_title LIKE '%emergence of cooperation%';

CREATE TABLE emcoop_abstract AS
SELECT *
FROM wos_b_202210.abstracts
WHERE abstract[1] LIKE '%emergence of cooperation%';

-- Retrieval of abstracts for the finds in Keywords (3 tables), Titles (3 tables).
-- Needed for later analysis. 
-- Abstracts (3 tables) obviously already have the abstracts, later step vice versa gets their meta data.

CREATE TABLE emcoop_kw_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM emcoop
);

CREATE TABLE evolcoop_kw_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM evolcoop
);

CREATE TABLE evolgath_kw_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM evolgath
);

CREATE TABLE emcoop_titles_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM emcoop_titles
);

CREATE TABLE evolcoop_titles_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM evolcoop_titles
);

CREATE TABLE evolgath_titles_abstracts AS
SELECT *
FROM wos_b_202210.abstracts
WHERE item_id IN (
    SELECT item_id
    FROM evolgath_titles
);

-- Meta Data in wos_b_202210.items of finds in abstracts (3 tables) is retrieved.
CREATE TABLE evolgath_items_ab AS
SELECT *
FROM wos_b_202210.items
WHERE item_id IN (
    SELECT item_id
    FROM evolgath_abstract
);

CREATE TABLE evolcoop_items_ab AS
SELECT *
FROM wos_b_202210.items
WHERE item_id IN (
    SELECT item_id
    FROM evolcoop_abstract
);

CREATE TABLE emcoop_items_ab AS
SELECT *
FROM wos_b_202210.items
WHERE item_id IN (
    SELECT item_id
    FROM emcoop_abstract
);

-- The following steps are the same for evolgath, emcoop, and evolcoop 
-- and create 9 tables for the corrersponding references of the citing articles.

-- Create refs table for evolgath
CREATE TABLE refs_evolgath AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolgath
);

-- Create refs table for evolgath_titles
CREATE TABLE refs_evolgath_titles AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolgath_titles
);

-- Create refs table
CREATE TABLE refs_evolgath_ab AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolgath_abstract
);

-- Create refs table for emcoop
CREATE TABLE refs_emcoop AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM emcoop
);

-- Create refs table for emcoop_titles
CREATE TABLE refs_emcoop_titles AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM emcoop_titles
);

-- Create refs table for emcoop_abstract_items
CREATE TABLE refs_emcoop_ab AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM emcoop_abstract
);

-- Create refs table for evolcoop
CREATE TABLE refs_evolcoop AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolcoop
);

-- Create refs table for evolcoop_titles
CREATE TABLE refs_evolcoop_titles AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolcoop_titles
);

-- Create refs table for evolcoop_abstract_items
CREATE TABLE refs_evolcoop_ab AS
SELECT *
FROM wos_b_202210.refs
WHERE item_id_citing IN (
    SELECT item_id
    FROM evolcoop_abstract
);