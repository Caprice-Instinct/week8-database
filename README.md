# DATABASE WEEK 8 ASSIGNMENT

## QUESTION ONE

## Clinic Management System Database

This repository contains **question1.sql**, a MySQL script that:

- Creates the `clinic` database
- Defines five tables with appropriate constraints (PK, FK, NOT NULL, UNIQUE):
  - **departments**
  - **doctors**
  - **patients**
  - **appointments**
  - **prescriptions**
- Establishes relationships
  - 1–many: departments → doctors
  - 1–many: patients → appointments
  - 1–many: doctors → appointments
  - 1–many: appointments → prescriptions
- Populates each table with realistic sample data

### Tables Overview

| Table             | Purpose                                                |
| ----------------- | ------------------------------------------------------ |
| **departments**   | Clinic departments (e.g. General Medicine, Pediatrics) |
| **doctors**       | Doctors, linked to departments                         |
| **patients**      | Patient records                                        |
| **appointments**  | Bookings linking patients and doctors                  |
| **prescriptions** | Medicines prescribed per appointment                   |

All constraints ensure data integrity and a clear relational structure.

## QUESTION TWO

# Contact Book CRUD API

This repository implements a simple Contact Book API using Node.js, Express, and MySQL.

## Database Schema

- **users**

  - `user_id` (INT, PK, Auto-Increment)
  - `username` (VARCHAR, Not Null, Unique)
  - `email` (VARCHAR, Not Null, Unique)

- **contacts**
  - `contact_id` (INT, PK, Auto-Increment)
  - `user_id` (INT, FK → `users.user_id`)
  - `name` (VARCHAR, Not Null)
  - `phone` (VARCHAR)
  - `email` (VARCHAR)

## API Endpoints

| Method | Endpoint        | Description            |
| ------ | --------------- | ---------------------- |
| GET    | `/`             | Health check           |
| POST   | `/users`        | Create a new user      |
| GET    | `/users`        | Retrieve all users     |
| POST   | `/contacts`     | Add a new contact      |
| GET    | `/contacts`     | Retrieve all contacts  |
| PUT    | `/contacts/:id` | Update a contact by ID |
| DELETE | `/contacts/:id` | Delete a contact by ID |

All routes return JSON and enforce data integrity via primary key, foreign key, NOT NULL, and UNIQUE constraints.
