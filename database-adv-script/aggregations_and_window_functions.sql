--- Bookings per user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;
-- ---------- ------ -

-- Total numbe of bookings
WITH bookings AS (
    SELECT
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS number_of_bookings
    FROM
        properties p
    LEFT JOIN
        booking b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    property_name,
    number_of_bookings,
    RANK() OVER (ORDER BY number_of_bookings DESC) AS property_rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY number_of_bookings DESC) AS property_row_number_by_bookings
FROM
    bookings
ORDER BY
    property_rank_by_bookings, property_name

