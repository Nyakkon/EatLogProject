# 🍽️ EatLog - C# Learning Web API Structure (for Postman testing & study)

**EatLog** is a foundational **C# Web API project structure**, built to help you **learn how to organize and build an API from scratch**, especially when testing and learning through tools like **Postman**.

> 📌 Note: This project does **not yet include actual API implementation**, but it has the core structure and building blocks ready for development.

---

## 📁 Folder Structure Breakdown

```
EatLogProject/
├── Controllers/           # Handle HTTP requests (currently: UserController)
│   └── UserController.cs
│
├── DAOs/                  # Data Access Objects - logic to interact with DB layer
│   └── UserDAO/
│       ├── Login.cs
│       └── Register.cs
│
├── DTOs/                  # Data Transfer Objects - defines data shape
│   └── UserDTO/
│       ├── UserDTO.cs
│       └── UserInfoDTO.cs
│
├── Security/              # Basic security utilities
│   └── SecureVault.cs
│
├── Utils/                 # Utility functions
│   └── DBUtils.cs
│
├── appsettings.json       # Configuration (e.g., DB connection strings)
├── Program.cs             # Entry point, service configuration
├── EatLogProject.sql      # SQL file for table creation (DB structure)
├── EatLogProject.http     # HTTP test scripts (for Visual Studio REST client)
└── EatLogProject.sln      # Solution file for Visual Studio
```

---

## 🧠 Project Purpose

EatLog is **not a complete API** yet. Instead, it acts as a **template and learning base** for:

- Understanding **layered architecture** in C# Web API
- Practicing **DTO/DAO** usage for clean code separation
- Setting up **security utilities** (e.g., password hashing, secret handling)
- Preparing **Postman testing** via `http` test files
- Organizing your **future API project** properly from the beginning

---

## 🔍 Highlights

### 🔹 Controllers
- `UserController.cs`: Placeholder for routes related to user registration, login, and info fetching.

### 🔹 DAOs
- `Login.cs`, `Register.cs`: Logic structure for login/register actions (to be connected to DB).

### 🔹 DTOs
- `UserDTO.cs`: Likely the request model for user operations.
- `UserInfoDTO.cs`: Possibly a response model or detailed user info struct.

### 🔹 Security
- `SecureVault.cs`: Helper class for handling security, maybe JWT tokens or password hashing.

### 🔹 Utils
- `DBUtils.cs`: Support functions for DB connection or query execution.

---

## 🛠️ How to Use This Project

1. **Open the project** in Visual Studio via `EatLogProject.sln`.
2. Explore each layer (Controllers, DTOs, DAOs).
3. Expand the Controller with route logic (`[HttpPost]`, `[HttpGet]` etc.).
4. Connect the DAO layer to a real or mock database.
5. Test endpoints using Postman or Visual Studio’s `.http` file.

---

## 📌 Ideal For

- Students or junior developers learning **ASP.NET Web API**
- Anyone curious about **clean architecture** for backend
- Practicing API requests with **Postman**
- Preparing to build **full-stack apps**


---

## 🧰 Technology Stack

- **.NET SDK**: .NET 9
- **Language**: C#
- **IDE**: Visual Studio 2022 or later / Visual Studio Code

---

## 🧼 How to Clean & Rebuild the Project

Before running the API, follow these steps to ensure a clean build:

### 🧹 Clean the solution

Using Visual Studio:
```
Build > Clean Solution
```

Or using CLI:
```bash
dotnet clean
```

### 🔨 Rebuild the solution

Using Visual Studio:
```
Build > Rebuild Solution
```

Or using CLI:
```bash
dotnet build
```

Then, to run the project:
```bash
dotnet run
```

This ensures that all old binaries and temporary files are removed and the latest code is compiled properly.

---
