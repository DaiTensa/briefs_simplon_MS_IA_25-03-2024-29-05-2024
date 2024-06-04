  -- Exploration des données de la table mobility_report ---
SELECT
  *
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
LIMIT
  10
-----------------------------------------------------------------
-----------------------------------------------------------------
SELECT
  column_name
FROM
  mobility_report.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = `bigquery-public-data.covid19_google_mobility.mobility_report`;



-- Nombre total d'enregistrements 11730025 lignes
SELECT
  COUNT(*)
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`;



-- Les régions
SELECT
  DISTINCT country_region
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report` ;
----------------------------
----------------------------
SELECT
  DISTINCT metro_area
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report` ;



-- Tendances mobilité -- FRANCE ---
SELECT
  *
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  country_region = 'France';
  ------------------------------------------------------------------------------------------------

SELECT
  date,
  retail_and_recreation_percent_change_from_baseline AS retail_recreation,
  grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
  parks_percent_change_from_baseline AS parks,
  transit_stations_percent_change_from_baseline AS transit_stations,
  workplaces_percent_change_from_baseline AS workplaces,
  residential_percent_change_from_baseline AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  country_region = "France"
  AND date BETWEEN '2020-03-17'
  AND '2020-05-11'
ORDER BY
  date;

SELECT MIN(date) FROM `bigquery-public-data.covid19_google_mobility.mobility_report` ; -- 2020-02-15
SELECT MAX(date) FROM `bigquery-public-data.covid19_google_mobility.mobility_report` ; -- 2022-10-15




  -- Tendances mobilité -- ALLEMAGNE ---

SELECT
  count(*)
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  country_region = 'Germany';

SELECT
  date,
  retail_and_recreation_percent_change_from_baseline AS retail_recreation,
  grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
  parks_percent_change_from_baseline AS parks,
  transit_stations_percent_change_from_baseline AS transit_stations,
  workplaces_percent_change_from_baseline AS workplaces,
  residential_percent_change_from_baseline AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  country_region = "Germany"
  AND date BETWEEN '2020-03-17'
  AND '2020-05-11'
ORDER BY
  date;


----------------------------------------------
--------PERIODE 01 AVANT MARS 2020 -----------
SELECT
  date,
  country_region,
  retail_and_recreation_percent_change_from_baseline AS retail_recreation,
  grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
  parks_percent_change_from_baseline AS parks,
  transit_stations_percent_change_from_baseline AS transit_stations,
  workplaces_percent_change_from_baseline AS workplaces,
  residential_percent_change_from_baseline AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  (country_region = "Germany" OR country_region = "France")
  AND date BETWEEN '2020-02-15'
  AND '2020-02-29'
ORDER BY
  date;


SELECT
  date,
  country_region,
  AVG(retail_and_recreation_percent_change_from_baseline) AS retail_recreation,
  AVG(grocery_and_pharmacy_percent_change_from_baseline) AS grocery_pharmacy,
  AVG(parks_percent_change_from_baseline) AS parks,
  AVG(transit_stations_percent_change_from_baseline) AS transit_stations,
  AVG(workplaces_percent_change_from_baseline) AS workplaces,
  AVG(residential_percent_change_from_baseline) AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  (country_region = "Germany" OR country_region = "France")
  AND date BETWEEN '2020-02-15'
  AND '2020-02-29'

GROUP BY
  date, country_region
ORDER BY
  date;

----------------------------------------------
---------PERIODE 02 APRES MARS 2020-----------

SELECT
  date,
  country_region,
  retail_and_recreation_percent_change_from_baseline AS retail_recreation,
  grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
  parks_percent_change_from_baseline AS parks,
  transit_stations_percent_change_from_baseline AS transit_stations,
  workplaces_percent_change_from_baseline AS workplaces,
  residential_percent_change_from_baseline AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  (country_region = "Germany" OR country_region = "France")
  AND (date >= "2020-03-01")
ORDER BY
  date;


SELECT
  date,
  country_region,
  AVG(retail_and_recreation_percent_change_from_baseline) AS retail_recreation,
  AVG(grocery_and_pharmacy_percent_change_from_baseline) AS grocery_pharmacy,
  AVG(parks_percent_change_from_baseline) AS parks,
  AVG(transit_stations_percent_change_from_baseline) AS transit_stations,
  AVG(workplaces_percent_change_from_baseline) AS workplaces,
  AVG(residential_percent_change_from_baseline) AS residential
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
  (country_region = "Germany" OR country_region = "France")
  AND date >= "2020-03-01"
GROUP BY
  date, country_region
ORDER BY
  date;


------------------------------------------------------
-------Focus sur France-Allemagne---------------------
------------------------------------------------------


------------------------------------------------------
-----1. Identifier les Phases de Confinement----------
------------------------------------------------------

------------------------------------------------------
-------PREMIÈRE PÉRIODE DE CONFINEMENT----------------
--------du 17 mars 2020 au 11 mai 2020----------------
SELECT
date,
country_region,
retail_and_recreation_percent_change_from_baseline AS retail_recreation,
grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
parks_percent_change_from_baseline AS parks,
transit_stations_percent_change_from_baseline AS transit_stations,
workplaces_percent_change_from_baseline AS workplaces,
residential_percent_change_from_baseline AS residential
FROM
`bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
country_region = "France"
AND (date BETWEEN '2020-03-17' AND '2020-05-11')
ORDER BY
date;

