## 1. Frequently Used Queries

### Query A: Get all bookings for a user
```sql
SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

### Query B: Retrieve bookings within a date range
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
```

### Query C: Join bookings with payments

```sql
SELECT b.booking_id, pay.amount
FROM Booking b
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```

## 📊 2. Analyze with EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = '5taat-uai23hsh-dgs5';
```

### Output

    Seq Scan on Booking  (cost=0.00..10234.00 rows=500 width=244)
    Filter: (user_id = 'some-user-id')
    Execution Time: 65.122 ms

## 🚨 Problem:
- Sequential scan detected.
- Query performance degrades as the table grows.

## 🛠 3. Suggested Schema Improvements

1. 🧩 A. Add Missing Indexes
```sql
-- Index for filtering by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for date range filter
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index for JOIN operation
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

🧩 2. Partitioning 
🧪 3. Retest with EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-user-id';
```

4. Improved Output:

    Index Scan using idx_booking_user_id on Booking  (cost=0.45..8.67 rows=5 width=244)
    Execution Time: 1.123 ms

## ✅ Improvement:
- Sequential scan replaced by index scan
- Execution time reduced from 65ms to 1ms


# 📈 Performance Refinement Report

## 🔍 Objective:
Continuously monitor and optimize database queries using execution plans and schema improvements.

## 🧪 Queries Analyzed:
1. Filter bookings by `user_id`
2. Filter bookings by `start_date`
3. Join bookings with payments

## 📊 Observations (Before Optimization):
- Sequential scans on large tables
- High execution times (e.g., 65ms on ~100k rows)
- No indexes on filtering columns

## 🛠 Actions Taken:
- Added indexes on:
  - Booking(user_id)
  - Booking(start_date)
  - Payment(booking_id)
- Verified improvements with `EXPLAIN ANALYZE`

## 🚀 Results (After Optimization):
- Index scans replaced sequential scans
- Execution time reduced by up to **95%**


## ✅ Recommendation:
- Periodically run `EXPLAIN ANALYZE` on slow queries
- Continuously review query plans and expand indexing as needed
- Consider advanced techniques like materialized views for read-heavy operations
