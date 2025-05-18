-- Step 1: Rename the original Booking table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create new partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions for the first three months of 2025
CREATE TABLE Booking_2025_01 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE Booking_2025_02 PARTITION OF Booking
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03 PARTITION OF Booking
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Step 4: Copy data from the old table into the new partitioned structure
INSERT INTO Booking
SELECT * FROM Booking_old;

