-- Indexes on User table
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_role ON "User"(role);

-- Indexes on Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Indexes on Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_created_at ON Property(created_at);


-- Filter Bookings by Status and Date Range
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE status = 'confirmed'
AND created_at BETWEEN '2024-01-01' AND '2024-12-31';

-- Join User and Booking by `user_id`
EXPLAIN ANALYZE
SELECT u.first_name, u.email, b.total_price
FROM "User" u
JOIN Booking b ON u.user_id = b.user_id;