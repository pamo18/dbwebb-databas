
<aside>
    <nav class="navbar_under">
        <ul>
        <?php
        if ($page["type"] == "multipage") {
            $nav_under = $multipage;
        } else if ($page["type"] == "session") {
            $nav_under = $pages_session;
        }
        ?>

        <?php foreach ($nav_under as $key => $value) :
            if ($pageReference === $key) {
                $selected_under = "selected";
            } else {
                $selected_under = null;
            } ?>

            <li><a class="<?=$selected_under?>" href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
        <?php endforeach; ?>

        </ul>
    </nav>
</aside>
