# Arrano Summer Internship Interview Technical Task

In this task, there are 2 parts: Python Code for extracting data and SQL Queries for answering some questions.

## Python Code

The Python code is written in Jupyter Notebook for a better visualization of the dataframe obtained from the API. There are 3 main stages in the code:

### Stage 1: Settings

This stage includes Steps 0, 1, 2, and 5. For Steps 0 and 1, I imported the libraries and check the API status. As for Step 2, I wrote a helper function for timestamp convertion. Finally, for Step 5, I closed the connection to databases.

### Stage 2: Create the first database "address" with token_id and contract_address

This stage includes Step 3 only. In this stage, I manually selected the coins satisfying the following 2 conditions.

- The coin is ranked top 80 on Coingekco by Market Cap.
- The coin is Etherum-based, i,e., the coin has a unique contract address.

Next, I applied get_coin_by_id() method and extracted the value from the key "contract_address" in the dictionary for every coin. Then, I stored the (coin symbol, contract address) pairs in my dictionary.

Finally, I converted the dictionary to the pandas DataFrame and stored it to the SQL database.

### Stage 3: Create the second database "market" with token_id, date, time, price and volume

This stage includes Step 4 only.

## SQL Queries

In this part, we we will first see the Entity Relationship (ER) Diagram of the database. Then, we will first see how SQL query query_for_3_questions.sql could answer the questions in the instruction.

### ER Diagram

![alt text](https://imgur.com/a/cpp3W1x)

### How do the SQL query answer the questions?
```
sqlite3 crypto_data.db < query_for_3_questions.sql
```

After storing the data in the database named crypto_data.db, we could run the above command for the answers to the following questions:

- For a given ERC-20 token address, what was its volume last week?
- For a given symbol, what is its token address?
- For a given symbol, what is the 24-hour price moving average over the last month?

