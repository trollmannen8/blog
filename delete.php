<?php

error_reporting(E_ALL);
ini_set('display_errors', 'on');

require 'models/postmodel.php';

session_start();

$username = $_SESSION['username'];
$image = $_SESSION['image'];
$authorId = $_SESSION['authorid'];

include 'includes/header.php';
include 'includes/navbar.php';

$posts = getAllPosts();
$deleteId = '';
$postCount = count($posts);

if(isset($_GET['id'])){
    $deleteId = $_GET['id'];
    deletePost($deleteId);
    header('Location: index.php');
}

?>

<div class="container spaced col-lg-6 bg-white shadow p-5 mb-5 bg-white rounded">
    
    <h2 class="text-center">Bejegyzés törlése</h2>

    <?php

    foreach ($posts as $key => $value) {
        if($value['author_id'] == $authorId) {
        ?>
        <div class="post mt-5">
            <h3>Cím: <?php print($value['post_title']);?></h3>
            <span>Szerző: <?php print($username);?></span>
            <p>Közzététel: <?php print($value['post_date']);?></p>
            <a class="btn btn-danger" href="delete.php?id=<?php print($value['id']);?>" onClick="return confirm('Biztos vagy benne?')">Törlés</a>
        </div>

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