# Arrano_Summer_Internship_Interview_Technical_Task

In this task, there are 2 parts: Python Code for extracting data and SQL Queries for answering some questions.

## Python Code

Thy Python code is written in Jupyter Notebook for a better visualization of the dataframe obtained from the API. There are 3 main stages in the code:

### Stage 1: Settings

### Stage 2: Create the first database "address" with token_id and contract_address

### Stage 3: Create the second database "market" with token_id, date, time, price and volume

## SQL Queries

In this part, we we will first see the Entity Relationship (ER) Diagram of the database. Then, we will first see how SQL query query_for_3_questions.sql could answer the questions in the instruction.

### ER Diagram



### How do the SQL query answer the questions?
```
sqlite3 crypto_data.db < query_for_3_questions.sql
```

After storing the data in the database named crypto_data.db, we could run the above command for the answers to the following questions:

- For a given ERC-20 token address, what was its volume last week?
- For a given symbol, what is its token address?
- For a given symbol, what is the 24-hour price moving average over the last month?

