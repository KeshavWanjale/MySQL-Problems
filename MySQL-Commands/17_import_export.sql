Create Database ImportExport;
Use ImportExport;

Create Table StatewiseTestingDetails(
Date date,
State varchar(200),
TotalSamples int,
Negative int,
Positive int
);

drop table StatewiseTestingDetails;
insert into StatewiseTestingDetails
values('2020-04-17','Andaman and Nicobar Islands',1403,1210,12);

select @@secure_file_priv;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true;


-- Importing Data from a CSV File
LOAD DATA INFILE 'C:\\StatewiseTestingDetails.csv'
INTO TABLE StatewiseTestingDetails
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from StatewiseTestingDetails;

SELECT * INTO OUTFILE 'D:\\BridgLabz Taining\\CFP-Apexon-Deeptech\\Git-Repos\\MySQL-Problems\\MySQL-Commands\\import_covid4.csv'
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM StatewiseTestingDetails;

