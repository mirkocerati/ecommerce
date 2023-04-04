<?php

class Connection {

    private $host = "localhost";
    private $username = "cerati";
    private $password = "";
    private $name = "my_cerati";

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
        $connection = new mysqli($host, $username, $password, $name);

        if ($connection->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    }

    public function getConnection() {
        return $this->$connection;
    }

}

?>