ALTER TABLE Reservation
ADD CONSTRAINT fk_reservation_passenger
FOREIGN KEY (Passenger_id) REFERENCES Passenger(passenger_id)
ON DELETE CASCADE;

ALTER TABLE Reservation
ADD CONSTRAINT fk_reservation_payment
FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
ON DELETE CASCADE;

ALTER TABLE Reservation
ADD CONSTRAINT fk_reservation_flight
FOREIGN KEY (Flight_id) REFERENCES Flight(flight_id)
ON DELETE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT fk_flight_airplane
FOREIGN KEY (airplane_id) REFERENCES Airplane(airplane_id)
ON DELETE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT fk_flight_arrival
FOREIGN KEY (Arrival_Airport) REFERENCES Airport(airport_code)
ON DELETE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT fk_flight_departure
FOREIGN KEY (departure_Airport) REFERENCES Airport(airport_code)
ON DELETE CASCADE;

ALTER TABLE Flight_crew
ADD CONSTRAINT fk_crew_employee
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
ON DELETE CASCADE;

ALTER TABLE Flight_crew
ADD CONSTRAINT fk_crew_flight
FOREIGN KEY (Flight_id) REFERENCES Flight(flight_id)
ON DELETE CASCADE;
