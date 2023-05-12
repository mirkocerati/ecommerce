<?php

session_start();

require('../common/SQL.php');
require('../common/cart_manager.php');

echo get_cart_id();

?>