<?php

function subscribe($email) {
    return SQL::getInstance()->Insert("INSERT INTO `newsletter` (`email`, `date_subscribed`) VALUES ('?', current_timestamp())", ["s", $email]);
}