<?php
session_start();

include 'includes/header.php';

require 'models/usermodel.php';

$username = '';
$password = '';
$validationError = '';
$jsonString = '';
$success = false;
$image = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = filter_var($_POST['username'], FILTER_SANITIZE_SPECIAL_CHARS);
    $password = hash('sha512', $_POST['password']);
    $data = getAllUsers();
    for ($i = 0; $i < count($data); $i++) {
        if ($data[$i]['author_name'] === $username && $data[$i]['author_password'] === $password) {
            $success = true;
            $_SESSION['username'] = $username;
            $_SESSION['authorid'] = $data[$i]['id'];
            $_SESSION['image'] = $data[$i]['author_image'];
            $_SESSION['loggedin'] = true;
        }
    }
    if ($success) {
        header('Location: index.php');
        exit;
    } else {
        $validationError = 'Helytelen felhasználónév vagy jelszó.';
    }
}
?>

<div class="container col-lg-3 mt-5 bg-white shadow p-5 mb-5 bg-white rounded">

    <h2>Bejelentkezés</h2>

    <form class="mb-3" action="" method="POST">
        <div class="mb-3">
            <label for="username" class="form-label">Felhasználónév:</label>
            <input type="text" id="username" name="username" class="form-control" value="">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Jelszó:</label>
            <input type="password" id="password" name="password" class="form-control" value="">
        </div>
        
        <span class="error"><?php print($validationError);?></span>
        <br>
        <input type="submit" class="btn btn-primary" value="Bejelentkezés">
    </form>

    <span><a href="register.php" class="link-primary">Nincs még fiókom, regisztrálok</a></span>

</div>

<?php

include 'includes/footer.php';

?>