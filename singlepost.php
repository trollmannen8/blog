<?php

session_start();

if (isset($_SESSION['loggedin'])) {
    if ($_SESSION['loggedin'] === true) {
        $username = $_SESSION['username'];
        $image = $_SESSION['image'];
    }
}

include 'includes/header.php';
include 'includes/navbar.php';

require_once './models/postmodel.php';

$postId = $_SESSION['post_id'];

$post = getSinglePost($postId);

$displayText = str_replace('&#13;&#10;', '<br>', $post[0]['post_text']);


?>

<div class="spaced container p-5 col-lg-6 shadow mb-5 bg-white rounded">
    
    <h2><?php print($post[0]['post_title']);?></h2>
    <span class="info">Szerző: <?php print($post[0]['author_name']);?></span><br>
    <span class="info">Közzététel: <?php print($post[0]['post_date']);?></span><br>
    <span class="info">Kategória: <?php print($post[0]['category_name']);?></span><br>
    <p class="mt-5"><?php print($displayText);?></p>
    <a href="index.php?page=<?php print($_SESSION['page']);?>" class="btn btn-primary mt-5">Vissza a főoldalra</a>
    
</div>

<?php

include 'includes/footer.php';

?>