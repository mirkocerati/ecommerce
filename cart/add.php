<?php
session_start();
require('../database/DBManager.php');
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

if(isset($_COOKIE["cart"])) {
    echo "cookie set";
    $cart_id = (int)$_COOKIE["cart"];
    echo "cookie set";

    /*if (DBManager::getInstance()->getConnection()->ping()) {
        printf ("yes");
    } else {
        printf ("Error: %s\n", DBManager::getInstance()->getConnection()->error);
    }*/

    $query = DBManager::getInstance()->Insert("INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES (?, ?, ?);", ["iii", $cart_id, $id, $amount]);
    echo "<br>" . $query . "<br>";/*
    echo "cookie set";
    echo "<br> cart id:" . $cart_id;
    echo "<br> id:" . $id;
    echo "<br> amount:" . $amount;*/
} else {
    echo "cookie not set";
    $new_record_id = DBManager::getInstance()->Insert("INSERT INTO `carts` (`id`, `creation_date`, `user_id`, `active`) VALUES (NULL, current_timestamp(), NULL, '1')");

    $query_result = DBManager::getInstance()->Insert("INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES ('?', '?', '?')", ["iii", $new_record_id, $id, $amount]);

    setcookie("cart", $new_record_id, time() + (86400 * 30));

    if($query_result > 0) {
        //header("location: https://mirko.lol/cart?added=true");
    } else {
        //header("location: https://mirko.lol/cart?added=false");
    }

}

//header("location: https://mirko.lol/cart");


?>