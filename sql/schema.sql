CREATE TABLE Passenger (
    Passenger_id INT PRIMARY KEY,
    Nationality VARCHAR2(50),
    Fname VARCHAR2(50) NOT NULL,
    Mname VARCHAR2(50),
    Lname VARCHAR2(50) NOT NULL,
    PassportNum VARCHAR2(30),
    PhoneNum VARCHAR2(20)
);

CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    Payment_status NUMBER(1) NOT NULL, -- 1=Paid, 0=Unpaid
    Amount NUMBER(10) DEFAULT 0,
    Payment_date DATE,
    Payment_method VARCHAR2(10),
    CONSTRAINT chk_payment_status CHECK (Payment_status IN (0, 1))
);

CREATE TABLE Airplane (
    Airplane_id INT PRIMARY KEY,
    Model VARCHAR2(20) NOT NULL,
    Manufacturer VARCHAR2(100) NOT NULL,
    Capacity INT NOT NULL
);

CREATE TABLE Airport (
    Airport_code VARCHAR2(4) PRIMARY KEY,
    Country VARCHAR2(100) NOT NULL,
    City VARCHAR2(100) NOT NULL,
    Name VARCHAR2(50) NOT NULL
);

CREATE TABLE Employee (
    Employee_id NUMBER(20) PRIMARY KEY,
    FName VARCHAR2(10) NOT NULL,
    MName VARCHAR2(10),
    LName VARCHAR2(10) NOT NULL,
    Email VARCHAR2(500) UNIQUE,
    Salary NUMBER(10) NOT NULL,
    Job_title VARCHAR2(20) NOT NULL,
    Phone_number VARCHAR2(12),
    Country VARCHAR2(100) NOT NULL,
    City VARCHAR2(100) NOT NULL,
    Street VARCHAR2(100) NOT NULL,
    zip_code NUMBER(6)
);

CREATE TABLE Flight (
    Flight_id INT PRIMARY KEY,
    Flight_status VARCHAR2(10),
    Arrival_DateTime DATE,
    Departure_DateTime DATE,
    Duration VARCHAR2(50),
    Airplane_id NUMBER(10),
    Arrival_Airport VARCHAR2(4),
    Departure_Airport VARCHAR2(4)
);

CREATE TABLE Reservation (
    Reservation_id INT PRIMARY KEY,
    Seat_code VARCHAR2(6),
    Price NUMBER(10) NOT NULL,
    Reservation_date DATE NOT NULL,
    Passenger_id NUMBER(10),
    Payment_id NUMBER(10),
    Flight_id NUMBER(10)
);

CREATE TABLE Flight_Crew (
    Employee_id NUMBER(10),
    Flight_id NUMBER(10),
    role_in_flight VARCHAR2(100) NOT NULL,
    PRIMARY KEY (Employee_id, Flight_id)
);
