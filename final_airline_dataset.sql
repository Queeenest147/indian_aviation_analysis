CREATE TABLE flight_data.final_airline_dataset(
	flight_date DATE,
	airline_name TEXT,
	carrier_code TEXT,
	flight_number TEXT,
	departure_time TIME,
	arrival_time TIME, 
	departure_city TEXT,
	destination_city TEXT,
	duration_minutes INT,
	stops_count INT, 
	transit_city TEXT,
	price INT,
	airline_class TEXT
);


SELECT * FROM flight_data.final_airline_dataset;

INSERT INTO flight_data.final_airline_dataset(flight_date, airline_name, 
												carrier_code, flight_number,
												departure_time, arrival_time, departure_city,
												destination_city, duration_minutes,
												stops_count, transit_city, price,airline_class
											)
SELECT 	flight_date, airline_name, carrier_code, flight_number,
		departure_time, arrival_time, departure_city,destination_city, 
		duration_minutes,stops_count, transit_city, price,airline_class
FROM flight_data.economy_new 
UNION ALL 										
SELECT 	flight_date, airline_name, carrier_code, flight_number,
		departure_time, arrival_time, departure_city,destination_city, 
		duration_minutes,stops_count, transit_city, price,airline_class
FROM flight_data.business_new;


SELECT * FROM flight_data.final_airline_dataset;