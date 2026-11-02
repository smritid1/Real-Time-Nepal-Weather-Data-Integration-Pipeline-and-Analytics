USE weather_project;

-- SELECT * FROM weather_data;

-- SELECT DATABASE();

-- SHOW DATABASES;

-- Show all tables in the current database.
SHOW TABLES;

-- Describe the weather table.
DESCRIBE weather_data;

-- Show the complete CREATE TABLE definition.
SHOW CREATE TABLE weather_data;

-- Show columns and their metadata.
SHOW COLUMNS FROM weather_data;

-- Select every column.
SELECT * FROM weather_data;

-- Select only important weather columns.
SELECT city, temperature, humidity, wind_speed
FROM weather_data;

-- Select location information.
SELECT city, latitude, longitude
FROM weather_data;

-- Select timestamp information.
SELECT city, fetched_at
FROM weather_data;

-- Give columns readable aliases.
SELECT
    city AS City,
    temperature AS Temperature_C,
    humidity AS Humidity_Percent,
    wind_speed AS Wind_Speed_mps
FROM weather_data;

-- Return only 10 rows.
SELECT *
FROM weather_data
LIMIT 10;

-- Return the first 10 records ordered by ID.
SELECT *
FROM weather_data
ORDER BY id
LIMIT 10;

-- Return the latest 10 records.
SELECT *
FROM weather_data
ORDER BY fetched_at DESC
LIMIT 10;

-- Return the earliest 10 records.
SELECT *
FROM weather_data
ORDER BY fetched_at ASC
LIMIT 10;

-- What unique cities exist?
SELECT DISTINCT city
FROM weather_data;

-- How many unique cities exist?
SELECT COUNT(DISTINCT city) AS unique_cities
FROM weather_data;

-- What weather descriptions exist?
SELECT DISTINCT weather_description
FROM weather_data;

-- What weather categories exist?
SELECT DISTINCT weather_main
FROM weather_data;

-- What countries occur in the table?
SELECT DISTINCT country
FROM weather_data;

-- What combinations of city and country exist?
SELECT DISTINCT city, country
FROM weather_data;

-- Find temperatures above 35°C.
SELECT *
FROM weather_data
WHERE temperature > 35;

-- Find temperatures below 10°C.
SELECT *
FROM weather_data
WHERE temperature < 10;

-- Find temperatures between 20°C and 30°C.
SELECT *
FROM weather_data
WHERE temperature BETWEEN 20 AND 30;

-- Find humidity above 85%.
SELECT *
FROM weather_data
WHERE humidity > 85;

-- Find strong winds above 8 m/s.
SELECT *
FROM weather_data
WHERE wind_speed > 8;

-- Find Kathmandu observations.
SELECT *
FROM weather_data
WHERE city = 'Kathmandu';

-- Find Pokhara observations.
SELECT *
FROM weather_data
WHERE city = 'Pokhara';

-- Find several selected cities.
SELECT *
FROM weather_data
WHERE city IN ('Kathmandu', 'Pokhara', 'Lalitpur');

-- Exclude Kathmandu.
SELECT *
FROM weather_data
WHERE city <> 'Kathmandu';

-- Find records that are not from Kathmandu or Pokhara.
SELECT *
FROM weather_data
WHERE city NOT IN ('Kathmandu', 'Pokhara');

-- Find hot AND humid observations.
SELECT *
FROM weather_data
WHERE temperature > 30
  AND humidity > 80;

-- Find hot OR very humid observations.
SELECT *
FROM weather_data
WHERE temperature > 35
   OR humidity > 90;

-- Find rain observations with strong wind.
SELECT *
FROM weather_data
WHERE weather_main = 'Rain'
  AND wind_speed > 8;

-- Find rain OR snow observations.
SELECT *
FROM weather_data
WHERE weather_main IN ('Rain', 'Snow');

-- Search cities beginning with K.
SELECT *
FROM weather_data
WHERE city LIKE 'K%';

-- Search cities ending with 'pur'.
SELECT *
FROM weather_data
WHERE city LIKE '%pur';

-- Search cities containing 'ta'.
SELECT *
FROM weather_data
WHERE city LIKE '%ta%';

-- Search a weather description containing 'rain'.
SELECT *
FROM weather_data
WHERE weather_description LIKE '%rain%';

-- LOWER().
SELECT *
FROM weather_data
WHERE LOWER(weather_description) LIKE '%rain%';

-- Find records with missing rainfall.
SELECT *
FROM weather_data
WHERE rain_1h IS NULL;

-- Find records where rainfall exists.
SELECT *
FROM weather_data
WHERE rain_1h IS NOT NULL;

-- Find records with missing visibility.
SELECT *
FROM weather_data
WHERE visibility IS NULL;

-- Count missing rainfall values.
SELECT COUNT(*) AS missing_rainfall
FROM weather_data
WHERE rain_1h IS NULL;

-- Count missing visibility values.
SELECT COUNT(*) AS missing_visibility
FROM weather_data
WHERE visibility IS NULL;

