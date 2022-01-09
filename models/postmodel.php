<?php

require_once './app/connection.php';

function getAllPosts() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT posts.id, posts.post_title, posts.post_date,
            posts.post_text, posts.author_id, authors.author_name, category.category_name
            FROM posts
            JOIN authors ON posts.author_id = authors.id
            JOIN category ON posts.category_id = category.id
            ORDER BY posts.post_date DESC;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function numberOfPosts() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT * FROM posts";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    return mysqli_num_rows($result);
}

function getPostsPerPage($pagePosts, $postsPerPage) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT posts.id, posts.post_title, posts.post_date,
            posts.post_text, posts.author_id, authors.author_name, category.category_name
            FROM posts
            JOIN authors ON posts.author_id = authors.id
            JOIN category ON posts.category_id = category.id
            ORDER BY posts.post_date DESC
            LIMIT $pagePosts, $postsPerPage;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function getSinglePost($id) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT posts.id, posts.post_title, posts.post_date,
            posts.post_text, posts.author_id, authors.author_name, category.category_name
            FROM posts
            JOIN authors ON posts.author_id = authors.id
            JOIN category ON posts.category_id = category.id
            WHERE posts.id = $id;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function numberOfFilteredPosts($filter) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT posts.id, posts.post_title, posts.post_date,
            posts.post_text, posts.author_id, authors.author_name, category.category_name
            FROM posts
            JOIN authors ON posts.author_id = authors.id
            JOIN category ON posts.category_id = category.id
            WHERE category.category_name = '" . $filter . "'
            OR authors.author_name = '" . $filter . "'";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    return mysqli_num_rows($result);
}

function getFilteredPosts($filter, $pagePosts, $postsPerPage) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT posts.id, posts.post_title, posts.post_date,
            posts.post_text, posts.author_id, authors.author_name, category.category_name
            FROM posts
            JOIN authors ON posts.author_id = authors.id
            JOIN category ON posts.category_id = category.id
            WHERE category.category_name = '" . $filter . "'
            OR authors.author_name = '" . $filter . "'
            ORDER BY posts.post_date DESC
            LIMIT $pagePosts, $postsPerPage;";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function getCategory() {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "SELECT * FROM category";
    $result = dbSelect($conn, $sql);
    if(!$result) {
        return false;
    }
    $detail = getData($result);
    close($conn);
    return $detail;
}

function newPost($authorId, $categoryId, $title, $date, $text) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "INSERT INTO posts (author_id, category_id, post_title, post_date, post_text)"
            . "VALUES ('" . $authorId ."', '" . $categoryId ."', '" . $title . "', '" . $date . "', '" . $text . "')";
    $result = mysqli_query($conn, $sql);
    if(!$result) {
        return false;
    }
    return mysqli_insert_id($conn);
    close($conn);
}

function deletePost($id) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "DELETE FROM posts WHERE id = $id";
    if(mysqli_query($conn, $sql)) {
        print('Sikeres törlés');
    } else {
        print('Hiba történt: ' . mysqli_error($conn));
    }
    close($conn);
}

function editPost($id, $title, $text) {
    $conn = connection();
    if(!$conn) {
        return false;
    }
    $sql = "UPDATE posts "
            . "SET post_title = '" . $title . "', post_text = '" .  $text . "'"
            . "WHERE id = $id;";
    if(mysqli_query($conn, $sql)) {
        return true;
    } else {
        return false;
    }
    close($conn);
}