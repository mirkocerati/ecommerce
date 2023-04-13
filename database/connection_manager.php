<?php

final class Connection {

    private static $instance = null;

    private $connection;

    public static function get() {
        if($instance == null) {
            $instance = new Connection();
        }
        return $instance;
    }

    private function __construct() {
        $this->init();
    }

    private function init() {
        $connection = new mysqli("localhost:3306", "aviato", "xx@xx", "aviato");

        if ($connection->connect_error) {
            die("Connection failed: " . $connection->connect_error);
        }
    }

    public function getConnection() {
        //return $this->$connection;
        return new mysqli("localhost:3306", "aviato", "xx@xx", "aviato");
    }

}

?>