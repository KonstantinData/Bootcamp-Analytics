SELECT
	last_name,
	substring(last_name, 1,3) AS substring_last_name,
    substring(TRIM(last_name), 1,3) AS clean_substring_last_name
FROM customers