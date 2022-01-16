<?php

error_reporting(E_ALL);
ini_set('display_errors', 'on');

require_once './app/connection.php';

function getAllAdminUsers() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT * FROM adminusers;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function getUnusedCategory() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT category.id, category.category_name FROM category
            LEFT JOIN posts on category.id = posts.category_id
            WHERE ISNULL(posts.category_id);";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function getPassiveUsers() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT authors.id, authors.author_name FROM authors
            LEFT JOIN posts on authors.id = posts.author_id
            WHERE ISNULL(posts.author_id);";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function deleteCategory($deleteId) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "DELETE FROM category WHERE id = $deleteId";
    if(mysqli_query($conn, $sql)) {
        print('Sikeres törlés');
    } else {
        print('Hiba történt: ' . mysqli_error($conn));
    }
    close($conn);
}

function newCategory($newcategory) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "INSERT INTO category (category_name)"
            . "VALUES ('" . $newcategory . "')";
    $result = mysqli_query($conn, $sql);
    if(!$result) {
        return false;
    }
    return mysqli_insert_id($conn);
    close($conn);
}

function deleteUser($deleteId) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "DELETE FROM authors WHERE id = $deleteId";
    if(mysqli_query($conn, $sql)) {
        print('Sikeres törlés');
    } else {
        print('Hiba történt: ' . mysqli_error($conn));
    }
    close($conn);
}