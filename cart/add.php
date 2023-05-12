<?php
session_start();

require('../common/SQL.php');
require('../common/cart_manager.php');

$id = 0;
$amount = 1;

if(isset($_GET["amount"])) {
    $amount = (int)$_GET["amount"];
}

if(isset($_GET["id"])) {
    $id = (int)$_GET["id"];
} else {
    header("location: https://mirko.lol/products.php");
}

$active_cart = get_cart_id();
if(add_to_cart($active_cart, $id, $amount)) {
    header("location: https://mirko.lol/product.php?cart_result=added");
} else {
    header("location: https://mirko.lol/product.php?id=" . $id . "&cart_result=failed");
}

/*$active_cart_id = null;

if(isset($_SESSION["user_id"])) {
    $user_valid = SQL::getInstance()->Select("SELECT name FROM users WHERE id=? AND enabled=1");
    if
} else if(isset($_COOKIE["cart"])) {
    $current_cart_id = (int)$_COOKIE["cart"];

    $cart_exists = SQL::getInstance()->Select("SELECT active FROM carts WHERE id=? LIMIT 1", ["i", $current_cart_id]);

    $active = true;

    if(count($cart_exists) < 1) {
        $active = false;
    } else if($cart_exists[0]["active"]==0) {
        $active = false;
    }

    if(!$active) {
        create_new_cart();
    }

    add_to_cart($current_cart_id, $id, $amount);

    //$query = SQL::getInstance()->Insert("INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES (?, ?, ?);", ["iii", $current_cart_id, $id, $amount]);
} else {
    echo "cookie not set";
    $new_record_id = SQL::getInstance()->Insert("INSERT INTO `carts` (`id`, `creation_date`, `user_id`, `active`) VALUES (NULL, current_timestamp(), NULL, '1')");

    $query_result = SQL::getInstance()->Insert("INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES (?, ?, ?)", ["iii", $new_record_id, $id, $amount]);

    setcookie("cart", $new_record_id, time() + (86400 * 30));

    if($query_result > 0) {
        //header("location: https://mirko.lol/cart?added=true");
    } else {
        //header("location: https://mirko.lol/cart?added=false");
    }

}*/




?>