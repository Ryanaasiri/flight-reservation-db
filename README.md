# Flight Reservation and Management System

A relational database project for designing and implementing a Flight Reservation and Management System using SQL.

## Overview
This project models an airline reservation system that handles flight bookings, passenger records, payments, airplane assignments, airport information, and employee crew assignments.

The system is designed to support airline operations in a structured way by organizing reservation data, tracking payment details, managing flight schedules, assigning airplanes to flights, and linking employees to specific flight roles.

## Main Entities
- Passenger
- Payment
- Reservation
- Flight
- Employee
- Airport
- Airplane
- Flight_Crew

## Business Rules
- A reservation cannot be confirmed unless a successful payment has been made.
- A payment may include more than one reservation.
- A reservation cannot be split into more than one payment.
- A flight must have both a departure airport and an arrival airport.
- A flight should be managed by exactly one airplane.
- An employee can work on multiple flights, and each flight can have multiple employees.
- An employee’s general job title may differ from their assigned role in a specific flight.

## Design Notes
The schema follows basic normalization principles:
- 1NF by keeping attribute values atomic
- 2NF in the `Flight_Crew` table using a composite key
- 3NF by moving airport location data to the `Airport` table instead of storing it in `Flight`

## Repository Structure
- `diagrams/erd.png` → ER diagram
- `diagrams/schema-diagram.png` → final schema diagram
- `sql/schema.sql` → table creation statements
- `sql/relationships.sql` → foreign keys and relationship constraints
- `sql/sample_data.sql` → sample insert statements
- `sql/queries.sql` → analytical SQL queries
- `screenshots/` → example query outputs

## Example Queries
- Booked and available seats per flight
- Employees assigned to the highest number of flights
- Flights with at least one cancelled reservation
- Passengers who paid more than the average payment amount
- Total price for each flight
- Employees not assigned to any flight

## How to Run
1. Run `sql/schema.sql`
2. Run `sql/relationships.sql`
3. Run `sql/sample_data.sql`
4. Run `sql/queries.sql`
