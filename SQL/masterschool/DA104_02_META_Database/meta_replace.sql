SELECT DISTINCT REPLACE(TRIM(region), '.', '') AS region
FROM meta_clients
ORDER BY region;

SELECT
    REPLACE(region, '.', '') AS region
FROM meta_clients
ORDER BY region;