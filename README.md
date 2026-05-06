# Travel Management System

A full-stack Travel Management System developed using PHP and MySQL for managing travel bookings, hotels, transport, packages, customers, itineraries, and payments.

## Live Website

🌐 https://travelmanagement.gamer.gd/

---

## Features

- Customer Management
- Hotel Management
- Package Management
- Transport Management
- Booking System
- Payment Management
- Travel Itinerary Management
- Admin Dashboard
- CRUD Operations
- Responsive UI
- MySQL Database Integration

---

## Technologies Used

- PHP
- MySQL
- HTML5
- CSS3
- JavaScript
- XAMPP
- phpMyAdmin

---

## Project Structure

```text
TravelManagement/
│
├── index.php
├── config.php
├── css/
├── js/
├── images/
├── database/
└── modules/
```

---

## Installation Steps

### 1. Clone Repository

```bash
git clone https://github.com/your-username/travel-management-system.git
```

### 2. Move Project to XAMPP

Copy the project folder to:

```text
C:\xampp\htdocs\
```

### 3. Start XAMPP

Start:
- Apache
- MySQL

### 4. Import Database

1. Open phpMyAdmin
2. Create database:

```text
dbmsproj
```

3. Import the SQL file.

### 5. Configure Database Connection

Update database credentials in:

```text
config.php
```

Example:

```php
<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "dbmsproj";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
```

### 6. Run Project

Open browser:

```text
http://localhost/TravelManagement/
```

---

## Deployment

The project is deployed using:
- InfinityFree Hosting
- PHP + MySQL

---

## Author

Achintya Jain

---

## License

This project is for educational purposes.
