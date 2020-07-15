<h1>Redovisning</h1>

<p>Detta är redovisningssidan för kursen databas.</p>

<section>
    <?php
    $filename = __DIR__ . "/kmom01.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom02.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom03.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom04.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom05.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom06.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>

<section>
    <?php
    $filename = __DIR__ . "/kmom07-10.md";
    $text     = file_get_contents($filename);
    $filter   = new \Anax\TextFilter\TextFilter();
    $parsed   = $filter->parse($text, ["shortcode", "markdown"]);
    echo $parsed->text;
    ?>
</section>
