-- Insert sample data into User table
INSERT INTO User (
    user_id, 
    first_name, 
    last_name, 
    email, 
    password_hash, 
    phone_number, 
    role, 
    created_at)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Anderson', 'alice@example.com', 'hashed_pass1', '1234567890', 'guest', CURRENT_TIMESTAMP),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Baker', 'bob@example.com', 'hashed_pass2', '0987654321', 'host', CURRENT_TIMESTAMP),
  ('33333333-3333-3333-3333-333333333333', 'Charlie', 'Clark', 'charlie@example.com', 'hashed_pass3', '1122334455', 'admin', CURRENT_TIMESTAMP);

-- Insert sample data into Property table
INSERT INTO Property (
    property_id, 
    host_id, 
    name, 
    description, 
    location, 
    pricepernight, 
    created_at, 
    updated_at)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cabin', 'A cozy cabin in the woods.', 'Evergreen, CO', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Beach House', 'A sunny beach house.', 'Malibu, CA', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data into Booking table
INSERT INTO Booking (
    booking_id, 
    property_id, 
    user_id, 
    start_date, 
    end_date, 
    total_price, 
    status, 
    created_at)
VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', '2025-07-10', '2025-07-12', 500.00, 'pending', CURRENT_TIMESTAMP);

-- Insert sample data into Payment table
INSERT INTO Payment (
    payment_id, 
    booking_id, 
    amount, 
    payment_date, 
    payment_method)
VALUES
  ('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 500.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample data into Review table
INSERT INTO Review (
    review_id, 
    property_id, 
    user_id, 
    rating, 
    comment, 
    created_at)
VALUES
  ('ddddddd1-dddd-dddd-dddd-ddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay, very cozy and quiet!', CURRENT_TIMESTAMP),
  ('ddddddd2-dddd-dddd-dddd-ddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111111', 4, 'Great location, would visit again.', CURRENT_TIMESTAMP);

-- Insert sample data into Message table
INSERT INTO Message (
    message_id, 
    sender_id, 
    recipient_id, 
    message_body, 
    sent_at)
VALUES
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I’m interested in your cabin. Is it available next month?', CURRENT_TIMESTAMP),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, yes it’s available from June 1 to June 5.', CURRENT_TIMESTAMP);
