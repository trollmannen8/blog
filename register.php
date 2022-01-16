<?php

include 'includes/header.php';

require 'models/usermodel.php';

$username = '';
$userpass = '';
$userpassRepeat = '';
$usersString = '';
$usersData = [];
$newUser = [];
$errors = [];
$validationError = '';
$number = '';
$lowercase = '';
$uppercase = '';
$specialChars = '';
$password = '';

if($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $userpass = $_POST['userpass'];
    $userpassRepeat = $_POST['userpassrepeat'];
    $uppercase = preg_match('@[A-Z]@', $userpass);
    $lowercase = preg_match('@[a-z]@', $userpass);
    $number = preg_match('@[0-9]@', $userpass);
    $specialChars = preg_match('@[^\w]@', $userpass);
    $usersData = getAllUsers();
    if(count($usersData) > 0) {
        for($i = 0; $i < count($usersData); $i++) {
            if($usersData[$i]['author_name'] === $username) {
                array_push($errors, 'Ez a felhasználónév már foglalt!');
            }
        }
    }
    if(!preg_match('/^[A-Za-z]{1}[A-Za-z0-9]{5,31}$/', $username)) {
        array_push($errors, 'Nem megfelelő felhasználónév!');
    }
    if(!$uppercase || !$lowercase || !$number || !$specialChars || strlen($userpass) < 8) {
        array_push($errors, 'Nem megfelelő jelszó!');
    }
    if($userpass !== $userpassRepeat) {
        array_push($errors, 'A jelszavak nem egyeznek!');
    }
    if(isset($_FILES['avatar'])) {
        if($_FILES['avatar']['type'] != 'image/jpeg' || $_FILES['avatar']['size'] > 500000) {
            array_push($errors, 'A képfájl nem megfelelő méretű vagy formátumú!');
        }
    }
    if(count($errors) === 0) {
        if(isset($_FILES['avatar']) && $_FILES['avatar']['error'] == 0) {
            $source = $_FILES['avatar']['tmp_name'];
            $destination = './assets/img/' . $username . '.jpg';
            copy($source, $destination);
        }
        $password = hash('sha512', $userpass);
        newUser($username, $password, $destination);
        unset($_FILES);
        header('Location: login.php');
        exit();
    } else {
        foreach($errors as $error) {
            $validationError .= $error . '<br>';
        }
    }
}

?>

<div class="container spaced col-lg-4 mt-5 bg-white shadow p-5 mb-5 bg-white rounded">
    <h2 class="text-center">Regisztáció</h2>
    <form method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label" for="username">Felhasználónév:</label>
            <input class="form-control" type="text" id="username" name="username" placeholder="Felhasználónév" aria-describedby="usernameHelp">
            <div id="usernameHelp" class="form-text">6-32 karakter hosszúságú, betűt és számot tartalmazhat.</div>
        </div>
        <div class="mb-3">
            <label class="form-label" for="userpass">Jelszó:</label>
            <input class="form-control" type="password" id="userpass" name="userpass" placeholder="Jelszó" aria-describedby="userpassHelp">
            <div id="userpassHelp" class="form-text">Legalább 8 karakter, tartalmaznia kell nagybetűt, kisbetűt, számot és speciális karaktert.</div>
        </div>
        <div class="mb-3">
            <label class="form-label" for="userpassrepeat">Jelszó újra</label>
            <input class="form-control" type="password" id="userpassrepeat" name="userpassrepeat" placeholder="Jelszó újra">
        </div>
        <div class="mb-3">
            <label class="form-label" for="avatar">Avatar feltöltése:</label>
            <input class="form-control" type="file" id="avatar" name="avatar" aria-describedby="avatarHelp">
            <div id="avatarHelp" class="form-text">Csak 500 kilobyte-nál kisebb jpg kiterjesztésű fájlt fogadunk el.</div>
        </div>
        <input class="btn btn-primary" type="submit" name="submit" value="Küldés">
    </form>
    
    <span class="error"><?php print($validationError);?></span>
    
    <br>
    
    <a class="link-primary" href="index.php">Vissza a bloghoz</a>
    
</div>

<?php

include 'includes/footer.php';

?>