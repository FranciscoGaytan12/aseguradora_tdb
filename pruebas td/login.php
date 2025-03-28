<?php
include 'db.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT id, password FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $hashed_password);
        $stmt->fetch();
        
        if (password_verify($password, $hashed_password)) {
            $_SESSION['user_id'] = $id;
            $_SESSION['email'] = $email;
            header("Location: index.html");
            exit();
        } else {
            echo "Contraseña incorrecta. <a href='login.html'>Intenta de nuevo</a>";
        }
    } else {
        echo "Usuario no encontrado. <a href='register.html'>Regístrate</a>";
    }
    
    $stmt->close();
    $conn->close();
}
?>