-- Replace NULL rainfall with zero for display.
SELECT
    city,
    rain_1h,
    COALESCE(rain_1h, 0) AS rainfall_display
FROM weather_data;

-- Replace NULL visibility with 0 for display.
SELECT
    city,
    COALESCE(visibility, 0) AS visibility_display
FROM weather_data;

-- Hottest observations first.
SELECT *
FROM weather_data
ORDER BY temperature DESC;

-- Coldest observations first.
SELECT *
FROM weather_data
ORDER BY temperature ASC;

-- Highest humidity first.
SELECT *
FROM weather_data
ORDER BY humidity DESC;

-- Strongest wind first.
SELECT *
FROM weather_data
ORDER BY wind_speed DESC;

-- Highest rainfall first, NULL values naturally last in DESC.
SELECT *
FROM weather_data
ORDER BY rain_1h DESC;

-- Sort by city, then temperature descending.
SELECT *
FROM weather_data
ORDER BY city ASC, temperature DESC;

-- Sort by risk-related variables.
SELECT *
FROM weather_data
ORDER BY temperature DESC, humidity DESC, wind_speed DESC;

-- Total number of weather observations.
SELECT COUNT(*) AS total_observations
FROM weather_data;

-- Number of non-null rainfall observations.
SELECT COUNT(rain_1h) AS rainfall_observations
FROM weather_data;

-- Number of unique cities.
SELECT COUNT(DISTINCT city) AS city_count
FROM weather_data;

-- Average temperature.
SELECT AVG(temperature) AS average_temperature
FROM weather_data;

-- Maximum temperature.
SELECT MAX(temperature) AS maximum_temperature
FROM weather_data;

-- Minimum temperature.
SELECT MIN(temperature) AS minimum_temperature
FROM weather_data;

-- Average humidity.
SELECT AVG(humidity) AS average_humidity
FROM weather_data;

-- Maximum humidity.
SELECT MAX(humidity) AS maximum_humidity
FROM weather_data;

-- Average wind speed.
SELECT AVG(wind_speed) AS average_wind_speed
FROM weather_data;

-- Maximum wind speed.
SELECT MAX(wind_speed) AS maximum_wind_speed
FROM weather_data;

-- Total observed rainfall.
SELECT SUM(rain_1h) AS total_rainfall
FROM weather_data;

-- Average rainfall.
SELECT AVG(rain_1h) AS average_rainfall
FROM weather_data
WHERE rain_1h IS NOT NULL;

-- Average pressure.
SELECT AVG(pressure) AS average_pressure
FROM weather_data;

-- Average visibility.
SELECT AVG(visibility) AS average_visibility
FROM weather_data;

-- Number of observations per city.
SELECT
    city,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY city
ORDER BY observation_count DESC;

-- Average temperature by city.
SELECT
    city,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city
ORDER BY avg_temperature DESC;

-- Average humidity by city.
SELECT
    city,
    AVG(humidity) AS avg_humidity
FROM weather_data
GROUP BY city
ORDER BY avg_humidity DESC;

-- Maximum temperature by city.
SELECT
    city,
    MAX(temperature) AS max_temperature
FROM weather_data
GROUP BY city
ORDER BY max_temperature DESC;

-- Minimum temperature by city.
SELECT
    city,
    MIN(temperature) AS min_temperature
FROM weather_data
GROUP BY city
ORDER BY min_temperature ASC;

-- Maximum wind speed by city.
SELECT
    city,
    MAX(wind_speed) AS max_wind_speed
FROM weather_data
GROUP BY city
ORDER BY max_wind_speed DESC;

-- Average rainfall by city.
SELECT
    city,
    AVG(rain_1h) AS avg_rainfall
FROM weather_data
WHERE rain_1h IS NOT NULL
GROUP BY city
ORDER BY avg_rainfall DESC;

-- Count observations by weather type.
SELECT
    weather_main,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY weather_main
ORDER BY observation_count DESC;

-- Count observations by weather description.
SELECT
    weather_description,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY weather_description
ORDER BY observation_count DESC;

-- Average temperature by city and weather type.
SELECT
    city,
    weather_main,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city, weather_main
ORDER BY city, avg_temperature DESC;

-- Count observations by city and weather type.
SELECT
    city,
    weather_main,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY city, weather_main
ORDER BY city, observation_count DESC;

-- Cities with average temperature above 30°C.
SELECT
    city,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city
HAVING AVG(temperature) > 30;

-- Cities with average humidity above 85%.
SELECT
    city,
    AVG(humidity) AS avg_humidity
FROM weather_data
GROUP BY city
HAVING AVG(humidity) > 85;

-- Cities with maximum wind above 8 m/s.
SELECT
    city,
    MAX(wind_speed) AS max_wind
FROM weather_data
GROUP BY city
HAVING MAX(wind_speed) > 8;

-- Cities with at least 100 observations.
SELECT
    city,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY city
