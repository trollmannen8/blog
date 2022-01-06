<?php

require_once './app/connection.php';

function getAllUsers() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT * FROM authors;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function newUser($username, $password, $image) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "INSERT INTO authors (author_name, author_password, author_image)"
            . "VALUES ('" . $username ."', '" . $password . "', '" . $image . "')";
    $result = mysqli_query($conn, $sql);
    if(!$result) {
        return false;
    }
    return mysqli_insert_id($conn);
    close($conn);
}