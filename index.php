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
include 'includes/sidebar.php';

require_once './models/postmodel.php';

$postsPerPage = 5;

if(!isset($_GET['page'])) {
    $_SESSION['page'] = 1;
} else {
    $_SESSION['page'] = $_GET['page'];
}

if(isset($_GET['filter'])) {
    $_SESSION['filter'] = $_GET['filter'];
}

if(isset($_GET['linkid'])) {
    $_SESSION['post_id'] = $_GET['linkid'];
    unset($_GET['linkid']);
    header('Location: singlepost.php');
}

?>


<div class="container pt-5">

    <h1 class="text-center p-5">Blog</h1>

    <?php

    if(isset($_SESSION['filter']) && $_SESSION['filter'] !== 'nofilter') {
        $filter = $_SESSION['filter'];
        $pagePosts = ($_SESSION['page'] - 1) * $postsPerPage;
        $numberOfPosts = numberOfFilteredPosts($filter);
        $numberOfPages = ceil($numberOfPosts / $postsPerPage);
        if(!$posts = getFilteredPosts($filter, $pagePosts, $postsPerPage)) {
            print('<p class="text-center">Nincs találat.</p>');
        }
    } else {
        $pagePosts = ($_SESSION['page'] - 1) * $postsPerPage;
        $numberOfPosts = numberOfPosts();
        $numberOfPages = ceil($numberOfPosts / $postsPerPage);
        $posts = getPostsPerPage($pagePosts, $postsPerPage);
    }


    foreach ($posts as $post) {
    ?>
    <div class="card col col-lg-6 m-auto shadow p-3 mb-5 bg-white rounded">
        <div class="card-body">
            <h5 class="card-title"><?php print($post['post_title']);?></h5>
            <span class="card-text info">Szerző: <?php print($post['author_name']);?></span><br>
            <span class="card-text info">Közzététel: <?php print($post['post_date']);?></span><br>
            <span class="card-text info">Kategória: <?php print($post['category_name']);?></span><br>
            <a href="index.php?linkid=<?php print($post['id']);?>" class="btn btn-primary mt-3">Elolvasom</a>
        </div>
    </div>
    <?php
    }
    ?>

    <?php

    if($numberOfPages > 1) {

    ?>

    <div class="container">

        <nav aria-label="navigation">
            <ul class="pagination justify-content-center">

                <?php

                for($i = 1; $i <= $numberOfPages; $i++) {
                    if($i == $_SESSION['page']) {
                        print('<li class="page-item active">
                        <a class="page-link" href = "index.php?page=' . $i . '">' . $i . ' </a>
                        </li>');  
                    } else {
                        print('<li class="page-item">
                        <a class="page-link" href = "index.php?page=' . $i . '">' . $i . ' </a>
                        </li>');
                    }
                }

                ?>

            </ul>
        </nav>

    </div>

    <?php

}

?>

</div>

<?php

include 'includes/footer.php';

?>