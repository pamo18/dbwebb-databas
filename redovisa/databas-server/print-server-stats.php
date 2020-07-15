
<h1>Statistics for $_SERVER</h1>

<p>
<?php
$size = 0;
$key_name = "";
$value_name = "";

foreach ($_SERVER as $key => $value) :?>
    <?=
    $key . " (Len=". strlen($key).") -> " . $value . " (Len=" .strlen($value) . ") " ."<br>";
    if (strlen($key) + strlen($value) > $size) {
        $key_name = $key;
        $value_name = $value;
        $size = strlen($key) + strlen($value);
    }
endforeach;
?>

<p>The key/value with the longest combined length is:<br><br>
    Key = <?=$key_name?> with the value -> <?=$value_name?></p>
<p>The combined length is <?=$size?> characters long.</p>
</p>
