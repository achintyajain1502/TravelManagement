<?php
$host = "sql211.infinityfree.com";
$user = "if0_41848831";
$pass = "phpdeploy";
$db   = "if0_41848831_dbmsproj";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>