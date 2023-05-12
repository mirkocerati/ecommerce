<?php session_start();
require('../../common/SQL.php');
if (!isset($_POST["name"]) || !isset($_POST["lastname"]) || !isset($_POST["username"]) || !isset($_POST["email"]) || !isset($_POST["password"]) || !isset($_POST["password2"])) {
    header("location: https://mirko.lol/auth/index.php?auth_type=sign_up&error=Errore nella compilazione dei campi.");
    die();
}

$password = $_POST["password"];

if($_POST["password2"] != $password) {
    header("location: https://mirko.lol/auth/index.php?auth_type=sign_up&error=Le password non corrispondono.");
    die();
}

$username = $_POST["username"];
$email = $_POST["email"];

$search = SQL::getInstance()->Select("SELECT id FROM users WHERE username=? OR email=?", ["ss", $username, $email]);

if(count($search) > 0) {
    header("location: https://mirko.lol/auth?auth_type=sign_up&error=Username o indirizzo email già in uso.");
    die();
}

$name = $_POST["name"];
$lastname = $_POST["lastname"];

$hidden_password = md5($password);
SQL::getInstance()->Insert("INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `email`, `administrator`, `enabled`) VALUES (NULL, ?, ?, ?, ?, ?, '0', '1')", ["sssss", $username, $hidden_password, $name, $lastname, $email]);
header("location: https://mirko.lol/auth?auth_type=sign_in");


?>