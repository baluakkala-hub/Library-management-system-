# Library Management System

A full-stack web application for managing library operations, book catalogs, member borrowing, and overdue fines, built with **Spring Boot** and **Angular**.

---

## Features

- **Book Catalog**: Add, update, view, and organize books by category.
- **Member Management**: Register and manage library members.
- **Issue & Return**: Handle book borrowing, renewals, and returns.
- **Search**: Search catalog by title, author, category, or keywords.
- **Fine Management**: Track overdue books and manage fine settlements.
- **Role-Based Portals**: Dedicated interfaces for Admin and Students.

---

## Tech Stack

- **Backend**: Java 17, Spring Boot 3, Spring Data JPA, Hibernate, H2 Database
- **Frontend**: Angular 18, TypeScript, Bootstrap
- **Build Tools**: Apache Maven, npm

---

## Project Structure

```text
library-management-system/
├── backend/                  # Spring Boot REST API & Database Services
│   ├── src/                  # Controllers, Services, Repositories, Entities, DTOs
│   └── pom.xml               # Maven configuration and dependencies
├── frontend/                 # Angular Single-Page Application
│   ├── src/                  # Components, services, and layouts
│   └── package.json          # Node dependencies and scripts
├── .gitignore                # Git ignore rules
└── README.md                 # Project documentation
```

---

## Getting Started

### Prerequisites
- **Java JDK 17+**
- **Node.js 18+** & npm
- **Apache Maven 3.8+**

---

### 1. Run Backend

```bash
cd backend
mvn spring-boot:run
```

- **API URL**: `http://localhost:8080/api`
- **Swagger Documentation**: `http://localhost:8080/swagger-ui.html`
- **H2 Database Console**: `http://localhost:8080/h2-console`  
  *(JDBC URL: `jdbc:h2:mem:lmsdb`, User: `sa`, Password: empty)*

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
| **Student** | `student` | `student123` |
