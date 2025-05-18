
# 🚀 Optimization Report: Booking Query

## 📝 Initial Query Description
The query retrieves all bookings with corresponding user, property, and payment details using JOINs.

### Initial Query (perfomance.sql)
```sql
SELECT ...
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```

## 📊 Performance Analysis Using EXPLAIN

### Findings:
- **JOINs on large tables** like Booking, User, and Property led to high memory and disk I/O usage.
- **Sequential scans** on Booking and Payment observed due to lack of supporting indexes.
- LEFT JOIN with Payment included many NULL rows, increasing result set size unnecessarily.

## 🛠 Recommendations & Refactor

### 1. Index Recommendations
```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

### 2. Refactored Query
Only retrieve relevant fields and avoid unnecessary joins when not all columns are needed.

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```

### 📉 Expected Improvements
- **Improved lookup speed** by using indexes on foreign keys.
- **Reduced memory usage** by narrowing selected columns.
- **Faster execution** due to more efficient query plan and filtered data access.