HAVING COUNT(*) >= 100;

-- Cities with both high average humidity and strong maximum wind.
SELECT
    city,
    AVG(humidity) AS avg_humidity,
    MAX(wind_speed) AS max_wind
FROM weather_data
GROUP BY city
HAVING AVG(humidity) > 80
   AND MAX(wind_speed) > 8;

-- Earliest observation.
SELECT MIN(fetched_at) AS earliest_observation
FROM weather_data;

-- Latest observation.
SELECT MAX(fetched_at) AS latest_observation
FROM weather_data;

-- Observations from 2026-10-27.
SELECT *
FROM weather_data
WHERE DATE(fetched_at) = '2026-10-27';

-- Observations after a specific timestamp.
SELECT *
FROM weather_data
WHERE fetched_at >= '2026-10-01 00:00:00';

-- Observations between two dates.
SELECT *
FROM weather_data
WHERE fetched_at >= '2026-10-01'
  AND fetched_at < '2026-11-01';

-- Extract the date.
SELECT
    fetched_at,
    DATE(fetched_at) AS observation_date
FROM weather_data;

-- Extract year.
SELECT
    fetched_at,
    YEAR(fetched_at) AS observation_year
FROM weather_data;

-- Extract month.
SELECT
    fetched_at,
    MONTH(fetched_at) AS observation_month
FROM weather_data;

-- Extract month name.
SELECT
    fetched_at,
    MONTHNAME(fetched_at) AS month_name
FROM weather_data;

-- Extract day of month.
SELECT
    fetched_at,
    DAY(fetched_at) AS day_of_month
FROM weather_data;

-- Extract day name.
SELECT
    fetched_at,
    DAYNAME(fetched_at) AS day_name
FROM weather_data;

-- Extract hour.
SELECT
    fetched_at,
    HOUR(fetched_at) AS observation_hour
FROM weather_data;

-- Group observations by date.
SELECT
    DATE(fetched_at) AS observation_date,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY DATE(fetched_at)
ORDER BY observation_date;

-- Average temperature by date.
SELECT
    DATE(fetched_at) AS observation_date,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY DATE(fetched_at)
ORDER BY observation_date;

-- Maximum temperature by date.
SELECT
    DATE(fetched_at) AS observation_date,
    MAX(temperature) AS max_temperature
FROM weather_data
GROUP BY DATE(fetched_at)
ORDER BY observation_date;

-- Rainfall by date.
SELECT
    DATE(fetched_at) AS observation_date,
    SUM(COALESCE(rain_1h, 0)) AS rainfall
FROM weather_data
GROUP BY DATE(fetched_at)
ORDER BY observation_date;

-- Observations from the last 7 days.
SELECT *
FROM weather_data
WHERE fetched_at >= NOW() - INTERVAL 7 DAY
ORDER BY fetched_at DESC;

-- Observations from the last 30 days.
SELECT *
FROM weather_data
WHERE fetched_at >= NOW() - INTERVAL 30 DAY
ORDER BY fetched_at DESC;

-- Observations from the current month.
SELECT *
FROM weather_data
WHERE YEAR(fetched_at) = YEAR(CURDATE())
  AND MONTH(fetched_at) = MONTH(CURDATE());

-- Create a simple heat classification.
SELECT
    city,
    temperature,
    CASE
        WHEN temperature > 35 THEN 'Heat Alert'
        WHEN temperature >= 30 THEN 'Hot'
        WHEN temperature >= 20 THEN 'Moderate'
        ELSE 'Cool'
    END AS temperature_category
FROM weather_data;

-- Create a humidity category.
SELECT
    city,
    humidity,
    CASE
        WHEN humidity > 85 THEN 'High Humidity'
        WHEN humidity >= 60 THEN 'Moderate Humidity'
        ELSE 'Low Humidity'
    END AS humidity_category
FROM weather_data;

-- Create a wind category.
SELECT
    city,
    wind_speed,
    CASE
        WHEN wind_speed > 8 THEN 'Strong Wind'
        WHEN wind_speed >= 4 THEN 'Moderate Wind'
        ELSE 'Light Wind'
    END AS wind_category
FROM weather_data;

-- rule-based risk idea.
SELECT
    city,
    temperature,
    humidity,
    wind_speed,
    weather_main,
    rain_1h,
    CASE
        WHEN temperature > 35 THEN 'Heat Alert'
        WHEN humidity > 85 THEN 'High Humidity'
        WHEN wind_speed > 8 THEN 'Strong Wind'
        WHEN weather_main = 'Rain' AND wind_speed > 8 THEN 'Outdoor Risk'
        ELSE 'Normal'
    END AS risk_category
FROM weather_data;

