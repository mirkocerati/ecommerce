<?php

session_start();
require('../database/DBManager.php');
require('../auth/check_session.php');

if(!isset($_GET["product_id"])) {
    header("location: index.php");
}



?>