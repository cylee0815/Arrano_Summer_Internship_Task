# Arrano_Summer_Internship_Interview_Technical_Task

## Python Code



## SQL Queries

In this part, we we will first see the ER diagram of the database. Then, we will first see how SQL query query_for_3_questions.sql could answer the questions in the instruction.

### ER Diagram



### How do the SQL query answer the questions?
```
sqlite3 crypto_data.db < query_for_3_questions.sql
```

After storing the data to the database named crypto_data.db, we could run the above command for the answer to the following questions:

- For a given ERC-20 token address, what was it's volume last week?
- For a given symbol, what is it's token address?
- For a given symbol, what is the 24 hour price moving average over the last month?

