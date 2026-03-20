-- SCHEMA: flight_data

-- DROP SCHEMA IF EXISTS flight_data ;
CREATE SCHEMA IF NOT EXISTS flight_data
    AUTHORIZATION postgres;

CREATE TABLE flight_data.business_flight(
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

SELECT * FROM flight_data.business_flight LIMIT 10;