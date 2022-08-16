CREATE DATABASE TWIG;
USE TWIG;
CREATE TABLE data (
    ID char(20) NOT NULL,
    `Red Active` int NULL,
    `Red Finished` int NULL,
    `Blue Active` int NULL,
    `Blue Finished` int NULL,
    `Green` int NULL,
    `Done` int NULL,
    `Blocked Days` int NULL
);

LOAD DATA INFILE '/tmp/twig.csv' INTO TABLE data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(ID,@ra,@rf,@ba,@bf,@g,@d,`Blocked Days`)
SET
`Red Active` = NULLIF(@ra, ''),
`Red Finished` = NULLIF(@rf, ''),
`Blue Active` = NULLIF(@ba, ''),
`Blue Finished` = NULLIF(@bf, ''),
`Green` = NULLIF(@g, ''),
`Done` = NULLIF(@d, '')
;