<?php
include('db.php'); // database connection
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel Management Dashboard</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #f2f6fc;
  margin: 0;
  padding: 0;
}
header {
  background: #0066cc;
  color: white;
  padding: 15px;
  text-align: center;
  font-size: 24px;
  font-weight: bold;
}

/* Navigation */
nav {
  background: #004d99;
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  padding: 10px 0;
}
nav a {
  color: white;
  text-decoration: none;
  padding: 10px 18px;
  background: #0073e6;
  border-radius: 5px;
  text-align: center;
  transition: background 0.3s;
  margin: 5px;
}
nav a:hover { background: #0059b3; }

/* CRUD Buttons Layout */
.crud-buttons {
  display: flex;
  justify-content: space-between;
  align-items: stretch;
  flex-wrap: wrap;
  gap: 15px;
  margin: 20px auto;
  width: 95%;
  max-width: 1400px;
  padding: 10px;
  overflow: hidden;
  box-sizing: border-box;
}
.crud-group {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  flex: 1 1 calc(14% - 10px);
  min-width: 170px;
  box-sizing: border-box;
  gap: 8px;
}
.crud-buttons a {
  display: block;
  width: 100%;
  height: 60px;
  line-height: 60px;
  text-align: center;
  border-radius: 8px;
  font-weight: 600;
  font-size: 15px;
  text-decoration: none;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0,0,0,0.15);
}
/* View Buttons */
.crud-buttons a:not(.manage) {
  background: linear-gradient(135deg, #28a745, #23923d);
  color: #fff;
}
.crud-buttons a:not(.manage):hover {
  background: linear-gradient(135deg, #23923d, #1e7e34);
  transform: translateY(-2px);
}
/* Manage Buttons */
.crud-buttons a.manage {
  background: linear-gradient(135deg, #007bff, #0069d9);
  color: #fff;
}
.crud-buttons a.manage:hover {
  background: linear-gradient(135deg, #0069d9, #0056b3);
  transform: translateY(-2px);
}

/* FORM SECTION */
form {
  width: 90%;
  margin: 30px auto;
  padding: 25px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 25px 35px;
  text-align: center;
}
form div {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 200px;
}
form label {
  font-weight: bold;
  margin-bottom: 6px;
}
form input {
  width: 200px;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  text-align: center;
}
form input[type=number] {
  text-align: right;
}
form button {
  width: 150px;
  margin-top: 10px;
  padding: 10px 20px;
  background: #0066cc;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s;
}
form button:hover { background: #004d99; }

/* Table */
table {
  border-collapse: collapse;
  width: 90%;
  margin: 20px auto;
  background: white;
}
th, td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
}
th { background: #0073e6; color: white; }

/* Delete button */
.delete-btn {
  background: #dc3545;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 5px 10px;
  cursor: pointer;
  transition: background 0.3s;
}
.delete-btn:hover {
  background: #b02a37;
}

/* Pagination */
.pagination {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin: 20px 0;
}
.pagination a {
  padding: 8px 14px;
  background: #0066cc;
  color: white;
  border-radius: 5px;
  text-decoration: none;
  transition: background 0.3s;
}
.pagination a:hover { background: #004d99; }

/* Responsive */
@media (max-width: 1000px) {
  .crud-group { flex: 1 1 30%; }
}
@media (max-width: 700px) {
  .crud-group { flex: 1 1 45%; }
}
@media (max-width: 480px) {
  .crud-group { flex: 1 1 90%; }
}
</style>
</head>
<body>

<header>Travel Management System</header>

<nav>
  <a href="?table=customer">Customer</a>
  <a href="?table=hotel">Hotel</a>
  <a href="?table=package">Package</a>
  <a href="?table=transport">Transport</a>
  <a href="?table=booking">Booking</a>
  <a href="?table=itinerary">Itinerary</a>
  <a href="?table=payment">Payment</a>
</nav>

<main>
<?php
$tables = ['customer','hotel','package','transport','booking','itinerary','payment'];

if (isset($_GET['table']) && in_array($_GET['table'], $tables)) {
    $table = $_GET['table'];
    $mode = $_GET['mode'] ?? 'view'; // default = view

    echo "<h2 style='text-align:center;'>Table: $table</h2>";

    // CRUD Buttons
    echo '<div class="crud-buttons">';
    foreach ($tables as $t) {
        echo "<div class='crud-group'>
                <a href='?table=$t'>View " . ucfirst($t) . "</a>
                <a href='?table=$t&mode=manage' class='manage'>Add / Manage " . ucfirst($t) . "</a>
              </div>";
    }
    echo '</div>';

    // DELETE
    if ($mode === 'manage' && isset($_GET['delete_id'])) {
        $delete_id = intval($_GET['delete_id']);
        $res_id = $conn->query("SHOW KEYS FROM $table WHERE Key_name = 'PRIMARY'");
        if ($res_id && $res_id->num_rows > 0) {
            $id_col = $res_id->fetch_assoc()['Column_name'];
            $conn->query("DELETE FROM $table WHERE $id_col = $delete_id");
            echo "<p style='color:red;text-align:center;'>🗑 Record deleted successfully!</p>";

            // Fix auto increment only for hotel
            if ($table == 'hotel') {
                $res_ai = $conn->query("SELECT IFNULL(MAX(Hotel_ID),0) + 1 AS next_id FROM hotel");
                if ($res_ai && $row_ai = $res_ai->fetch_assoc()) {
                    $nextId = (int)$row_ai['next_id'];
                    $conn->query("ALTER TABLE hotel AUTO_INCREMENT = $nextId");
                }
            }
        }
    }

    // INSERT
    if ($mode === 'manage' && $_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['insert'])) {
        $cols = [];
        $vals = [];
        foreach ($_POST as $col => $val) {
            if ($col == 'insert') continue;
            $cols[] = $col;
            $vals[] = "'" . $conn->real_escape_string($val) . "'";
        }
        $sql = "INSERT INTO $table (" . implode(",", $cols) . ") VALUES (" . implode(",", $vals) . ")";
        if ($conn->query($sql)) {
            echo "<p style='color:green;text-align:center;'>✅ Record added successfully!</p>";

            if ($table == 'hotel') {
                $res_ai = $conn->query("SELECT IFNULL(MAX(Hotel_ID),0) + 1 AS next_id FROM hotel");
                if ($res_ai && $row_ai = $res_ai->fetch_assoc()) {
                    $nextId = (int)$row_ai['next_id'];
                    $conn->query("ALTER TABLE hotel AUTO_INCREMENT = $nextId");
                }
            }
        } else {
            echo "<p style='color:red;text-align:center;'>❌ Error: " . $conn->error . "</p>";
        }
    }

    // Fetch Columns
    $cols = [];
    $res = $conn->query("SHOW COLUMNS FROM $table");
    while ($row = $res->fetch_assoc()) $cols[] = $row['Field'];

    // Add Form
    if ($mode === 'manage') {
        echo "<form method='POST'>";
        foreach ($cols as $col) {
            if (strpos(strtolower($col), 'id') !== false) continue; // skip IDs

            $lower = strtolower($col);

            // Rating
            if (stripos($col, 'rating') !== false) {
                echo "<div><label>$col:</label><input type='text' name='$col' required></div>";
                continue;
            }

            // Numeric Fields (with scroll)
            $numericFields = ['rent_cost','day_number','seat_capacity','duration','amount','price','price_per_night'];
            if (in_array($lower, $numericFields)) {
                echo "<div><label>$col:</label><input type='number' name='$col' step='1' required></div>";
                continue;
            }

            // Date Pickers
            if (in_array($lower, ['booking_date','payment_date'])) {
                echo "<div><label>$col:</label><input type='date' name='$col' required></div>";
                continue;
            }

            // Default
            echo "<div><label>$col:</label><input type='text' name='$col' required></div>";
        }
        echo "<button type='submit' name='insert'>Add Record</button></form>";
    }

    // Pagination
    $limit = 5; 
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $offset = ($page - 1) * $limit;

    $result = $conn->query("SELECT COUNT(*) AS total FROM $table");
    $total_rows = $result->fetch_assoc()['total'];
    $total_pages = ceil($total_rows / $limit);

    $result = $conn->query("SELECT * FROM $table LIMIT $offset, $limit");

    if ($result && $result->num_rows > 0) {
        echo "<table><tr>";
        foreach ($result->fetch_fields() as $field) echo "<th>{$field->name}</th>";
        if ($mode === 'manage') echo "<th>Action</th>";
        echo "</tr>";

        $result->data_seek(0);
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            foreach ($row as $key => $value) echo "<td>$value</td>";
            if ($mode === 'manage') {
                $primaryKey = array_key_first($row);
                $idVal = $row[$primaryKey];
                echo "<td><a href='?table=$table&mode=manage&delete_id=$idVal' onclick=\"return confirm('Are you sure you want to delete this record?');\">
                      <button class='delete-btn'>Delete</button></a></td>";
            }
            echo "</tr>";
        }
        echo "</table>";

        echo '<div class="pagination">';
        if ($page > 1) echo '<a href="?table='.$table.'&mode='.$mode.'&page='.($page-1).'">Prev</a>';
        if ($page < $total_pages) echo '<a href="?table='.$table.'&mode='.$mode.'&page='.($page+1).'">Next</a>';
        echo '</div>';
    } else {
        echo "<p style='text-align:center;'>No records found.</p>";
    }
} else {
    echo "<p style='text-align:center;margin-top:40px;'>Select a table above to view or add records.</p>";
}
?>
</main>
</body>
</html>
