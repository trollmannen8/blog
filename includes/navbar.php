<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm p-1 mb-5 bg-white fixed-top">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <?php
                if(isset($username)) {
                ?>
                <li class="nav-item">
                    <a class="nav-link" href="index.php">Főoldal</a>
                </li>   
                <li class="nav-item">
                    <a class="nav-link" href="newpost.php">Új bejegyzés</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="edit.php">Bejegyzés szerkesztése</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="delete.php">Bejegyzés törlése</a>
                </li>
                <li class="nav-item">
                    <img class="userimage rounded-circle" src="<?php print($image);?>" title="Bejelentkezve mint <?php print($username);?>">
                </li>
                <li class="nav-item">
                    <a class="btn btn-primary" href="logout.php">Kijelentkezés</a>
                </li>
                <?php
                } else {
                ?>
                <li class="nav-item">
                    <a class="btn btn-primary" href="login.php">Bejelentkezés</a>
                </li>
                <?php
                }
                ?>
            </ul>
        </div>
    </div>
</nav>