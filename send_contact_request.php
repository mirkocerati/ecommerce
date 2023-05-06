<?php

require('database/DBManager.php');

if(!isset($_POST["name"]) || !isset($_POST["email"]) || !isset($_POST["subject"]) || !isset($_POST["message"])) {
    header("location: https://mirko.lol/contact.php?error=I campi compilati non sono validi.");
    die();
}

$name = $_POST["name"];
$email = $_POST["email"];
$subject = $_POST["subject"];
$message = $_POST["message"];

$query_result = DBManager::getInstance()->Insert("INSERT INTO `contact_requests` (`name`, `email`, `subject`, `message`, `time`) VALUES (?, ?, ?, ?, current_timestamp())", ["ssss", $name, $email, $subject, $message]);


    header("location: https://mirko.lol/contact.php?accepted=true");


?>