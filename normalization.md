# 🧮 Database Normalization to Third Normal Form (3NF)

## 🎯 Objective

To ensure that the database schema adheres to the principles of **Third Normal Form (3NF)** by:

* Eliminating redundancy
* Ensuring every non-key attribute is functionally dependent **only** on the primary key
* Ensuring there are **no transitive dependencies**

---

## ✅ Step-by-Step Normalization Review

### 🧑 1. User Table

**Attributes**:
`user_id (PK)`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`

* **1NF**: All values are atomic ✅
* **2NF**: No partial dependencies (only one PK) ✅
* **3NF**: All attributes depend on the key and nothing else ✅

✅ **No changes needed.**

---

### 🏠 2. Property Table

**Attributes**:
`property_id (PK)`, `host_id (FK)`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`

* **1NF**: Atomic values ✅
* **2NF**: All non-key attributes depend on the whole PK (property\_id) ✅
* **3NF**: No transitive dependencies — `host_id` is a foreign key but not a transitive dependency ✅

✅ **No changes needed.**

---

### 📅 3. Booking Table

**Attributes**:
`booking_id (PK)`, `property_id (FK)`, `user_id (FK)`, `start_date`, `end_date`, `total_price`, `status`, `created_at`

* **1NF**: Atomic values ✅
* **2NF**: All non-key attributes fully depend on `booking_id` ✅
* **3NF**: No transitive dependencies — all values are directly dependent on the PK ✅

✅ **No changes needed.**

---

### 💳 4. Payment Table

**Attributes**:
`payment_id (PK)`, `booking_id (FK)`, `amount`, `payment_date`, `payment_method`

* **1NF**: Atomic values ✅
* **2NF**: No partial dependency ✅
* **3NF**: All attributes directly depend on `payment_id`; no transitive dependency ✅

✅ **No changes needed.**

---

### ⭐ 5. Review Table

**Attributes**:
`review_id (PK)`, `property_id (FK)`, `user_id (FK)`, `rating`, `comment`, `created_at`

* **1NF**: Atomic values ✅
* **2NF**: All fields fully depend on `review_id` ✅
* **3NF**: `rating`, `comment` are directly related to `review_id`, no transitive dependencies ✅

✅ **No changes needed.**

---

### ✉️ 6. Message Table

**Attributes**:
`message_id (PK)`, `sender_id (FK)`, `recipient_id (FK)`, `message_body`, `sent_at`

* **1NF**: Atomic values ✅
* **2NF**: All non-key attributes depend on `message_id` ✅
* **3NF**: No transitive dependencies ✅

✅ **No changes needed.**

---

## 🧾 Conclusion

The schema already follows 3NF:

* Each table has a **primary key**.
* **No repeating groups** or multi-valued fields.
* All **non-key attributes are fully functionally dependent** on the primary key.
* No **transitive dependencies**.
