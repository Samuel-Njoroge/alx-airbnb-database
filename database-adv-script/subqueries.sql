-- Properties with AVG(rating) > 4.0
SELECT
    p.property_id,
    p.name,
    p.description,
    p.location,
    p.price_per_night
FROM property p
WHERE 
    (
        SELECT 
            AVG(r.rating)
        FROM review r
        WHERE r.property_id = p.property_id
    ) > 4.0 ;
------------------------------------

-- Users with  > 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM user u
WHERE
    (
        SELECT
            COUNT (*)
        FROM booking b
        WHERE b.user_id = u.user_id
    ) > 3;
------------------------------------