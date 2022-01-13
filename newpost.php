<?php

session_start();

$username = $_SESSION['username'];
$image = $_SESSION['image'];
$authorId = $_SESSION['authorid'];

include 'includes/header.php';
include 'includes/navbar.php';

require 'models/postmodel.php';
require 'models/usermodel.php';

$title = '';
$categoryId = 0;
$text = '';
$date = '';
$message = '';

$categories = getCategory();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = filter_var($_POST['title'], FILTER_SANITIZE_SPECIAL_CHARS);
    $categoryId = (int)$_POST['category'];
    var_dump($categoryId);
    $date = date('Y-m-d H:i');
    $text = filter_var($_POST['text'], FILTER_SANITIZE_SPECIAL_CHARS);
    $textToStore = nl2br($text);
    if(newPost($authorId, $categoryId, $title, $date, $textToStore)) {
        $message = '<span class="text-success">A bejegyzés sikeresen elmentve.</span>';
    } else {
        $message = '<span class="text-danger">Hiba történt.</span>';
    }
}

?>


<div class="container spaced col-lg-6 bg-white shadow p-5 mb-5 bg-white rounded">
    <h2 class="text-center p-2">Új bejegyzés</h2>
    <form action="" method="POST">
        <div class="mb-3">
            <label class="form-label" for="title">Cím:</label>
            <input class="form-control" type="text" id="title" name="title" value="<?php print($title);?>">
        </div>
        <div class="mb-3">
            <label class="form-label" for="category">Kategória:</label>
            <select name="category" id="category">
                <?php
                for($i = 0; $i < count($categories); $i++) {
                ?>
                <option value="<?php print($categories[$i]['id']);?>"><?php print($categories[$i]['category_name']);?></option>
                <?php
                }
                ?>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label" for="text">Szöveg:</label>
            <textarea class="form-control" id="text" name="text" rows="10"><?php print($text);?></textarea>
        </div>
        <input class="btn btn-primary" type="submit" name="submit" value="Mentés">
    </form>
    
    <p><?php print($message);?></p>
    
    <br>
    
    <a class="link-primary pb-5" href="index.php">Vissza a bloghoz</a>
    
</div>




<?php

include 'includes/footer.php';

?>