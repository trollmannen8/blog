<?php

session_start();

$username = $_SESSION['username'];
$image = $_SESSION['image'];
$authorId = $_SESSION['authorid'];

include 'includes/header.php';
include 'includes/navbar.php';

require 'models/postmodel.php';

$posts = getAllPosts();
$editId = '';

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $editId = (int)$_POST['submit'];
    $title = filter_var($_POST['title'], FILTER_SANITIZE_SPECIAL_CHARS);
    $text = filter_var($_POST['text'], FILTER_SANITIZE_SPECIAL_CHARS);
    editPost($editId, $title, $text);
    $posts = getAllPosts();
}

?>


<div class="spaced container col-lg-6 bg-white shadow p-5 mb-5 bg-white rounded">
    <h2 class="text-center p-2">Bejegyzés szerkesztése</h2>
    
    <?php
    
    foreach ($posts as $post) {
        if($post['author_id'] == $authorId) {
        ?>
        <form class="mb-3" method="post">
            <div class="mb-3">
                <label class="form-label" for="title">Cím:</label>
                <input class="form-control" type="text" name="title" id="title" value="<?php print($post['post_title']);?>"><br>
            </div>
            <div class="mb-3">
                <label class="form-label" for="text">Szöveg:</label>
                <textarea class="form-control" id="text" name="text" rows="10"><?php print($post['post_text']);?></textarea><br>
            </div>
            <button class="btn btn-primary" type="submit" name="submit" value="<?php print($post['id']);?>">Mentés</button>
        </form>
        <?php
            }
        }
    
    ?>
    
    <br>

    <a class="link-primary pb-5" href="index.php">Vissza a bloghoz</a>
    
</div>

<?php

include 'includes/footer.php';

?>