-- priority order for combined weather risk.
SELECT
    city,
    temperature,
    humidity,
    wind_speed,
    rain_1h,
    weather_main,
    CASE
        WHEN temperature > 35 AND humidity > 85
            THEN 'Extreme Heat + Humidity'
        WHEN weather_main = 'Rain' AND wind_speed > 8
            THEN 'Rain + Strong Wind'
        WHEN temperature > 35
            THEN 'Heat Alert'
        WHEN humidity > 85
            THEN 'High Humidity'
        WHEN wind_speed > 8
            THEN 'Strong Wind'
        WHEN COALESCE(rain_1h, 0) > 10
            THEN 'Heavy Rainfall'
        ELSE 'Normal'
    END AS risk_category
FROM weather_data;

-- Count records by risk category.
SELECT
    CASE
        WHEN temperature > 35 THEN 'Heat Alert'
        WHEN humidity > 85 THEN 'High Humidity'
        WHEN weather_main = 'Rain' AND wind_speed > 8 THEN 'Outdoor Risk'
        WHEN wind_speed > 8 THEN 'Strong Wind'
        ELSE 'Normal'
    END AS risk_category,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY risk_category
ORDER BY observation_count DESC;

-- Convert city names to uppercase.
SELECT
    city,
    UPPER(city) AS city_upper
FROM weather_data;

-- Convert city names to lowercase.
SELECT
    city,
    LOWER(city) AS city_lower
FROM weather_data;

-- Find city name length.
SELECT
    city,
    LENGTH(city) AS city_length
FROM weather_data;

-- Trim spaces from city values.
SELECT
    city,
    TRIM(city) AS cleaned_city
FROM weather_data;

-- Combine city and country.
SELECT
    CONCAT(city, ', ', country) AS location
FROM weather_data;

-- Create a readable weather summary.
SELECT
    CONCAT(
        city,
        ' | ',
        temperature, '°C | ',
        humidity, '% humidity | ',
        wind_speed, ' m/s'
    ) AS weather_summary
FROM weather_data;

-- Extract the first three characters of a city.
SELECT
    city,
    LEFT(city, 3) AS city_prefix
FROM weather_data;

-- Round temperature to one decimal place.
SELECT
    temperature,
    ROUND(temperature, 1) AS rounded_temperature
FROM weather_data;

-- Round rainfall to two decimals.
SELECT
    rain_1h,
    ROUND(rain_1h, 2) AS rounded_rainfall
FROM weather_data;

-- Absolute difference between temperature and feels-like.
SELECT
    city,
    ABS(feels_like - temperature) AS absolute_difference
FROM weather_data;

-- Count heat alerts.
SELECT
    SUM(CASE WHEN temperature > 35 THEN 1 ELSE 0 END) AS heat_alert_count
FROM weather_data;

-- Count high-humidity observations.
SELECT
    SUM(CASE WHEN humidity > 85 THEN 1 ELSE 0 END) AS high_humidity_count
FROM weather_data;

-- Count strong-wind observations.
SELECT
    SUM(CASE WHEN wind_speed > 8 THEN 1 ELSE 0 END) AS strong_wind_count
FROM weather_data;

-- Count rainy observations.
SELECT
    SUM(CASE WHEN weather_main = 'Rain' THEN 1 ELSE 0 END) AS rainy_count
FROM weather_data;

-- Count multiple conditions at once.
SELECT
    SUM(CASE WHEN temperature > 35 THEN 1 ELSE 0 END) AS heat_alerts,
    SUM(CASE WHEN humidity > 85 THEN 1 ELSE 0 END) AS high_humidity,
    SUM(CASE WHEN wind_speed > 8 THEN 1 ELSE 0 END) AS strong_wind,
    SUM(CASE WHEN weather_main = 'Rain' THEN 1 ELSE 0 END) AS rain_events
FROM weather_data;

-- Find observations above the overall average temperature.
SELECT *
FROM weather_data
WHERE temperature > (
    SELECT AVG(temperature)
    FROM weather_data
);

-- Find observations below the overall average temperature.
SELECT *
FROM weather_data
WHERE temperature < (
    SELECT AVG(temperature)
    FROM weather_data
);

-- Find the hottest observation.
SELECT *
FROM weather_data
WHERE temperature = (
    SELECT MAX(temperature)
    FROM weather_data
);

-- Find the coldest observation.
SELECT *
FROM weather_data
WHERE temperature = (
    SELECT MIN(temperature)
    FROM weather_data
);

-- Find cities whose average temperature is above the overall average.
SELECT
    city,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city
HAVING AVG(temperature) > (
    SELECT AVG(temperature)
    FROM weather_data
);

-- Find observations with above-average humidity.
SELECT *
FROM weather_data
WHERE humidity > (
    SELECT AVG(humidity)
    FROM weather_data
);

-- Find observations with rainfall above average rainfall.
SELECT *
FROM weather_data
WHERE rain_1h > (
    SELECT AVG(rain_1h)
    FROM weather_data
    WHERE rain_1h IS NOT NULL
);

-- Find cities that have at least one rain observation.
SELECT DISTINCT w.city
FROM weather_data AS w
WHERE EXISTS (
    SELECT 1
    FROM weather_data AS r
    WHERE r.city = w.city
      AND r.weather_main = 'Rain'
);

