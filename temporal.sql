SET datestyle TO 'MDY';

CREATE database PECL2;

CREATE SCHEMA IF NOT EXISTS temporal;

CREATE SCHEMA IF NOT EXISTS final;

CREATE TABLE IF NOT EXISTS temporal.temp_accidentes(
    crash_date TEXT,
    crash_time TEXT,
    borough TEXT,
    zip_code TEXT,
    latitude TEXT,
    longitude TEXT,
    location TEXT,
    on_street_name TEXT,
    cross_street_name TEXT,
    off_street_name TEXT,
    number_of_persons_injured TEXT,
    number_of_persons_killed TEXT,
    number_of_pedestrians_injured TEXT,
    number_of_pedestrians_killed TEXT,
    number_of_cyclists_injured TEXT,
    number_of_cyclists_killed TEXT,
    number_of_motorists_injured TEXT,
    number_of_motorists_killed TEXT,
    contributing_factor_vehicle_1 TEXT,
    contributing_factor_vehicle_2 TEXT,
    contributing_factor_vehicle_3 TEXT,
    contributing_factor_vehicle_4 TEXT,
    contributing_factor_vehicle_5 TEXT,
    collision_id TEXT,
    vehicle_type_code_1 TEXT,
    vehicle_type_code_2 TEXT,
    vehicle_type_code_3 TEXT,
    vehicle_type_code_4 TEXT,
    vehicle_type_code_5 TEXT
);

CREATE TABLE IF NOT EXISTS temporal.temp_persona(
    person_id TEXT,
    person_sex TEXT,
    person_lastName TEXT,
    person_firstName TEXT,
    person_phone TEXT,
    person_address TEXT,
    person_city TEXT,
    person_state TEXT,
    person_zip TEXT,
    person_ssn TEXT,
    person_dob TEXT
);

CREATE TABLE IF NOT EXISTS temporal.temp_vehiculos(
    vehicle_id TEXT,
    vehicle_year TEXT,
    vehicle_type TEXT,
    vehicle_model TEXT,
    vehicle_make TEXT
);

CREATE TABLE IF NOT EXISTS temporal.temp_colisionPersona(
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    creah_time TEXT,
    person_id TEXT,
    person_type TEXT,
    person_injury TEXT,
    vehicle_id TEXT,
    person_age TEXT,
    ejection TEXT,
    emotional_status TEXT,
    bodily_injury TEXT,
    position_in_vehicle TEXT,
    safety_equipment TEXT,
    ped_location TEXT,
    ped_action TEXT,
    complaint TEXT,
    ped_role TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT,
    person_sex TEXT
);

CREATE TABLE IF NOT EXISTS temporal.temp_colisionVehiculos(
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    vehicle_id TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT,
    travel_direction TEXT,
    vehicle_occupants TEXT,
    driver_sex TEXT,
    driver_license_status TEXT,
    driver_license_jurisdiction TEXT,
    pre_crash TEXT,
    point_of_impact TEXT,
    vehicle_damage_1 TEXT,
    vehicle_damage_2 TEXT,
    vehicle_damage_3 TEXT,
    vehicle_damage_4 TEXT,
    public_property_damage TEXT,
    public_property_damage_type TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT
);

COPY temporal.temp_accidentes
FROM 'C:\Collisions_Crashes_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';

COPY temporal.temp_persona
FROM 'C:\personas2.csv'
WITH CSV HEADER NULL '' DELIMITER ';' QUOTE '"';

COPY temporal.temp_vehiculos
FROM 'C:\Vehicles.csv'
WITH CSV HEADER NULL '' DELIMITER ';';

COPY temporal.temp_colisionPersona
FROM 'C:\Collisions_Person_20241020.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', NULL '', QUOTE '"', ESCAPE '"');

COPY temporal.temp_colisionVehiculos
FROM 'C:\Collisions_Vehicles_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';