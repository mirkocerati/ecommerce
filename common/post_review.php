<?php

session_start();
require('SQL.php');
require('../auth/check_session.php');

if(!isset($_POST["product_id"]) || !isset($_POST["subject"]) || !isset($_POST["text"]) || !isset($_POST["stars"])) {
    header("location: https://mirko.lol/products.php");
    die();
}

$user_id = $_SESSION["user_id"];
$product_id = intval($_POST["product_id"]);

$already_reviewed = SQL::getInstance()->Select("SELECT * FROM reviews WHERE product_id=? AND user_id=? AND hidden=0", ["ii", $product_id, $user_id]);
if(count($already_reviewed) > 0) {
    header("location: https://mirko.lol/product.php?id=" . $product_id . "&review_result=already_reviewed");
    die();
}
$stars = intval($_POST["stars"]);
if($stars < 1 || $stars > 5) {
    header("location: https://mirko.lol/");
}
$subject = $_POST["subject"];
$text = $_POST["text"];
//echo $user_id . "-" . $product_id . "-" . $stars . "-" . $subject . "-" . $text;
$query_result = SQL::getInstance()->Insert("INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `stars`, `subject`, `text`, `date`, `hidden`) VALUES (NULL, ?, ?, ?, ?, ?, current_timestamp(), '0')", ["iiiss", $user_id, $product_id, $stars, $subject, $text]);

if($query_result > 0) {
    header("location: https://mirko.lol/product.php?id=" . $product_id . "&review_result=posted");
} else {
    header("location: https://mirko.lol/product.php?id=" . $product_id . "&review_result=failed");
}


?>