-- Find cities with at least one strong-wind observation.
SELECT DISTINCT w.city
FROM weather_data AS w
WHERE EXISTS (
    SELECT 1
    FROM weather_data AS x
    WHERE x.city = w.city
      AND x.wind_speed > 8
);

-- Combine hot and cold observations.
SELECT city, fetched_at, temperature, 'Hot' AS category
FROM weather_data
WHERE temperature > 30
UNION ALL
SELECT city, fetched_at, temperature, 'Cold' AS category
FROM weather_data
WHERE temperature < 10;

-- UNION removes duplicates.
SELECT city
FROM weather_data
WHERE temperature > 35
UNION
SELECT city
FROM weather_data
WHERE humidity > 90;

-- Create a reusable city summary view.
CREATE OR REPLACE VIEW city_weather_summary AS
SELECT
    city,
    COUNT(*) AS observations,
    AVG(temperature) AS avg_temperature,
    MIN(temperature) AS min_temperature,
    MAX(temperature) AS max_temperature,
    AVG(humidity) AS avg_humidity,
    MAX(wind_speed) AS max_wind_speed,
    SUM(COALESCE(rain_1h, 0)) AS total_rainfall
FROM weather_data
GROUP BY city;

-- Query the view.
SELECT *
FROM city_weather_summary
ORDER BY avg_temperature DESC;

-- Show the view definition.
SHOW CREATE VIEW city_weather_summary;

-- Drop the view when no longer needed.
DROP VIEW city_weather_summary;

-- Check duplicate IDs.
SELECT
    id,
    COUNT(*) AS duplicate_count
FROM weather_data
GROUP BY id
HAVING COUNT(*) > 1;

-- Check duplicate city + timestamp combinations.
SELECT
    city,
    fetched_at,
    COUNT(*) AS duplicate_count
FROM weather_data
GROUP BY city, fetched_at
HAVING COUNT(*) > 1;

-- Find invalid humidity values.
SELECT *
FROM weather_data
WHERE humidity < 0
   OR humidity > 100;

-- Find negative wind speeds.
SELECT *
FROM weather_data
WHERE wind_speed < 0;

-- Find impossible latitude values.
SELECT *
FROM weather_data
WHERE latitude < -90
   OR latitude > 90;

-- Find impossible longitude values.
SELECT *
FROM weather_data
WHERE longitude < -180
   OR longitude > 180;

-- Find suspicious temperatures.
SELECT *
FROM weather_data
WHERE temperature < -50
   OR temperature > 60;

-- Find negative rainfall.
SELECT *
FROM weather_data
WHERE rain_1h < 0;

-- Find missing important fields.
SELECT *
FROM weather_data
WHERE city IS NULL
   OR temperature IS NULL
   OR humidity IS NULL
   OR wind_speed IS NULL
   OR fetched_at IS NULL;

-- Count NULLs in important fields.
SELECT
    SUM(city IS NULL) AS missing_city,
    SUM(temperature IS NULL) AS missing_temperature,
    SUM(humidity IS NULL) AS missing_humidity,
    SUM(wind_speed IS NULL) AS missing_wind,
    SUM(fetched_at IS NULL) AS missing_timestamp,
    SUM(rain_1h IS NULL) AS missing_rainfall,
    SUM(visibility IS NULL) AS missing_visibility
FROM weather_data;

-- Count each existing weather insight.
SELECT
    weather_insight,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY weather_insight
ORDER BY observation_count DESC;

-- Find all non-pleasant observations.
SELECT *
FROM weather_data
WHERE weather_insight <> '✅ Pleasant Weather';

-- Percentage of pleasant observations.
SELECT
    ROUND(
        100 * SUM(weather_insight = '✅ Pleasant Weather') / COUNT(*),
        2
    ) AS pleasant_percentage
FROM weather_data;

-- City-level insight distribution.
SELECT
    city,
    weather_insight,
    COUNT(*) AS observation_count
FROM weather_data
GROUP BY city, weather_insight
ORDER BY city, observation_count DESC;

-- Compare selected cities.
SELECT
    city,
    AVG(temperature) AS avg_temperature,
    AVG(humidity) AS avg_humidity,
    AVG(wind_speed) AS avg_wind_speed,
    AVG(rain_1h) AS avg_rainfall
FROM weather_data
WHERE city IN ('Kathmandu', 'Pokhara', 'Lalitpur', 'Bhaktapur')
GROUP BY city
ORDER BY avg_temperature DESC;

-- Find the hottest city by maximum recorded temperature.
SELECT
    city,
    MAX(temperature) AS maximum_temperature
FROM weather_data
GROUP BY city
ORDER BY maximum_temperature DESC
LIMIT 1;

-- Find the coldest city by minimum recorded temperature.
SELECT
    city,
    MIN(temperature) AS minimum_temperature
