-- All bookings with their users
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.password_hash,
    u.phone_number,
    u.role,
    u.created_at
FROM booking b 
INNER JOIN user u 
    ON b.user_id = u.user_id 

--------------------------------

-- All properties and their reviews
SELECT
    p.property_id,
    p.host_id,
    p.name,
    p.description,
    p.location,
    p.pricepernight,
    p.created_at,
    p.updated_at
    r.review_id,
    r.property_id,
    r.user_id,
    r.rating,
    r.comment,
    r.created_at
FROM property p
LEFT JOIN review r
    ON p.property_id = r.property_id
ORDER BY p.property_id ASC
-----------------------------------

-- All users and all bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.password_hash,
    u.phone_number,
    u.role,
    u.created_at,
    b.booking_id,
    b.property_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at
FROM user u   
FULL OUTER JOIN booking b
    ON b.user_id = u.user_id 

-----------------------------