CREATE DATABASE HotelDB;

CREATE SCHEMA hotel;

-- Tạo bảng RoomTypes
Create Table hotel.RoomTypes (
room_type_id SERIAL Primary Key,
type_name VARCHAR(50) NOT NULL UNIQUE,
price_per_night NUMERIC(10,2) CHECK (price_per_night>0),
max_capacity INT CHECK (max_capacity>0)
);

-- Tạo bảng Rooms
Create Table hotel.Rooms (
room_id SERIAL Primary Key,
room_number VARCHAR(10) NOT NULL UNIQUE,
room_type_id INT,
status VARCHAR(20) CHECK (status IN ('Available','Occupied','Maintenance')),
Foreign Key (room_type_id) References hotel.RoomTypes(room_type_id)
);

-- Tạo bảng Customers
Create Table hotel.Customers (
customer_id SERIAL Primary Key,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(15) NOT NULL
);

-- Tạo bảng Bookings
Create Table hotel.Bookings (
booking_id SERIAL Primary Key,
customer_id INT,
room_id INT,
check_in DATE NOT NULL,
check_out DATE NOT NULL,
status VARCHAR(20) CHECK (status IN ('Pending','Confirmed','Cancelled')),
Foreign Key (customer_id) References hotel.Customers(customer_id),
Foreign Key (room_id) References hotel.Rooms(room_id)
);

-- Tạo bảng Payments
CREATE TABLE hotel.Payments (
payment_id SERIAL PRIMARY KEY,
booking_id INT,
amount NUMERIC(10,2) CHECK (amount >= 0),
payment_date DATE NOT NULL,
method VARCHAR(20) CHECK (method IN ('Credit Card', 'Cash', 'Bank Transfer')),
FOREIGN KEY (booking_id) REFERENCES hotel.Bookings(booking_id)
);