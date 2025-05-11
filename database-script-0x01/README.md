The script creates the following tables:

- **1. User**: Stores user details, including `first name, last name, email, password hash, phone number, and role (guest, host, admin)`.
- **2. Property**: Stores property details, including `property name, description, location, price per night, and the host (foreign key to the User table)`.
- **3. Booking**: Stores booking information, linking users to properties with `booking dates, total price, and booking status`.
- **4. Payment**: Stores payment information linked to bookings, including `payment method and amount`.
- **5. Review**: Stores reviews for properties, including `rating and comments from users`.
- **6. Message**: Stores messages between `users (host and guest)`.

Indexes are created for commonly queried columns for performance optimization, such as `email` in the `User` table and `property_id` in the `Property` and `Booking` tables.
