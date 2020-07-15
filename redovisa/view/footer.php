<?php
$numFiles   = count(get_included_files());
$memoryUsed = round(memory_get_peak_usage(true) / (1024 * 20124), 2);
$loadTime   = round(microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'], 3);
?>

<footer id="site-footer">
    <div class="me-tag">
        <?php require __DIR__ . "/byline.php" ?>
    </div>

    <p>Validatorer: <a href="http://validator.w3.org/check/referer">HTML5</a>
    <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
    <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a><br>
    Specifikationer: <a href="https://www.w3.org/TR/html/">HTML5</a>
    <a href="https://www.w3.org/TR/CSS/">CSS3</a>
    <a href="https://www.w3.org/2009/cheatsheet/">Cheatsheet</a></p>
    <p class="stats">Time to load page: <?=$loadTime?> ms. Files included: <?=$numFiles?>. Memory used: <?=$memoryUsed?>MB.</p>
</footer>

<script src="js/main.js"></script>
</body>
</html>
