<?php
/**
 * A processing page that does a redirect.
 */
if ($_POST["firstName"] ?? false) {
    $_SESSION["firstName"] = $_POST["firstName"];
    (isset($_POST["lastName"]) ? $_SESSION["lastName"] = $_POST["lastName"] : null);
    $url = "?page=success";
    // Redirect to success
    header("Location: $url");
}

if ($_POST["message"] ?? false) {
    $_SESSION["message"] = $_POST["message"];
    $url = "?page=post_text";
    // Redirect to success_text
    header("Location: $url");
}

if ($_POST["theme_choice"] ?? false) {
        $_SESSION["theme"] = $_POST["theme_choice"];
        $url = "?page=me";
        // Redirect to success_text
        header("Location: $url");
}
//Login test
if ($_POST["username"] ?? false) {
    $granted = false;
    $granted = user_check($_POST["username"], $_POST["password"], $DBuser);
    if ($granted) {
            $_SESSION["username"] = $_POST["username"];
            $_SESSION["login_status"] = "granted";
            $url = "?page=admin";
            header("Location: $url");
    } else {
        $_SESSION["login_error"] = true;
        $url = "?page=login";
        // Redirect to success_text
        header("Location: $url");
    }
}
