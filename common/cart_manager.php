<?php

function get_cart_id() {
    $active_cart_id = -1;


if(isset($_SESSION["user_id"])) {
    $user_cart = SQL::getInstance()->Select("SELECT id FROM carts WHERE user_id=? AND active=1", ["i", (int)$_SESSION["user_id"]]);
    if(count($user_cart) < 1) {
        $active_cart_id = create_new_cart();
    } else {
        $active_cart_id = $user_cart;
    }
} else if(isset($_COOKIE["cart"])) {
    $current_cart_id = (int)$_COOKIE["cart"];

    $cart_exists = SQL::getInstance()->Select("SELECT * FROM carts WHERE id=? AND active=TRUE LIMIT 1", ["i", $current_cart_id]);

    if(count($cart_exists) < 1) {
        $active_cart_id = create_new_cart();
    } else {
        foreach($cart_exists as $row) {
            $active_cart_id = $row["id"];
        }
    }
} else {
    $active_cart_id = create_new_cart();
}
return $active_cart_id;
}

function add_to_cart(int $cart_id, int $product_id, int $product_amount) {

    $product_valid = SQL::getInstance()->Select("SELECT * FROM products WHERE id=? AND hidden=0 AND stock_amount>=?", ["ii", $product_id, $product_amount]);
    if(count($product_valid) < 1) {
        return false;
    }

    SQL::getInstance()->Insert("INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES (?, ?, ?)", ["iii", $cart_id, $product_id, $product_amount]);
    return true;
}

function create_new_cart() {
    $q = -1;
    if(isset($_SESSION["user_id"])) {
        $q = SQL::getInstance()->Insert("INSERT INTO `carts` (`id`, `creation_date`, `user_id`, `active`) VALUES (NULL, current_timestamp(), ?, '1')", ["i", (int)$_SESSION["user_id"]]);
    } else {
        $q = SQL::getInstance()->Insert("INSERT INTO `carts` (`id`, `creation_date`, `user_id`, `active`) VALUES (NULL, current_timestamp(), NULL, '1')");
    }
    setcookie("cart", $q, time() + (86400 * 30), "/");
    return $q;
}
?>