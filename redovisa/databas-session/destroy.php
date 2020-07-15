
            <h1>Session Destroy</h1>
            <p>Terminates current session</p>

<?php if (isset($_POST["destroy"])) {
    sessionDestroy();
    header("Location: ?page=session");
    return;
} ?>

            <form method="post" action="">
                <fieldset>
                    <label>Press the button to terminate the session</label>
                        <input type="submit" name="destroy" value="Destroy">
