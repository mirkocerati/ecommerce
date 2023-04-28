<?php 

if(isset($_SESSION["user_id"])) {
    $query_result = DBManager::getInstance()->Select("SELECT name FROM users WHERE id=" . (int)$_SESSION["user_id"] . " AND enabled=TRUE;");
    if(count($query_result) < 1) {
        unset($_SESSION["user_id"]);
        header("location: https://mirko.lol/auth?auth_type=sign_in");
    }
} else {
    header("location: https://mirko.lol/auth?auth_type=sign_in");
}

?>