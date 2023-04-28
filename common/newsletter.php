<?php

function subscribe($email) {
    return DBManager::getInstance()->Insert("INSERT INTO `newsletter` (`email`, `date_subscribed`) VALUES ('?', current_timestamp())", ["s", $email]);
}