------------------------------------------------------
-------DEUXIÈME PÉRIODE DE CONFINEMENT----------------
----du 30 octobre 2020 au 15 décembre 2020------------
SELECT
date,
country_region,
retail_and_recreation_percent_change_from_baseline AS retail_recreation,
grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
parks_percent_change_from_baseline AS parks,
transit_stations_percent_change_from_baseline AS transit_stations,
workplaces_percent_change_from_baseline AS workplaces,
residential_percent_change_from_baseline AS residential
FROM
`bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
country_region = "France"
AND date BETWEEN '2020-10-30' AND '2020-12-15'
ORDER BY
date;

------------------------------------------------------
-------TROISIÈME PÉRIODE DE CONFINEMENT----------------
----du 03 avril 2020 au 03 mai 2021------------
SELECT
date,
country_region,
retail_and_recreation_percent_change_from_baseline AS retail_recreation,
grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
parks_percent_change_from_baseline AS parks,
transit_stations_percent_change_from_baseline AS transit_stations,
workplaces_percent_change_from_baseline AS workplaces,
residential_percent_change_from_baseline AS residential
FROM
`bigquery-public-data.covid19_google_mobility.mobility_report`
WHERE
country_region = "France"
AND date BETWEEN '2020-04-03' AND '2021-05-03'
ORDER BY
date;


---------------------------------------------------
------ CTE PÉRIODES DE CONFINEMENT ----------------

WITH confinement_periods AS (
    SELECT
        'France' AS country,
        DATE('2020-03-17') AS date_debut,
        DATE('2020-05-11') AS date_fin
    UNION ALL
    SELECT
        'France',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'France',
        DATE('2021-04-03'),
        DATE('2021-05-03')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-03-17'),
        DATE('2020-05-11')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'Germany',
        DATE('2021-04-03'),
        DATE('2021-05-03')
),
data_mobility AS (
    SELECT
        date,
        EXTRACT(YEAR FROM date) AS Year,
        EXTRACT(MONTH FROM date) AS Month,
        country_region,
        retail_and_recreation_percent_change_from_baseline AS retail_recreation,
        grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
        parks_percent_change_from_baseline AS parks,
        transit_stations_percent_change_from_baseline AS transit_stations,
        workplaces_percent_change_from_baseline AS workplaces,
        residential_percent_change_from_baseline AS residential
    FROM
        `bigquery-public-data.covid19_google_mobility.mobility_report`
    WHERE
        country_region IN ('France', 'Germany')
)
SELECT
    m.date,
    m.Year,
    m.Month,
    m.country_region,
    m.retail_recreation,
    m.grocery_pharmacy,
    m.parks,
    m.transit_stations,
    m.workplaces,
    m.residential,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM confinement_periods cp
            WHERE m.country_region = cp.country
            AND m.date BETWEEN cp.date_debut AND cp.date_fin
        ) THEN 'confinement'
        ELSE 'non-confinement'
    END AS confinement_status
FROM
    data_mobility m
ORDER BY
    m.country_region, m.date;

------------------------------------------------------------
------------------------------------------------------------
--------TOUTES PÉRIODES CONFONDUS FR GE --------------------

WITH confinement_periods AS (
    SELECT
        'France' AS country,
        DATE('2020-03-17') AS date_debut,
        DATE('2020-05-11') AS date_fin
    UNION ALL
    SELECT
        'France',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'France',
        DATE('2021-04-03'),
        DATE('2021-05-03')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-03-17'),
        DATE('2020-05-11')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'Germany',
        DATE('2021-04-03'),
        DATE('2021-05-03')
),
data_mobility AS (
    SELECT
        date,
        EXTRACT(YEAR FROM date) AS Year,
        EXTRACT(MONTH FROM date) AS Month,
        country_region,
        retail_and_recreation_percent_change_from_baseline AS retail_recreation,
        grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
        parks_percent_change_from_baseline AS parks,
        transit_stations_percent_change_from_baseline AS transit_stations,
        workplaces_percent_change_from_baseline AS workplaces,
        residential_percent_change_from_baseline AS residential
    FROM
        `bigquery-public-data.covid19_google_mobility.mobility_report`
    WHERE
        country_region IN ('France', 'Germany')
), data_mobility_merged AS (

SELECT
    m.date,
    m.Year,
    m.Month,
    m.country_region,
    m.retail_recreation,
    m.grocery_pharmacy,
    m.parks,
    m.transit_stations,
    m.workplaces,
    m.residential,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM confinement_periods cp
            WHERE m.country_region = cp.country
            AND m.date BETWEEN cp.date_debut AND cp.date_fin
        ) THEN 'confinement'
        ELSE 'non-confinement'
    END AS confinement_status
FROM
    data_mobility m
ORDER BY
    m.country_region, m.date
)
SELECT
  Month,
  ROUND(AVG(retail_recreation)) as avg_retail_recreation,
  ROUND(AVG(grocery_pharmacy)) as avg_grocery_pharmacy,
  ROUND(AVG(transit_stations)) as avg_transit_stations,
  ROUND(AVG(parks)) as avg_parks,
  ROUND(AVG(workplaces)) as avg_workplaces,
  ROUND(AVG(residential)) as avg_residential
FROM data_mobility_merged 
GROUP BY 
Month
ORDER BY
Month;


------------------------------------------------------------
-----------DONNÉES MOBILITÉ FRANCE -------------------------
------------------------------------------------------------

WITH confinement_periods AS (
    SELECT
        'France' AS country,
        DATE('2020-03-17') AS date_debut,
        DATE('2020-05-11') AS date_fin
    UNION ALL
    SELECT
        'France',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'France',
        DATE('2021-04-03'),
        DATE('2021-05-03')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-03-17'),
        DATE('2020-05-11')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'Germany',
        DATE('2021-04-03'),
        DATE('2021-05-03')
),
data_mobility AS (
    SELECT
        date,
        EXTRACT(YEAR FROM date) AS Year,
        EXTRACT(MONTH FROM date) AS Month,
        country_region,
        retail_and_recreation_percent_change_from_baseline AS retail_recreation,
        grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
        parks_percent_change_from_baseline AS parks,
        transit_stations_percent_change_from_baseline AS transit_stations,
        workplaces_percent_change_from_baseline AS workplaces,
        residential_percent_change_from_baseline AS residential
    FROM
        `bigquery-public-data.covid19_google_mobility.mobility_report`
    WHERE
        country_region IN ('France', 'Germany')
), data_mobility_merged AS (

SELECT
    m.date,
    m.Year,
    m.Month,
    m.country_region,
    m.retail_recreation,
    m.grocery_pharmacy,
    m.parks,
    m.transit_stations,
    m.workplaces,
    m.residential,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM confinement_periods cp
            WHERE m.country_region = cp.country
            AND m.date BETWEEN cp.date_debut AND cp.date_fin
        ) THEN 'confinement'
        ELSE 'non-confinement'
    END AS confinement_status
FROM
    data_mobility m
ORDER BY
    m.country_region, m.date
)
SELECT
  Month,
  ROUND(AVG(retail_recreation)) as avg_retail_recreation,
  ROUND(AVG(grocery_pharmacy)) as avg_grocery_pharmacy,
  ROUND(AVG(transit_stations)) as avg_transit_stations,
  ROUND(AVG(parks)) as avg_parks,
  ROUND(AVG(workplaces)) as avg_workplaces,
  ROUND(AVG(residential)) as avg_residential
FROM data_mobility_merged 
WHERE data_mobility_merged.country_region = 'France'
GROUP BY 
Month
ORDER BY
Month;

---------------------------------------------------
----------- 2. Analyse saisonnière : --------------
---------------------------------------------------

WITH confinement_periods AS (
    SELECT
        'France' AS country,
        DATE('2020-03-17') AS date_debut,
        DATE('2020-05-11') AS date_fin
    UNION ALL
    SELECT
        'France',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'France',
        DATE('2021-04-03'),
        DATE('2021-05-03')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-03-17'),
        DATE('2020-05-11')
    UNION ALL
    SELECT
        'Germany',
        DATE('2020-10-30'),
        DATE('2020-12-15')
    UNION ALL
    SELECT
        'Germany',
        DATE('2021-04-03'),
        DATE('2021-05-03')
),
data_mobility AS (
    SELECT
        date,
        EXTRACT(YEAR FROM date) AS Year,
        EXTRACT(MONTH FROM date) AS Month,
        country_region,
        retail_and_recreation_percent_change_from_baseline AS retail_recreation,
        grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
        parks_percent_change_from_baseline AS parks,
        transit_stations_percent_change_from_baseline AS transit_stations,
        workplaces_percent_change_from_baseline AS workplaces,
        residential_percent_change_from_baseline AS residential
    FROM
        `bigquery-public-data.covid19_google_mobility.mobility_report`
    WHERE
        country_region IN ('France', 'Germany')
), data_mobility_merged AS (

SELECT
    m.date,
    m.Year,
    m.Month,
    m.country_region,
    m.retail_recreation,
    m.grocery_pharmacy,
    m.parks,
    m.transit_stations,
    m.workplaces,
    m.residential,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM confinement_periods cp
            WHERE m.country_region = cp.country
            AND m.date BETWEEN cp.date_debut AND cp.date_fin
        ) THEN 'confinement'
        ELSE 'non-confinement'
    END AS confinement_status
FROM
    data_mobility m
ORDER BY
    m.country_region, m.date
)
SELECT
  Year,
  Month,
  ROUND(AVG(retail_recreation)) as avg_retail_recreation,
  ROUND(AVG(grocery_pharmacy)) as avg_grocery_pharmacy,
  ROUND(AVG(transit_stations)) as avg_transit_stations,
  ROUND(AVG(parks)) as avg_parks,
  ROUND(AVG(workplaces)) as avg_workplaces,
  ROUND(AVG(residential)) as avg_residential
FROM data_mobility_merged 
WHERE data_mobility_merged.country_region = 'France'
GROUP BY 
Year, Month
ORDER BY
Month;


---------------------------------------------------------------------------
---------------------------------------------------------------------------
-----------------------------TP2 BIGQUERY----------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------

-----------------------------------------------------------------
--------------- LISTE DES COLONNES ------------------------------

SELECT
  column_name
FROM
`bigquery-public-data.covid19_google_mobility.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'mobility_report';


