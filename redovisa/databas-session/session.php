
            <h1>Session Contents</h1>
            <p>Session name = <?php echo session_name() ?></p>
            <?php foreach ($_SESSION as $key => $value) : ?>
            <p><?php print_r($key . " = " . $value); ?></p>
            <?php endforeach ?>
