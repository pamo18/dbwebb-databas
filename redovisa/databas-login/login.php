
    <h1>Please Login</h1>

    <form method="post" action="?page=process_redirect">
        <fieldset class="login_box">
            <label>Enter your login details below, hint: "doe" & "doe"</label>
            <p>
                <label for="username">User Name:</label>
                <input type="text" name="username" id="username">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password">
            </p>
            <p>
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </p>
        </fieldset>
    </form>

    <div class="<?=messageCheck("login_error", "error")?>">
        <p>Wrong username/password, try again!</p>
    </div>
    <?=$_SESSION["login_error"] = null?>
