# Library Management System

A full-stack web application for managing library operations, book catalogs, member borrowing, and overdue fines, built with **Spring Boot** and **Angular**.

---

## Features

- **Spring Security & JWT**: Role-based authentication (`ROLE_ADMIN` and `ROLE_STUDENT`) with BCrypt password hashing.
- **100-Book Catalog**: Curated collection across Engineering, AI/CS, and 24 classic & sci-fi Novels (including *Dune*, *1984*, *Foundation*).
- **Physical Shelf Locator**: Interactive aisle, shelf, and rack coordinates for library inventory.
- **Automated Borrowing Simulation**: 30 active student profiles with realistic borrowing histories matching departments.
- **Fine Management in INR (₹)**: Automated tracking of overdue returns, damaged books, and UPI / Card / Cash settlement.
- **Student ID Governance**: Automatic lockout for inactive accounts with admin reactivation controls.

---

## Tech Stack

- **Backend**: Java 17, Spring Boot 3, Spring Security 6, JWT, Spring Data JPA, Hibernate, MySQL 8
- **Frontend**: Angular 17, TypeScript, Bootstrap 5
- **Build Tools**: Apache Maven, npm

---

## Project Structure

```text
library-management-system/
├── backend/                  # Spring Boot REST API & Security Services
│   ├── src/                  # Controllers, Services, Repositories, Entities, DTOs
│   └── pom.xml               # Maven configuration and dependencies
├── frontend/                 # Angular Single-Page Application
│   ├── src/                  # Components, services, guards, and interceptors
│   └── package.json          # Node dependencies and scripts
├── .gitignore                # Git ignore rules
└── README.md                 # Project documentation
```

---

## Getting Started

### Prerequisites
- **Java JDK 17+**
- **Node.js 18+** & npm
- **MySQL 8+** (or configured database)
- **Apache Maven 3.8+**

---

### 1. Run Backend

```bash
cd backend
mvn spring-boot:run
```

- **API URL**: `http://localhost:8080/api`
- **Swagger Documentation**: `http://localhost:8080/swagger-ui.html`

---

### 2. Run Frontend

```bash
cd frontend
npm install
npm start
```

- **Application URL**: `http://localhost:4200`

---

## Default Login Credentials

| Role | Username | Password |
| :--- | :--- | :--- |
| **Administrator** | `admin` | `admin123` |
| **Student (Active)** | `satish` | `student123` |
| **Student (General)** | `student` | `student123` |
