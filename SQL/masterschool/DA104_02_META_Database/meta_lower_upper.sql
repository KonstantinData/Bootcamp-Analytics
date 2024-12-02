SELECT DISTINCT LOWER(industry) AS industry, LOWER(sector) AS sector
FROM meta_clients
ORDER BY industry DESC;

SELECT DISTINCT
    LOWER(
        CASE 
            WHEN LOWER(industry) = 'retail & consumer good' THEN 'retail & consumer goods'
            WHEN LOWER(industry) = 'rcg' THEN 'retail & consumer goods'
            WHEN LOWER(industry) = 'retail' THEN 'retail & consumer goods'
            ELSE industry
        END
    ) AS industry,
    LOWER(sector) AS sector
FROM meta_clients
ORDER BY industry;