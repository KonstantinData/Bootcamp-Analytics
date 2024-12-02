-- Substring
SELECT SUBSTR(client_id, 8)::INTEGER AS client_id
FROM meta_clients
ORDER BY SUBSTR(client_id, 8)::INTEGER;

-- Substring in subquery
SELECT 
		MAX(clean_client_id) AS max_client_id,
    MIN(clean_client_id) AS min_client_id
FROM (SELECT SUBSTRING(client_id, 8) AS clean_client_id
      FROM meta_clients
) AS clean_meta_clients

--Substring with regex
SELECT
    SUBSTRING(industry FROM '\w+') AS first_word
FROM meta_clients;