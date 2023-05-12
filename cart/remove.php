<?php 

session_start();

require('../common/SQL.php');
require('../common/cart_manager.php');

$id;

if(isset($_GET["id"])) {
    $id = $_GET["id"];
} else {
    header("location: https://mirko.lol/cart");
}

$cart = get_cart_id();

$query = SQL::getInstance()->Remove("DELETE FROM cart_products WHERE `cart_products`.`cart_id` = ? AND `cart_products`.`product_id` = ?", ["ii", $cart, $id]);

?>