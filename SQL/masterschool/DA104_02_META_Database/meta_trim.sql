SELECT DISTINCT 
    CASE 
        WHEN LOWER(TRIM(industry)) = 'rcg' THEN 'retail & consumer goods'
        WHEN LOWER(TRIM(industry)) = 'retail' THEN 'retail & consumer goods'
        WHEN LOWER(TRIM(industry)) = 'retail ' THEN 'retail & consumer goods'
        WHEN LOWER(TRIM(industry)) = 'consumer goods' THEN 'retail & consumer goods'
        ELSE LOWER(TRIM(industry))
    END AS industry,
    
    CASE 
        WHEN LOWER(TRIM(sector)) = 'consumers goods' THEN 'consumer goods'
        ELSE LOWER(TRIM(sector))
    END AS sector
FROM meta_clients
ORDER BY industry DESC;


SELECT
		TRIM('Client_' FROM client_id) AS client_id
FROM meta_clients


SELECT
		TRIM(LEADING 'Client_' FROM client_id) AS client_id
FROM meta_clients