FROM weather_data
GROUP BY city
ORDER BY minimum_temperature ASC
LIMIT 1;

-- Find the windiest city.
SELECT
    city,
    MAX(wind_speed) AS maximum_wind
FROM weather_data
GROUP BY city
ORDER BY maximum_wind DESC
LIMIT 1;

-- Find the most humid city using average humidity.
SELECT
    city,
    AVG(humidity) AS average_humidity
FROM weather_data
GROUP BY city
ORDER BY average_humidity DESC
LIMIT 1;

-- Find the city with the greatest total rainfall.
SELECT
    city,
    SUM(COALESCE(rain_1h, 0)) AS total_rainfall
FROM weather_data
GROUP BY city
ORDER BY total_rainfall DESC
LIMIT 1;

-- Count weather types in columns.
SELECT
    SUM(weather_main = 'Rain') AS rain_count,
    SUM(weather_main = 'Clouds') AS clouds_count,
    SUM(weather_main = 'Clear') AS clear_count,
    SUM(weather_main = 'Snow') AS snow_count
FROM weather_data;

-- City-level rain vs non-rain counts.
SELECT
    city,
    SUM(weather_main = 'Rain') AS rain_count,
    SUM(weather_main <> 'Rain') AS non_rain_count
FROM weather_data
GROUP BY city
ORDER BY rain_count DESC;

-- Find city names with leading/trailing spaces.
SELECT *
FROM weather_data
WHERE city <> TRIM(city);

-- Find blank city values.
SELECT *
FROM weather_data
WHERE city = '';

-- Find blank weather descriptions.
SELECT *
FROM weather_data
WHERE weather_description = '';

-- Preview standardized city names.
SELECT
    city,
    TRIM(city) AS cleaned_city
FROM weather_data;

-- Preview standardized weather descriptions.
SELECT
    weather_description,
    LOWER(TRIM(weather_description)) AS cleaned_description
FROM weather_data;

-- Executive KPI summary.
SELECT
    COUNT(*) AS total_observations,
    COUNT(DISTINCT city) AS total_cities,
    ROUND(AVG(temperature), 2) AS avg_temperature,
    ROUND(AVG(humidity), 2) AS avg_humidity,
    ROUND(MAX(temperature), 2) AS max_temperature,
    ROUND(MAX(wind_speed), 2) AS max_wind_speed,
    ROUND(SUM(COALESCE(rain_1h, 0)), 2) AS total_rainfall
FROM weather_data;

-- City comparison dashboard query.
SELECT
    city,
    COUNT(*) AS observations,
    ROUND(AVG(temperature), 2) AS avg_temperature,
    ROUND(MIN(temperature), 2) AS min_temperature,
    ROUND(MAX(temperature), 2) AS max_temperature,
    ROUND(AVG(humidity), 2) AS avg_humidity,
    ROUND(MAX(wind_speed), 2) AS max_wind_speed,
    ROUND(SUM(COALESCE(rain_1h, 0)), 2) AS total_rainfall
FROM weather_data
GROUP BY city
ORDER BY avg_temperature DESC;

-- Risk dashboard query.
SELECT
    DATE(fetched_at) AS observation_date,
    SUM(temperature > 35) AS heat_alerts,
    SUM(humidity > 85) AS high_humidity,
    SUM(wind_speed > 8) AS strong_wind,
    SUM(weather_main = 'Rain') AS rain_observations,
    SUM(
        weather_main = 'Rain'
        AND wind_speed > 8
    ) AS rain_strong_wind
FROM weather_data
GROUP BY DATE(fetched_at)
ORDER BY observation_date;

-- Final city-level risk summary.
WITH scored AS (
    SELECT
        city,
        CASE WHEN temperature > 35 THEN 1 ELSE 0 END AS heat_flag,
        CASE WHEN humidity > 85 THEN 1 ELSE 0 END AS humidity_flag,
        CASE WHEN wind_speed > 8 THEN 1 ELSE 0 END AS wind_flag,
        CASE WHEN COALESCE(rain_1h, 0) > 10 THEN 1 ELSE 0 END AS rain_flag
    FROM weather_data
)
SELECT
    city,
    SUM(heat_flag) AS heat_alerts,
    SUM(humidity_flag) AS high_humidity_events,
    SUM(wind_flag) AS strong_wind_events,
    SUM(rain_flag) AS heavy_rain_events,
    SUM(heat_flag + humidity_flag + wind_flag + rain_flag) AS total_risk_signals
FROM scored
GROUP BY city
ORDER BY total_risk_signals DESC;

-- Average temperature by city using a CTE.
WITH city_temperature AS (
    SELECT
        city,
        AVG(temperature) AS avg_temperature
    FROM weather_data
    GROUP BY city
)
SELECT *
FROM city_temperature
ORDER BY avg_temperature DESC;

