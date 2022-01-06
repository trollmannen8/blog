<?php

function connection() {
    require './config/dbconfig.php';
    $conn = mysqli_connect($url, $username, $password, $dbname);
    return $conn;
}

function close($conn) {
    mysqli_close($conn);
}

function dbSelect($link, $query) {
    return mysqli_query($link, $query);
}

function getData($result) {
    $detail = [];
    while($row = mysqli_fetch_assoc($result)) {
        $detail[] = $row;
    }
    return $detail;
}