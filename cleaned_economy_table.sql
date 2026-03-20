CREATE TABLE flight_data.economy_cleaned(
	"date" TEXT,
	airline TEXT,
	ch_code TEXT,
	num_code TEXT,
	dep_time TEXT,
	"from" TEXT,
	time_taken TEXT,
	stop TEXT,
	arr_time TEXT,
	"to" TEXT,
	price TEXT
);

INSERT INTO flight_data.economy_cleaned("date", airline, ch_code, 
										num_code, dep_time, "from", 
										time_taken, stop, arr_time, 
										"to", price)
SELECT "date", airline, ch_code, num_code, dep_time, "from", 
		time_taken, stop, arr_time,"to", price
FROM flight_data.economy_flight;
									
SELECT * FROM flight_data.economy_cleaned; 

-- date column
ALTER TABLE flight_data.economy_cleaned
ALTER COLUMN date TYPE DATE
USING TO_DATE("date", 'DD-MM-YYYY');

ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN "date" TO "flight_date";

-- airline column
ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN airline TO "airline_name";

-- ch_code
ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN ch_code TO "carrier_code";

-- num_code column
ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN num_code TO "flight_number";

-- dep_time column

ALTER TABLE flight_data.economy_cleaned
ALTER COLUMN dep_time TYPE TIME
USING dep_time ::TIME;

ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN dep_time TO "departure_time";

-- from column
ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN "from" TO "departure_city";

-- arr_time column 
ALTER TABLE flight_data.economy_cleaned
ALTER COLUMN arr_time TYPE TIME
USING arr_time ::TIME;

ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN arr_time TO arrival_time;

-- to column
ALTER TABLE flight_data.economy_cleaned
RENAME COLUMN "to" TO destination_city;


-- creating new column duration_minutes
ALTER TABLE flight_data.economy_cleaned
ADD COLUMN duration_minutes INT;

-- formatting the duration_minutes column 
UPDATE flight_data.economy_cleaned 
SET duration_minutes =
(
    SPLIT_PART(time_taken,'h',1)::NUMERIC * 60
)
+
COALESCE(
    NULLIF(REPLACE(SPLIT_PART(time_taken,' ',2),'m',''),'')::INT,
    0
);

-- ALterign the stops count column

ALTER TABLE flight_data.economy_cleaned
ADD COLUMN stops_count INT;

UPDATE flight_data.economy_cleaned
SET stops_count =
CASE
    WHEN stop = 'non-stop' THEN 0
    WHEN stop LIKE '1-stop%' THEN 1
    WHEN stop LIKE '2+%' THEN 2
    ELSE NULL
END;

ALTER TABLE flight_data.economy_cleaned
ADD COLUMN transit_city VARCHAR(20);

UPDATE flight_data.economy_cleaned
SET transit_city = 
(
	CASE WHEN stop LIKE '%Via %' 
		THEN SPLIT_PART(stop, ' Via', 2)
		ELSE NULL
	END
);

ALTER TABLE flight_data.economy_new
ADD COLUMN airline_class TEXT;

UPDATE flight_data.economy_new
SET airline_class = 'Economy';

-- Checking for dulicates 
CREATE TABLE flight_data.economy_new AS
SELECT DISTINCT ON (departure_city, destination_city, departure_time)
       *
FROM flight_data.economy_cleaned
ORDER BY departure_city, destination_city, departure_time, price ASC;

-- Checking for missing Values 
SELECT * FROM flight_data.economy_new
WHERE price IS NULL;



SELECT * FROM flight_data.economy_new LIMIT 10;