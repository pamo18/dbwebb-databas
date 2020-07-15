<?php
/**
 * Configuration file with common settings.
 */
error_reporting(-1);              // Report all type of errors
ini_set("display_errors", 1);     // Display all errors

//Sessions starts
$name = preg_replace("/[^a-z\d]/i", "", __DIR__);
session_name($name);
session_start();

$sessionName = isset($_SESSION["title"]) ? $_SESSION["title"] : "error, empty!";
$DBuser = __DIR__.'/db/users.sqlite';
