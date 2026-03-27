-- 9.1 Booked and available seats per flight
-- Shows each flight's total capacity, booked seats, and available seats
-- based on successful payments.

SELECT 
    f.flight_id,
    a.capacity AS total_capacity,
    COUNT(r.reservation_id) AS booked_seats,
    (a.capacity - COUNT(r.reservation_id)) AS available_seats
FROM Flight f
JOIN Airplane a ON f.airplane_id = a.airplane_id
LEFT JOIN Reservation r ON f.flight_id = r.flight_id
LEFT JOIN Payment p ON r.payment_id = p.payment_id
WHERE p.payment_status = 1
GROUP BY f.flight_id, a.capacity;


-- 9.2 List of Employees that work in most flights
-- Retrieves the employee(s) assigned to the highest number of flights.

SELECT employee_id, name, job_title, flight_count
FROM (
    SELECT 
        e.employee_id,
        e.fname || ' ' || e.lname AS name,
        e.job_title,
        COUNT(fc.flight_id) AS flight_count
    FROM Employee e
    JOIN Flight_Crew fc ON e.employee_id = fc.employee_id
    GROUP BY e.employee_id, e.fname, e.lname, e.job_title
    HAVING COUNT(fc.flight_id) = (
        SELECT MAX(emp_count)
        FROM (
            SELECT COUNT(*) AS emp_count
            FROM Flight_Crew
            GROUP BY employee_id
        )
    )
);


-- 9.3 Flights with at Least One Cancelled Reservation
-- Retrieves flights that have at least one reservation with a failed payment
-- and shows the arrival and departure airport names.

SELECT 
    f.flight_id,
    arr.name AS arrival_airport,
    dep.name AS departure_airport
FROM Flight f
JOIN Airport arr ON f.arrival_airport = arr.airport_code
JOIN Airport dep ON f.departure_airport = dep.airport_code
WHERE EXISTS (
    SELECT 1
    FROM Reservation r
    JOIN Payment p ON r.payment_id = p.payment_id
    WHERE r.flight_id = f.flight_id
      AND p.payment_status = 0
);


-- 9.4 Get all passengers who paid more than the average payment amount
-- Retrieves successful payments where the amount is greater than the
-- average amount of successful payments.

SELECT payment_id, amount, payment_method
FROM Payment
WHERE payment_status = 1
  AND amount > (
      SELECT AVG(amount)
      FROM Payment
      WHERE payment_status = 1
  )
ORDER BY amount DESC;


-- 9.5 Total Price for each flight
-- Calculates the total successful payment amount for each flight
-- and shows the arrival and departure airport names.

SELECT 
    f.flight_id,
    arr.name AS arrival_airport,
    dep.name AS departure_airport,
    SUM(p.amount) AS total_price
FROM Flight f
JOIN Airport arr ON f.arrival_airport = arr.airport_code
JOIN Airport dep ON f.departure_airport = dep.airport_code
JOIN Reservation r ON f.flight_id = r.flight_id
JOIN Payment p ON r.payment_id = p.payment_id
WHERE p.payment_status = 1
GROUP BY f.flight_id, arr.name, dep.name
ORDER BY f.flight_id;


-- 9.6 Employees Not Assigned to Any Flight
-- Retrieves employees who do not appear in the Flight_Crew table.

SELECT 
    employee_id,
    fname || ' ' || lname AS name,
    salary,
    job_title
FROM Employee
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM Flight_Crew
)
ORDER BY employee_id;
