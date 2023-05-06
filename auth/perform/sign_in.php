<?php session_start();
require('../../database/DBManager.php');
if (!isset($_POST["email"]) || !isset($_POST["password"])) {
    header("location: ../index.php?error=Errore nella compilazione dei campi.");
    die();
}
$email = $_POST["email"];
$password = $_POST["password"];

$hidden_password = md5($password);
$query_result = DBManager::getInstance()->Select("SELECT id FROM users WHERE email=? AND password=? AND enabled=TRUE", ["ss", $email, $hidden_password]);
if (count($query_result) > 0) {
    print_r($query_result);
    foreach($query_result as $row) {
    $_SESSION["user_id"] = $row["id"];
    }

    if(isset($_SESSION["auth_fallback"])) {
        $url = $_SESSION["auth_fallback"];
        unset($_SESSION["auth_fallback"]);
        header("location: " . $url);
    } else {
        header("location: https://mirko.lol/");
    }
} else {
    header("location: https://mirko.lol/auth?error=I campi inseriti non sono corretti, autenticazione non avvenuta.");
}


?>