-- Identify cities above the overall average using a CTE.
WITH city_temperature AS (
    SELECT
        city,
        AVG(temperature) AS avg_temperature
    FROM weather_data
    GROUP BY city
),
overall_temperature AS (
    SELECT AVG(temperature) AS overall_avg
    FROM weather_data
)
SELECT
    c.city,
    c.avg_temperature,
    o.overall_avg
FROM city_temperature AS c
CROSS JOIN overall_temperature AS o
WHERE c.avg_temperature > o.overall_avg;

-- Rank observations by temperature.
SELECT
    city,
    fetched_at,
    temperature,
    RANK() OVER (ORDER BY temperature DESC) AS temperature_rank
FROM weather_data;

-- Rank cities by average temperature.
WITH city_avg AS (
    SELECT
        city,
        AVG(temperature) AS avg_temperature
    FROM weather_data
    GROUP BY city
)
SELECT
    city,
    avg_temperature,
    RANK() OVER (ORDER BY avg_temperature DESC) AS city_rank
FROM city_avg;

-- Number each observation within a city chronologically.
SELECT
    city,
    fetched_at,
    temperature,
    ROW_NUMBER() OVER (
        PARTITION BY city
        ORDER BY fetched_at
    ) AS observation_number
FROM weather_data;

-- Compare each city's temperature with its city average.
SELECT
    city,
    fetched_at,
    temperature,
    AVG(temperature) OVER (
        PARTITION BY city
    ) AS city_avg_temperature,
    temperature - AVG(temperature) OVER (
        PARTITION BY city
    ) AS difference_from_city_avg
FROM weather_data;

-- Previous temperature for each city.
SELECT
    city,
    fetched_at,
    temperature,
    LAG(temperature) OVER (
        PARTITION BY city
        ORDER BY fetched_at
    ) AS previous_temperature
FROM weather_data;


-- Next rainfall observation.
SELECT
    city,
    fetched_at,
    rain_1h,
    LEAD(rain_1h) OVER (
        PARTITION BY city
        ORDER BY fetched_at
    ) AS next_rainfall
FROM weather_data;

-- Top 5 cities by average temperature.
WITH city_avg AS (
    SELECT
        city,
        AVG(temperature) AS avg_temperature
    FROM weather_data
    GROUP BY city
),
ranked AS (
    SELECT
        city,
        avg_temperature,
        ROW_NUMBER() OVER (
            ORDER BY avg_temperature DESC
        ) AS rn
    FROM city_avg
)
SELECT *
FROM ranked
WHERE rn <= 5;

-- ================================================================
-- STORED PROCEDURES
-- ================================================================

-- Procedure to return observations for a city.
DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS GetCityWeather(IN p_city VARCHAR(100))
BEGIN
    SELECT *
    FROM weather_data
    WHERE city = p_city
    ORDER BY fetched_at DESC;
END$$

DELIMITER ;

-- Call the procedure.
CALL GetCityWeather('Kathmandu');

-- Procedure for city average temperature.
DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS GetCityAverageTemperature(
    IN p_city VARCHAR(100)
)
BEGIN
    SELECT
        city,
        AVG(temperature) AS average_temperature
    FROM weather_data
    WHERE city = p_city
    GROUP BY city;
END$$

DELIMITER ;

-- Call it.
CALL GetCityAverageTemperature('Pokhara');

-- ================================================================
-- STORED FUNCTIONS
-- ================================================================

-- Function that classifies temperature.
DELIMITER $$

