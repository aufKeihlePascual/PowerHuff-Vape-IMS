<?php

session_start();

use App\Models\DatabaseConnection;

Mustache_Autoloader::register();
$mustache = new Mustache_Engine(array(
    'loader' => new Mustache_Loader_FilesystemLoader(dirname(__FILE__).'/Views'),
    'partials_loader' => new Mustache_Loader_FilesystemLoader(dirname(__FILE__) . '/Views/partials'),
));

$dotenv = Dotenv\Dotenv::createMutable(__DIR__);
$dotenv->load();

$db_type = $_ENV['DB_CONNECTION'];
$db_host = $_ENV['DB_HOST'];
$db_port = $_ENV['DB_PORT'];
$db_name = $_ENV['DB_DATABASE'];
$db_username = $_ENV['DB_USERNAME'];
$db_password = $_ENV['DB_PASSWORD'];

$db = new DatabaseConnection(
    $db_type,
    $db_host,
    $db_port,
    $db_name,
    $db_username,
    $db_password
);
$conn = $db->connect();


?>