--------- Exploration des données de la table mobility_report ---

SELECT
  *
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`
LIMIT
  10;

-- Nombre total d'enregistrements 11730025 lignes
SELECT
  COUNT(*)
FROM
  `bigquery-public-data.covid19_google_mobility.mobility_report`;


-------------------------------------------------------------------------
--------------Analyse des tendances de mobilité--------------------------
-------------------------------------------------------------------------
WITH pre_pandemic AS (
  SELECT
    country_region,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
    AND date BETWEEN '2020-01-01' AND '2020-02-29'
  GROUP BY country_region
),
post_pandemic AS (
  SELECT
    country_region,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
    AND date BETWEEN '2020-03-01' AND '2020-12-31'
  GROUP BY country_region
)
SELECT
  pre_pandemic.country_region,
  pre_pandemic.avg_retail_recreation AS pre_avg_retail_recreation,
  post_pandemic.avg_retail_recreation AS post_avg_retail_recreation,
  pre_pandemic.avg_grocery_pharmacy AS pre_avg_grocery_pharmacy,
  post_pandemic.avg_grocery_pharmacy AS post_avg_grocery_pharmacy,
  pre_pandemic.avg_parks AS pre_avg_parks,
  post_pandemic.avg_parks AS post_avg_parks,
  pre_pandemic.avg_transit_stations AS pre_avg_transit_stations,
  post_pandemic.avg_transit_stations AS post_avg_transit_stations,
  pre_pandemic.avg_workplaces AS pre_avg_workplaces,
  post_pandemic.avg_workplaces AS post_avg_workplaces,
  pre_pandemic.avg_residential AS pre_avg_residential,
  post_pandemic.avg_residential AS post_avg_residential
FROM pre_pandemic
JOIN post_pandemic
ON pre_pandemic.country_region = post_pandemic.country_region;


------------------------------------------------------
-------Focus sur France-Allemagne---------------------
------------------------------------------------------


-- France
WITH confinement_periods AS (
  SELECT 'France' AS country, DATE('2020-03-17') AS start_date, DATE('2020-05-11') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'France', DATE('2020-10-30'), DATE('2020-12-15'), 'Second Lockdown' UNION ALL
  SELECT 'France', DATE('2021-04-03'), DATE('2021-05-03'), 'Third Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region = 'France'
)
SELECT
  cp.period,
  md.date,
  md.retail_recreation,
  md.grocery_pharmacy,
  md.parks,
  md.transit_stations,
  md.workplaces,
  md.residential
FROM
  confinement_periods AS cp
JOIN
  mobility_data AS md
ON
  md.date BETWEEN cp.start_date AND cp.end_date
ORDER BY
  cp.period, md.date;

-- Germany
WITH confinement_periods AS (
  SELECT 'Germany' AS country, DATE('2020-03-22') AS start_date, DATE('2020-05-04') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'Germany', DATE('2020-11-02'), DATE('2020-12-20'), 'Second Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-12-16'), DATE('2021-03-28'), 'Strict Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region = 'Germany'
)
SELECT
  cp.period,
  md.date,
  md.retail_recreation,
  md.grocery_pharmacy,
  md.parks,
  md.transit_stations,
  md.workplaces,
  md.residential
FROM
  confinement_periods AS cp
JOIN
  mobility_data AS md
ON
  md.date BETWEEN cp.start_date AND cp.end_date
ORDER BY
  cp.period, md.date;


-- Allemagne - AVG
WITH confinement_periods AS (
  SELECT 'Germany' AS country, DATE('2020-03-22') AS start_date, DATE('2020-05-04') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'Germany', DATE('2020-11-02'), DATE('2020-12-20'), 'Second Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-12-16'), DATE('2021-03-28'), 'Strict Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region = 'Germany'
),
measure_impact AS (
  SELECT
    cp.period,
    md.date,
    md.retail_recreation,
    md.grocery_pharmacy,
    md.parks,
    md.transit_stations,
    md.workplaces,
    md.residential
  FROM
    confinement_periods AS cp
  JOIN
    mobility_data AS md
  ON
    md.date BETWEEN cp.start_date AND cp.end_date
)
SELECT
  period,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(grocery_pharmacy) AS avg_grocery_pharmacy,
  AVG(parks) AS avg_parks,
  AVG(transit_stations) AS avg_transit_stations,
  AVG(workplaces) AS avg_workplaces,
  AVG(residential) AS avg_residential
FROM
  measure_impact
GROUP BY
  period
ORDER BY
  period;

-- France -- AVG
WITH confinement_periods AS (
  SELECT 'France' AS country, DATE('2020-03-17') AS start_date, DATE('2020-05-11') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'France', DATE('2020-10-30'), DATE('2020-12-15'), 'Second Lockdown' UNION ALL
  SELECT 'France', DATE('2021-04-03'), DATE('2021-05-03'), 'Third Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region = 'France'
),
measure_impact AS (
  SELECT
    cp.period,
    md.date,
    md.retail_recreation,
    md.grocery_pharmacy,
    md.parks,
    md.transit_stations,
    md.workplaces,
    md.residential
  FROM
    confinement_periods AS cp
  JOIN
    mobility_data AS md
  ON
    md.date BETWEEN cp.start_date AND cp.end_date
)
SELECT
  period,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(grocery_pharmacy) AS avg_grocery_pharmacy,
  AVG(parks) AS avg_parks,
  AVG(transit_stations) AS avg_transit_stations,
  AVG(workplaces) AS avg_workplaces,
  AVG(residential) AS avg_residential
FROM
  measure_impact
GROUP BY
  period
ORDER BY
  period;



-- Comparaison - AVG
WITH confinement_periods AS (
  SELECT 'France' AS country, DATE('2020-03-17') AS start_date, DATE('2020-05-11') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'France', DATE('2020-10-30'), DATE('2020-12-15'), 'Second Lockdown' UNION ALL
  SELECT 'France', DATE('2021-04-03'), DATE('2021-05-03'), 'Third Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-03-22'), DATE('2020-05-04'), 'First Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-11-02'), DATE('2020-12-20'), 'Second Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-12-16'), DATE('2021-03-28'), 'Strict Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
),
measure_impact AS (
  SELECT
    cp.country,
    cp.period,
    md.date,
    md.retail_recreation,
    md.grocery_pharmacy,
    md.parks,
    md.transit_stations,
    md.workplaces,
    md.residential
  FROM
    confinement_periods AS cp
  JOIN
    mobility_data AS md
  ON
    md.country_region = cp.country
    AND md.date BETWEEN cp.start_date AND cp.end_date
)
SELECT
  country,
  period,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(grocery_pharmacy) AS avg_grocery_pharmacy,
  AVG(parks) AS avg_parks,
  AVG(transit_stations) AS avg_transit_stations,
  AVG(workplaces) AS avg_workplaces,
  AVG(residential) AS avg_residential
FROM
  measure_impact
GROUP BY
  country,
  period
ORDER BY
  country,
  period;



---------------------------------------------------
----------- 2. Analyse saisonnière : --------------
---------------------------------------------------

-- Données mobilité par mois et par années
WITH monthly_mobility AS (
  SELECT
    country_region,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
  GROUP BY country_region, year, month
  ORDER BY country_region, year, month
)
SELECT * FROM monthly_mobility;


-- France
-- Données mobilité par mois et par années
WITH monthly_mobility AS (
  SELECT
    country_region,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France')
  GROUP BY country_region, year, month
  ORDER BY country_region, year, month
)
SELECT * FROM monthly_mobility;



-- Calculer les Moyennes Mensuelles des Changements de Mobilité : 
-- Comment les déplacements dans les parcs ont-ils varié entre l'été et l'hiver ?

WITH seasonal_mobility AS (
  SELECT
    country_region,
    EXTRACT(YEAR FROM date) AS year,
    CASE
      WHEN EXTRACT(MONTH FROM date) IN (12, 1, 2) THEN 'Winter'
      WHEN EXTRACT(MONTH FROM date) IN (6, 7, 8) THEN 'Summer'
      ELSE NULL
    END AS season,
    AVG(parks_percent_change_from_baseline) AS avg_parks_change
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
  GROUP BY country_region, year, season
  HAVING season IS NOT NULL
)
SELECT
  country_region,
  season,
  AVG(avg_parks_change) AS avg_parks_change
FROM seasonal_mobility
GROUP BY country_region, season
ORDER BY country_region, season;


------------------------------------------------
-------Ipact sur le télétravail ---------------
-----------------------------------------------

WITH confinement_periods AS (
  SELECT 'France' AS country, DATE('2020-03-17') AS start_date, DATE('2020-05-11') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'France', DATE('2020-10-30'), DATE('2020-12-15'), 'Second Lockdown' UNION ALL
  SELECT 'France', DATE('2021-04-03'), DATE('2021-05-03'), 'Third Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-03-22') AS start_date, DATE('2020-05-04') AS end_date, 'First Lockdown' AS period UNION ALL
  SELECT 'Germany', DATE('2020-11-02'), DATE('2020-12-20'), 'Second Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-12-16'), DATE('2021-03-28'), 'Third Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    workplaces_percent_change_from_baseline AS workplaces
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
),
measure_impact AS (
  SELECT
    cp.country,
    cp.period,
    md.date,
    md.workplaces
  FROM
    confinement_periods AS cp
  JOIN
    mobility_data AS md
  ON
    md.country_region = cp.country
    AND md.date BETWEEN cp.start_date AND cp.end_date
)
SELECT
  country,
  period,
  AVG(workplaces) AS avg_workplaces_change
FROM
  measure_impact
GROUP BY
  country,
  period
ORDER BY
  country,
  period;

  --------------------------------------------
  ----ANalyse des jours de la semaine --------
  --------------------------------------------
-- Extraire les Jours de la Semaine et les Données de Mobilité :

WITH period_classification AS (
  SELECT
    country_region,
    date,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    CASE
      WHEN date <= '2020-03-15' THEN 'before_pandemic'
      ELSE 'after_pandemic'
    END AS period,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    workplaces_percent_change_from_baseline AS workplaces
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
)
SELECT
  country_region,
  period,
  day_of_week,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(workplaces) AS avg_workplaces
FROM
  period_classification
GROUP BY
  country_region,
  period,
  day_of_week
ORDER BY
  country_region,
  period,
  day_of_week;

------------------------------------------------
------5 Analyse saisonnière---------------------
------------------------------------------------
WITH seasonal_mobility AS (
  SELECT
    country_region,
    CASE
      WHEN EXTRACT(MONTH FROM date) IN (12, 1, 2) THEN 'Winter'
      WHEN EXTRACT(MONTH FROM date) IN (3, 4, 5) THEN 'Spring'
      WHEN EXTRACT(MONTH FROM date) IN (6, 7, 8) THEN 'Summer'
      WHEN EXTRACT(MONTH FROM date) IN (9, 10, 11) THEN 'Autumn'
    END AS season,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
  GROUP BY country_region, season
)
SELECT
  country_region,
  season,
  AVG(avg_retail_recreation) AS avg_retail_recreation,
  AVG(avg_grocery_pharmacy) AS avg_grocery_pharmacy,
  AVG(avg_parks) AS avg_parks,
  AVG(avg_transit_stations) AS avg_transit_stations,
  AVG(avg_workplaces) AS avg_workplaces,
  AVG(avg_residential) AS avg_residential
FROM seasonal_mobility
GROUP BY country_region, season
ORDER BY country_region, season;


----------------------------------
--- Analyse approfondie : --------
----------------------------------

---1 Analyse de la Mobilité par Région :

WITH regional_mobility AS (
  SELECT
    country_region,
    sub_region_1,
    sub_region_2,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
  GROUP BY country_region, sub_region_1, sub_region_2
  ORDER BY country_region, sub_region_1, sub_region_2
)
SELECT * FROM regional_mobility;


---Only Sub_region_1
WITH regional_mobility AS (
  SELECT
    country_region,
    sub_region_1,
    sub_region_2,
    AVG(retail_and_recreation_percent_change_from_baseline) AS avg_retail_recreation,
    AVG(grocery_and_pharmacy_percent_change_from_baseline) AS avg_grocery_pharmacy,
    AVG(parks_percent_change_from_baseline) AS avg_parks,
    AVG(transit_stations_percent_change_from_baseline) AS avg_transit_stations,
    AVG(workplaces_percent_change_from_baseline) AS avg_workplaces,
    AVG(residential_percent_change_from_baseline) AS avg_residential
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
  GROUP BY country_region, sub_region_1, sub_region_2
  ORDER BY country_region, sub_region_1, sub_region_2
)
SELECT country_region, 
       sub_region_1, 
       avg_retail_recreation, 
       avg_grocery_pharmacy,
       avg_parks, 
       avg_transit_stations,
       avg_workplaces,
       avg_residential
FROM regional_mobility
WHERE 
    regional_mobility.sub_region_2 IS NULL AND
    regional_mobility.sub_region_1 IS NOT NULL;

----------------------------------------
---- 2  Impact jours feriés ------------
WITH holidays AS (
  SELECT 'France' AS country, DATE '2020-01-01' AS holiday, 'Jour de l\'An' AS holiday_name UNION ALL
  SELECT 'France', DATE '2020-04-12', 'Pâques' UNION ALL
  SELECT 'France', DATE '2020-05-01', 'Fête du Travail' UNION ALL
  SELECT 'France', DATE '2020-05-08', 'Victoire 1945' UNION ALL
  SELECT 'France', DATE '2020-05-21', 'Ascension' UNION ALL
  SELECT 'France', DATE '2020-05-31', 'Pentecôte' UNION ALL
  SELECT 'France', DATE '2020-07-14', 'Fête Nationale' UNION ALL
  SELECT 'France', DATE '2020-08-15', 'Assomption' UNION ALL
  SELECT 'France', DATE '2020-11-01', 'Toussaint' UNION ALL
  SELECT 'France', DATE '2020-11-11', 'Armistice' UNION ALL
  SELECT 'France', DATE '2020-12-25', 'Noël' UNION ALL
  SELECT 'Germany' AS country, DATE '2020-01-01', 'Jour de l\'An' UNION ALL
  SELECT 'Germany', DATE '2020-04-10', 'Vendredi Saint' UNION ALL
  SELECT 'Germany', DATE '2020-04-12', 'Pâques' UNION ALL
  SELECT 'Germany', DATE '2020-05-01', 'Fête du Travail' UNION ALL
  SELECT 'Germany', DATE '2020-05-21', 'Ascension' UNION ALL
  SELECT 'Germany', DATE '2020-05-31', 'Pentecôte' UNION ALL
  SELECT 'Germany', DATE '2020-10-03', 'Fête Nationale' UNION ALL
  SELECT 'Germany', DATE '2020-12-25', 'Noël' UNION ALL
  SELECT 'Germany', DATE '2020-12-26', 'Saint-Étienne'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    workplaces_percent_change_from_baseline AS workplaces
  FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE country_region IN ('France', 'Germany')
),
holiday_mobility AS (
  SELECT
    md.country_region,
    h.holiday_name,
    h.holiday,
    md.date,
    md.retail_recreation,
    md.workplaces,
    CASE
      WHEN md.date <= '2020-03-15' THEN 'before_pandemic'
      ELSE 'after_pandemic'
    END AS period
  FROM
    holidays AS h
  JOIN
    mobility_data AS md
  ON
    md.country_region = h.country
    AND md.date = h.holiday
)
SELECT
  country_region,
  holiday_name,
  period,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(workplaces) AS avg_workplaces
FROM
  holiday_mobility
GROUP BY
  country_region,
  holiday_name,
  period
ORDER BY
  country_region,
  holiday_name,
  period;

-----------------------------------------------
-- Impact des Mesures de Santé Publique :------
-----------------------------------------------
WITH public_health_measures AS (
  SELECT 'France' AS country, DATE('2020-03-17') AS start_date, DATE('2020-05-11') AS end_date, 'First Lockdown' AS measure UNION ALL
  SELECT 'France', DATE('2020-10-30'), DATE('2020-12-15'), 'Second Lockdown' UNION ALL
  SELECT 'France', DATE('2020-12-15'), DATE('2021-05-03'), 'Curfew' UNION ALL
  SELECT 'Germany', DATE('2020-03-22'), DATE('2020-05-04'), 'First Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-11-02'), DATE('2020-12-20'), 'Partial Lockdown' UNION ALL
  SELECT 'Germany', DATE('2020-12-16'), DATE('2021-03-28'), 'Strict Lockdown'
),
mobility_data AS (
  SELECT
    country_region,
    date,
    retail_and_recreation_percent_change_from_baseline AS retail_recreation,
    grocery_and_pharmacy_percent_change_from_baseline AS grocery_pharmacy,
    parks_percent_change_from_baseline AS parks,
    transit_stations_percent_change_from_baseline AS transit_stations,
    workplaces_percent_change_from_baseline AS workplaces,
    residential_percent_change_from_baseline AS residential
  FROM
    `bigquery-public-data.covid19_google_mobility.mobility_report`
  WHERE
    country_region IN ('France', 'Germany')
    AND date BETWEEN '2020-01-01' AND '2021-12-31'
),
measure_impact AS (
  SELECT
    m.country,
    m.measure,
    md.date,
    md.retail_recreation,
    md.grocery_pharmacy,
    md.parks,
    md.transit_stations,
    md.workplaces,
    md.residential
  FROM
    public_health_measures AS m
  JOIN
    mobility_data AS md
  ON
    md.country_region = m.country
    AND md.date BETWEEN m.start_date AND m.end_date
)
SELECT
  country,
  measure,
  AVG(retail_recreation) AS avg_retail_recreation,
  AVG(grocery_pharmacy) AS avg_grocery_pharmacy,
  AVG(parks) AS avg_parks,
  AVG(transit_stations) AS avg_transit_stations,
  AVG(workplaces) AS avg_workplaces,
  AVG(residential) AS avg_residential
FROM
  measure_impact
GROUP BY
  country,
  measure
ORDER BY
  country,
  measure;