CREATE FUNCTION IF NOT EXISTS TemperatureCategory(
    p_temperature DECIMAL(10,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_temperature > 35 THEN 'Heat Alert'
        WHEN p_temperature >= 30 THEN 'Hot'
        WHEN p_temperature >= 20 THEN 'Moderate'
        ELSE 'Cool'
    END;
END$$

DELIMITER ;

-- Use the function.
SELECT
    city,
    temperature,
    TemperatureCategory(temperature) AS temperature_category
FROM weather_data;

-- ================================================================
-- TRIGGERS
-- ================================================================

-- Example audit table.
CREATE TABLE IF NOT EXISTS weather_alert_audit (
    audit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    alert_id BIGINT,
    action_type VARCHAR(30),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Example DELETE audit trigger.
DELIMITER $$

CREATE TRIGGER IF NOT EXISTS trg_weather_alert_delete
AFTER DELETE ON weather_alerts
FOR EACH ROW
BEGIN
    INSERT INTO weather_alert_audit(alert_id, action_type)
    VALUES (OLD.alert_id, 'DELETE');
END$$

DELIMITER ;

-- Explain a basic query.
EXPLAIN
SELECT *
FROM weather_data
WHERE city = 'Kathmandu';

-- Explain a date filter.
EXPLAIN
SELECT *
FROM weather_data
WHERE fetched_at >= '2026-10-01';

-- Explain an aggregation query.
EXPLAIN
SELECT
    city,
    AVG(temperature)
FROM weather_data
GROUP BY city;

-- More detailed optimizer information.
EXPLAIN ANALYZE
SELECT *
FROM weather_data
WHERE city = 'Kathmandu'
ORDER BY fetched_at DESC
LIMIT 10;

-- Find all tables in the current database.
SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = DATABASE();

-- Create one temporary table for practice.
CREATE TEMPORARY TABLE sql_study_weather (
    id INT PRIMARY KEY,
    city VARCHAR(100),
    temperature DECIMAL(5,2),
    humidity DECIMAL(5,2)
);

-- Insert a few practice rows.
INSERT INTO sql_study_weather (id, city, temperature, humidity)
VALUES
    (1, 'Kathmandu', 28.50, 70.00),
    (2, 'Pokhara', 24.00, 82.00),
    (3, 'Biratnagar', 32.00, 78.00);

-- CREATE INDEX: create an index to speed up searches on city.
CREATE INDEX idx_study_city
ON sql_study_weather(city);

-- Check the index.
SHOW INDEX FROM sql_study_weather;

-- Use the indexed column in a normal query.
SELECT *
FROM sql_study_weather
WHERE city = 'Kathmandu';

-- DROP INDEX: remove the practice index.
DROP INDEX idx_study_city
ON sql_study_weather;

-- Verify that the index has been removed.
SHOW INDEX FROM sql_study_weather;

-- ================================================================
-- TRANSACTION PRACTICE
-- ================================================================

-- START TRANSACTION: begin a group of changes that can be committed
-- or undone as one unit.
START TRANSACTION;

-- Change the temperature.
UPDATE sql_study_weather
SET temperature = 35.00
WHERE id = 1;

-- SAVEPOINT: create a point we can return to later.
SAVEPOINT before_second_change;

-- Make another change.
UPDATE sql_study_weather
SET humidity = 90.00
WHERE id = 1;

-- See both changes before deciding whether to keep them.
SELECT *
FROM sql_study_weather
WHERE id = 1;

-- ROLLBACK TO SAVEPOINT: undo only the change made after the savepoint.
ROLLBACK TO SAVEPOINT before_second_change;

-- Check that temperature remains changed but humidity returned
-- to its previous value.
SELECT *
FROM sql_study_weather
WHERE id = 1;

-- COMMIT: permanently keep the remaining transaction changes.
COMMIT;

-- Verify the committed temperature change.
SELECT *
FROM sql_study_weather
WHERE id = 1;

-- ================================================================
-- FULL ROLLBACK PRACTICE
-- ================================================================

-- Start another transaction.
START TRANSACTION;

-- Delete one practice row.
DELETE FROM sql_study_weather
WHERE id = 3;

-- Check that the row is temporarily gone.
SELECT *
FROM sql_study_weather
ORDER BY id;

-- ROLLBACK: undo all uncommitted changes in this transaction.
ROLLBACK;

-- Verify that the deleted row has returned.
SELECT *
FROM sql_study_weather
ORDER BY id;

-- Clean up the temporary table.
DROP TEMPORARY TABLE sql_study_weather;

-- ================================================================

-- Find the second-highest temperature.
SELECT MAX(temperature) AS second_highest_temperature
FROM weather_data
WHERE temperature < (
    SELECT MAX(temperature)
    FROM weather_data
);

-- Find the second-highest temperature using DENSE_RANK.
WITH ranked AS (
    SELECT
        temperature,
        DENSE_RANK() OVER (ORDER BY temperature DESC) AS rnk
    FROM weather_data
)
SELECT DISTINCT temperature
FROM ranked
WHERE rnk = 2;

-- Find the top 3 cities by average temperature.
SELECT
    city,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city
ORDER BY avg_temperature DESC
LIMIT 3;

-- Find cities whose average temperature exceeds 25°C.
SELECT
    city,
    AVG(temperature) AS avg_temperature
FROM weather_data
GROUP BY city
HAVING AVG(temperature) > 25;

-- Find cities with both rain and heat observations.
SELECT city
FROM weather_data
GROUP BY city
HAVING SUM(weather_main = 'Rain') > 0
   AND SUM(temperature > 35) > 0;

-- Find the city with the highest average rainfall.
SELECT
    city,
    AVG(rain_1h) AS avg_rainfall
FROM weather_data
WHERE rain_1h IS NOT NULL
GROUP BY city
ORDER BY avg_rainfall DESC
LIMIT 1;

-- Find the most frequently observed weather condition.
SELECT
    weather_main,
    COUNT(*) AS frequency
FROM weather_data
GROUP BY weather_main
ORDER BY frequency DESC
LIMIT 1;

-- Find the latest record in the entire table.
SELECT *
FROM weather_data
ORDER BY fetched_at DESC, id DESC
LIMIT 1;

-- Find the record with the highest rainfall.
SELECT *
FROM weather_data
WHERE rain_1h = (
    SELECT MAX(rain_1h)
    FROM weather_data
);

-- Find cities with more than 500 observations.
SELECT
    city,
    COUNT(*) AS observations
FROM weather_data
GROUP BY city
HAVING COUNT(*) > 500;