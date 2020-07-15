
<aside>
    <nav class="navbar_main">
        <ul>
        <?php foreach ($pages_me as $key => $value) :
            if ($pageReference === $key) {
                $selected_main = "selected";
            } else {
                $selected_main = null;
            } ?>

            <li><a class="<?=$selected_main?>" href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>

        <?php endforeach; ?>
        </ul>
    </nav>
</aside>
