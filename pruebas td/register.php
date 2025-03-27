<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (email, password) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);

    if ($stmt->execute()) {
        echo "Registro exitoso. <a href='login.html'>Iniciar sesión</a>";
    } else {
        echo "Error en el registro: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
}
?>
