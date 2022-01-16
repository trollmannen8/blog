<?php

session_start();

if (isset($_SESSION['adminloggedin'])) {
    if ($_SESSION['adminloggedin'] === true) {
        $adminname = $_SESSION['adminname'];
    } 
} else {
    header('Location: adminlogin.php');
    exit();
}

require_once './models/adminmodel.php';

if(isset($_GET['catid'])){
    $deleteId = $_GET['catid'];
    deleteCategory($deleteId);
    header('Location: adminindex.php');
    exit();
}

if(isset($_GET['userid'])){
    $deleteId = $_GET['userid'];
    deleteUser($deleteId);
    header('Location: adminindex.php');
    exit();
}

if(isset($_POST['newcategory'])) {
    $newcategory = filter_var($_POST['newcategory'], FILTER_SANITIZE_SPECIAL_CHARS);
    newCategory($newcategory);
    header('Location: adminindex.php');
    exit();
}


$categories = getUnusedCategory();

$users = getPassiveUsers();

include 'includes/header.php';

?>

<a class="float-end m-2 btn btn-danger" href="adminlogout.php">Kijelentkezés</a>

<div class="container col-lg-5">

    <h1 class="text-center p-5">Admin felület</h1>

    <div class="bg-white shadow p-5 mb-5 bg-white rounded">

        <h3 class="text-center pb-3">Használaton kívüli kategórák</h3>

        <table class="table">
            <thead>
                <tr>
            <th scope="col">#</th>
            <th scope="col">Kategória</th>
            <th scope="col">Törlés</th>
            </tr>
        </thead>
        <tbody>
            <?php
            for($i = 0; $i < count($categories); $i++) { 
                ?>
            <tr>
                <th scope="row"><?php print($i + 1);?></th>
                <td><?php print($categories[$i]['category_name']);?></td>
                <td>
                    <a class="btn btn-danger" href="adminindex.php?catid=<?php print($categories[$i]['id']);?>" onClick="return confirm('Biztos vagy benne?')">Törlés</a>
                </td>
            </tr>
            <?php
            }
            ?>
        </tbody>
        </table>

    </div>

    <div class="bg-white shadow p-5 mb-5 bg-white rounded">

        <h3 class="text-center pb-3">Kategória létrehozása</h3>

        <form class="mb-3" action="" method="POST">
            <div class="mb-3">
                <label for="newcategory" class="form-label">Kategória:</label>
                <input type="text" id="newcategory" name="newcategory" class="form-control" value="">
            </div>    
            <input type="submit" class="btn btn-primary" value="Létrehozás">
        </form>

    </div>

    <div class="bg-white shadow p-5 mb-5 bg-white rounded">

        <h3 class="text-center pb-3">Inaktív felhasználók</h3>

        <table class="table">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Felhasználó</th>
            <th scope="col">Törlés</th>
            </tr>
        </thead>
        <tbody>
        <?php
            for($j = 0; $j < count($users); $j++) { 
            ?>
            <tr>
            <th scope="row"><?php print($j + 1);?></th>
            <td><?php print($users[$j]['author_name']);?></td>
            <td>
            <a class="btn btn-danger" href="adminindex.php?userid=<?php print($users[$j]['id']);?>" onClick="return confirm('Biztos vagy benne?')">Törlés</a>
            </td>
            </tr>
            <?php
            }
            ?>
        </tbody>
        </table>

    </div>

</div>

<?php

include 'includes/footer.php';

?>