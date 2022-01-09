<?php

require_once './models/postmodel.php';
require_once 'models/usermodel.php';

$authors = getAllUsers();
$categories = getCategory();

?>

<div class="sidebar">

    <div class="mb-3">

        <h5 class="mb-3 mt-3">Szűrés</h5>

        <h6 class="mt-3">Szerzők:</h6>
    
        <?php

        for($i = 0; $i < count($authors); $i++) {
            ?>
            <a href="index.php?filter=<?php print($authors[$i]['author_name']);?>" class="text-secondary"><?php print($authors[$i]['author_name']);?></a><br>
            <?php
        }
    
        ?>

        <h6 class="mt-3">Kategóriák:</h6>

        <?php

        for($i = 0; $i < count($categories); $i++) {
            ?>
            <a href="index.php?filter=<?php print($categories[$i]['category_name']);?>" class="text-secondary"><?php print($categories[$i]['category_name']);?></a><br>
            <?php
        }
        ?>


    </div>

    <a href="index.php?filter=nofilter" class="text-secondary">Összes bejegyzés</a>

</div>