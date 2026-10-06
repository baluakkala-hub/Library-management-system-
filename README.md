# 🏛️ University Smart Library Management System (LMS)

[![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.3.3-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)](https://spring.io/projects/spring-boot)
[![Angular](https://img.shields.io/badge/Angular-17.3-DD0031?style=for-the-badge&logo=angular&logoColor=white)](https://angular.io/)
[![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Spring Security](https://img.shields.io/badge/Security-JWT_BCrypt-6DB33F?style=for-the-badge&logo=spring-security&logoColor=white)](https://spring.io/projects/spring-security)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

An enterprise-grade, full-stack **Academic Library Management System** engineered for university campuses. Built with **Spring Boot 3**, **Angular 17**, and **MySQL 8**, it integrates role-based security, a 100-book curated catalog, automated student borrowing simulations, physical shelf navigation, and Indian Rupee (`₹`) fine management.

---

## 🌟 Key Highlights & Capabilities

| Module | Features & Capabilities |
| :--- | :--- |
| 🔐 **Spring Security & JWT** | Role-based authentication (`ROLE_ADMIN` & `ROLE_STUDENT`) with BCrypt salted password hashing and stateless JWT bearer token verification. |
| 📚 **100-Book Curated Catalog** | Comprehensive inventory across Engineering (CSE, ECE, Mech, Civil), Management (MBA), plus 24 literary classics and Sci-Fi novels (*Dune*, *1984*, *Foundation*, *Sapiens*). |
| 🗺️ **Physical Shelf Locator** | Real-time shelf coordinate mapping (Aisle 1–8, Shelf Row A1–C2, Column Rack 1–2) for effortless physical book retrieval. |
| 🤖 **Personalised Borrowing Simulation** | Realistic automated circulation for **30 active students**, tailoring borrowed titles to departmental majors and reading interests. |
| 🚫 **Account Governance & Lockout** | Automated identification of inactive accounts with account disabling in Spring Security and one-click administrator reactivation. |
| 💰 **INR (`₹`) Fine Settlement** | Automated overdue penalty computation, book damage tracking, barcode replacement fees, and settlement logging via **UPI**, **Card**, or **Cash**. |
| 🎨 **Warm Editorial Design Language** | Crafted around the ethos: **Warm Editorial Library × Modern Minimalism × Buttery Smooth Motion**. Eliminates generic SaaS blues in favor of parchment creams, sage greens, DM Serif Display typography, and physical card tactile motion. |

---

## 🎨 Design System: Warm Editorial Library × Modern Minimalism

The LMS interface has been completely reimagined to evoke the quiet, tactile dignity of a historic academic library elevated by contemporary software minimalism:

- **Calm & Warm Palette**: Soft parchment tones (`#F7F4EE`, `#FFFCF7`), deep slate text (`#292722`), muted sage green accents (`#526B58`), and rich leather warm tones (`#A97852`).
- **Quiet Library Dark Mode**: Deep dusk illumination (`#171714` background, `#24231F` surfaces, `#91A994` sage highlights) mimicking study halls after sunset.
- **Editorial Typography**: Pairing **DM Serif Display** for prominent literary headings with **Inter** for crisp data hierarchy and **JetBrains Mono** for shelf coordinates.
- **Tactile Motion Physics**: Calibrated with custom easing curves (`cubic-bezier(0.22, 1, 0.36, 1)`) for buttery smooth elevation changes, card interactions, and modal presentations without bouncy gimmicks.
- **Explainable Recommendation Dossiers**: High-dimensional TF-IDF vectors and cosine proximity calculation surfaced through editorial critique notes and affinity chips.

---

## 🏗️ System Architecture

```text
┌─────────────────────────────────────────────────────────────┐
│                   Angular 17 Client UI                      │
│     (Admin Governance Portal  /  Student Discovery App)     │
└──────────────────────────────┬──────────────────────────────┘
                               │  HTTPS / REST + JWT Bearer
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                 Spring Boot 3 REST API                      │
│   ├── Spring Security 6 (JwtFilter, BCrypt, Role Guards)   │
│   ├── Controllers: Auth, Books, Members, Lending, Fines    │
│   ├── Services: SimulationEngine, Circulation, FineEngine   │
│   └── Spring Data JPA / Hibernate Layer                     │
└──────────────────────────────┬──────────────────────────────┘
                               │  JDBC Connection Pool
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                       MySQL 8 Database                      │
│   Tables: books, members, transactions, fines, users        │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 Repository Structure

```text
library-management-system/
├── backend/                       # Spring Boot 3 Backend Application
│   ├── src/main/java/             # Enterprise Layered Architecture
│   │   └── com/library/lms/
│   │       ├── config/            # SecurityConfig, CORS, OpenAPI Swagger
│   │       ├── controller/        # REST Endpoints (Auth, Books, Lending, Fines, Members)
│   │       ├── dto/               # Data Transfer Objects (Requests & Responses)
│   │       ├── entity/            # JPA Entities (Book, Member, Transaction, Fine, User)
│   │       ├── repository/        # Spring Data JPA Repositories
│   │       ├── security/          # JwtUtils, JwtFilter, CustomUserDetailsService
│   │       └── service/           # Business Logic & Personalised Simulation Engine
│   ├── src/main/resources/
│   │   ├── application.yml        # MySQL Connection & JPA Configuration
│   │   └── data.sql               # Complete 100-Book & 41-Member Seed Dataset
│   └── pom.xml                    # Maven Project Object Model
├── frontend/                      # Angular 17 Single Page Application (SPA)
│   ├── src/app/
│   │   ├── core/                  # AuthService, AuthGuard, JwtInterceptor
│   │   ├── features/              # Feature Modules (Books, Lending, Fines, Members, Dashboard)
│   │   ├── layout/                # Navbar, Sidebar, Modal Components
│   │   └── shared/                # Data Models and UI Helpers
│   └── package.json               # Node Package Dependencies & Build Scripts
├── .gitignore                     # Git Tracking Exclusion Rules
└── README.md                      # Project Documentation
```

---

## 🚀 Quick Start Guide

### Prerequisites
- **Java JDK 17** or higher
- **Node.js 18+** & **npm**
- **MySQL Server 8.0+**
- **Apache Maven 3.8+**

---

### Step 1: Database Setup

Create the database in MySQL:
```sql
CREATE DATABASE lms_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Configure your credentials in `backend/src/main/resources/application.yml`:
```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/lms_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
    username: root
    password: YOUR_MYSQL_PASSWORD
```

---

### Step 2: Start the Backend Service

```bash
cd backend
mvn spring-boot:run
```
- **REST API Base**: `http://localhost:8080/api`
- **Interactive Swagger UI**: `http://localhost:8080/swagger-ui.html`

---

### Step 3: Start the Frontend Application

```bash
cd frontend
npm install
npm start
```
- **Web Application Portal**: `http://localhost:4200`

---

## 🔑 Default Credentials

The system comes pre-configured with BCrypt-hashed credentials:

| Role | Username | Password | Purpose |
| :--- | :--- | :--- | :--- |
| **Administrator** | `admin` | `admin123` | Full stock control, fine assessments, member reactivation |
| **Active Student** | `satish` | `student123` | Active borrower account (Computer Science major) |
| **Active Student** | `meera` | `student123` | Active borrower account (Literature / Sci-Fi enthusiast) |
| **Deactivated Student** | `shalini` | `student123` | Inactive account (triggers lockout notification) |

---

## 📡 Core API Reference

| Method | Endpoint | Access | Description |
| :--- | :--- | :--- | :--- |
| `POST` | `/api/auth/login` | Public | Authenticates credentials and returns signed JWT token |
| `GET` | `/api/books` | Authenticated | Retrieves 100-book catalog with physical shelf locations |
| `GET` | `/api/books?q=Novels` | Authenticated | Filters catalog across all 24 fiction & classic novels |
| `POST` | `/api/lending/issue` | Admin | Issues a book copy to a student member |
| `POST` | `/api/lending/return/{id}` | Admin | Records return and computes overdue days |
| `GET` | `/api/fines` | Authenticated | Lists all fines with payment status and settlement method |
| `POST` | `/api/fines` | Admin | Assesses a new penalty in INR (`₹`) |
| `PATCH` | `/api/fines/{id}/pay` | Admin | Records fine settlement via UPI, Card, or Cash |
| `PATCH` | `/api/members/{id}/toggle-status` | Admin | Toggles student account status between ACTIVE and INACTIVE |

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
