<?php

require_once './models/postmodel.php';
require_once 'models/usermodel.php';

$authors = getAllUsers();
$categories = getCategory();
$dates = getPostDate();

function getYears($dates) {
    $yearsArray = [];
    for($i = 0; $i < count($dates); $i++) {
        array_push($yearsArray, substr($dates[$i]['post_date'], 0, 4));
    }
    return array_unique($yearsArray);
}

$years = getYears($dates);

?>

<div class="sidebar">

    <div class="mb-3">

        <h5 class="mb-3 mt-3">Keresés</h5>

        <form method="POST">
            <div class="mb-3">
                <label for="search" class="form-label">Keresendő kifejezés:</label>
                <input type="text" class="form-control" id="search" name="search" aria-describedby="kereses">
                <div id="kereses" class="form-text">Keresés a bejegyzések címében és szövegében.</div>
            </div>
            <button type="submit" class="btn btn-primary">Keres</button>
        </form>

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

        <h6 class="mt-3">Évek:</h6>

        <?php

        foreach($years as $value) {
            ?>
            <a href="index.php?filter=<?php print($value);?>" class="text-secondary"><?php print($value);?></a><br>
            <?php
        }

        ?>


    </div>

    <a href="index.php?filter=nofilter" class="text-secondary">Összes bejegyzés</a>

</div>