
<h1>Print the content of $_SERVER</h1>

<p>The content of the PHP variabel <code>$_SERVER</code> is:<p>

<pre>
<?= htmlentities(print_r($_SERVER, true)); ?>
</pre>

<p>The server is running: <?= htmlentities($_SERVER['SERVER_SIGNATURE']); ?></p>

<p>Your IP adress is: <?= htmlentities($_SERVER['REMOTE_ADDR']); ?></p>

<p>There are <?= count($_SERVER)?> entries in the array for $_SERVER.</p>


<p><?=print_r('The first item in $_SERVER is ', true) . print_r(array_slice($_SERVER, 0, 1), true);?></p>
<p><?=print_r('The last item in $_SERVER is ', true) . print_r(array_slice($_SERVER, -1, 1), true);?></p>
