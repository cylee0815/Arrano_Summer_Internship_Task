-- print the column name
.header ON
-- open the database created by Python code 
.open crypto_data.db

-- Question 1: For a given ERC-20 token address, what was it's volume last week?
SELECT symbol, sum(volume) as total_volume_last_week FROM market WHERE date >= "2020-05-23" 
		AND date <= "2021-05-30" 
        AND symbol = (select coin.token_id from address coin where coin.contract_address = '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48');
-- As the data on May 31st is not complete, I decided to return the volume last week for May 30th.

-- In general, the SQL query for a given ERC-20 token address could be:
-- SELECT symbol, sum(volume) as total_volume_past_n_days FROM market WHERE date >= <start_date> 
-- AND date <= <end_date> AND symbol = (select coin.token_id from address coin where coin.contract_address = <token_address>);

-- Question 2: For a given symbol, what is it's token address?
SELECT contract_address FROM address WHERE token_id = "binance-usd";

-- In general, the SQL query for a given symbol could be:
-- SELECT contract_address FROM address WHERE token_id = <symbol>;

-- Question 3: For a given symbol, what is the 24 hour price moving average over the last month?
SELECT symbol, date, time, avg(price) over(order by date, time
	ROWS between 23 preceding and current row ) 
	as twenty_four_hour_moving_average
	FROM market
	WHERE symbol = "tether"
	AND date >= "2021-04-30" -- today - 30 days - 1 day
	AND date <= "2021-05-30" -- today
	LIMIT 24, 720; -- drop the first 24 entries as they are not 24-hour moving average, 
				   -- and select the remaining 720 (30 days * 24 entries per day) entries
    
-- In general, the SQL query for the n hour price moving average over the past m days a given symbol could be:
/* SELECT symbol, date, time, avg(price) over(order by date, time 
	ROWS between n-1 preceding and current row ) 
	as n_hour_moving_average
	FROM market
	WHERE symbol = <symbol>
	AND date >= <(today - m days - [n/24] days)>
	AND date <= <today>
	LIMIT n, m * 24; */