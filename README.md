# Central University Library Management System (UniLibrary)

An intelligent, web-based academic Library Management System built with **Spring Boot 3** and **Angular 18**, featuring smart keyword search, personalized book recommendations, interactive shelf navigation (Floor/Row/Shelf locator), and automated circulation & fine management.

---

## 📁 Project Directory Structure

`	ext
mini project/
├── backend/                # Spring Boot 3 Java REST API & Database Services
├── frontend/               # Angular 18 Single-Page Application (Web UI)
├── docs/                   # Complete Project Documentation & Assets
│   ├── IEEE_Conference_Paper.docx  # Final IEEE format research paper
│   ├── IEEE_Conference_Paper.pdf   # Formatted PDF of conference paper
│   ├── Project_Report.docx         # Complete detailed project report
│   ├── Project_Recap.docx          # Technology & Architecture recap
│   ├── Review_Presentation.pptx    # Simplified 16-slide presentation for review
│   ├── Credentials.txt             # Default usernames and passwords
│   └── figures/                    # System architecture & methodology diagrams
├── 1-Start-Backend.bat     # One-click launcher for Spring Boot Backend
├── 2-Start-Frontend.bat    # One-click launcher for Angular Frontend
└── README.md               # Project guide and instructions
`

---

## 🚀 Quick Start (How to Run)

### 1. Start the Backend API
Double-click:
`	ext
1-Start-Backend.bat
`
* **Port**: 8080
* **API Base URL**: http://localhost:8080/api
* **Swagger Documentation**: http://localhost:8080/swagger-ui.html
* **Database**: MySQL on localhost:3306 (Database: `lms_db`, User: `root`, Password: empty)

### 2. Start the Frontend Web UI
Double-click:
`	ext
2-Start-Frontend.bat
`
* **URL**: http://localhost:4200
* Opens automatically in your browser.

---

## 🔑 Login Credentials

| Role | Username | Password | Access / Portal |
| :--- | :--- | :--- | :--- |
| **Administrator** | dmin | dmin123 | Full Library Management (Catalog, Members, Issue/Return, Fines) |
| **Student** | student | student123 | Student Discovery (Catalog Search, Recommendations, Shelf Locator, My Loans) |

---

## 🛠️ Technology Stack

* **Backend**: Java 17, Spring Boot 3.3.4, Spring Data JPA, Spring Security (JWT), H2/MySQL
* **Frontend**: Angular 18 (Standalone Components), TypeScript, RxJS, Bootstrap 5, Bootstrap Icons
* **Build Tools**: Apache Maven 3.9+, Node.js & npm, Angular CLI
