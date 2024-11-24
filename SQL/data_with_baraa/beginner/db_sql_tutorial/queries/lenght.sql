SELECT
	last_name,
    TRIM(last_name) AS clean_last_name,
    length(last_name) AS len_last_name,
    length(trim(last_name)) AS clean_len_trim_last_name
FROM customers