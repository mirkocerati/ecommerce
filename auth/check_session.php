<?php
if(isset($_SESSION["user_id"])) {
    $query_result = SQL::getInstance()->Select("SELECT name FROM users WHERE id=" . (int)$_SESSION["user_id"] . " AND enabled=TRUE;");
    if(count($query_result) < 1) {
        unset($_SESSION["user_id"]);
        header("location: https://mirko.lol/auth?auth_type=sign_in");
    } else {
        unset($_SESSION["auth_fallback"]);
    }
} else {
    header("location: https://mirko.lol/auth?auth_type=sign_in");
}

?>