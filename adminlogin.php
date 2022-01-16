<?php

session_start();

include './includes/header.php';

require './models/adminmodel.php';

$adminname = '';
$password = '';
$validationError = '';
$success = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $adminname = filter_var($_POST['adminname'], FILTER_SANITIZE_SPECIAL_CHARS);
    $password = hash('sha512', $_POST['password']);
    $data = getAllAdminUsers();
    for ($i = 0; $i < count($data); $i++) {
        if ($data[$i]['admin_name'] === $adminname && $data[$i]['admin_password'] === $password && $data[$i]['active'] == 1) {
            $success = true;
            $_SESSION['adminname'] = $adminname;
            $_SESSION['adminloggedin'] = true;
        }
    }
    if ($success) {
        header('Location: adminindex.php');
        exit();
    } else {
        $validationError = 'Helytelen felhasználónév vagy jelszó.';
    }
}

?>

<div class="container col-lg-3 mt-5 bg-white shadow p-5 mb-5 bg-white rounded">

    <h2>Bejelentkezés admin felületre</h2>

    <form class="mb-3" action="" method="POST">
        <div class="mb-3">
            <label for="adminname" class="form-label">Felhasználónév:</label>
            <input type="text" id="adminname" name="adminname" class="form-control" value="">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Jelszó:</label>
            <input type="password" id="password" name="password" class="form-control" value="">
        </div>
        
        <span class="error"><?php print($validationError);?></span>
        <br>
        <input type="submit" class="btn btn-primary" value="Bejelentkezés">
    </form>

</div>

<?php

include './includes/footer.php';

?>