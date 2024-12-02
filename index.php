<?php

require "vendor/autoload.php";
require "init.php";

global $conn;

try {
    $router = new \Bramus\Router\Router();

    $router->get('/', '\App\Controllers\HomeController@index');

    $router->get('/login', '\App\Controllers\LoginController@showLoginForm');
    $router->post('/login', '\App\Controllers\LoginController@login');
    $router->get('/logout', '\App\Controllers\LoginController@logout');

    # Dashboard
    $router->get('/admin-dashboard', '\App\Controllers\AdminController@showDashboard');
    $router->get('/dashboard/users', '\App\Controllers\AdminController@showUserManagement');
    $router->post('/create-user', '\App\Controllers\AdminController@createUser');
    $router->post('/delete-user/(\d+)', '\App\Controllers\AdminController@deleteUser');
    $router->get('/edit-user/{\d+}', '\App\Controllers\AdminController@showEditUserPage');
    $router->post('/edit-user/{\d+}', '\App\Controllers\AdminController@updateUser');


    $router->run();
    } catch (Exception $e) {
        echo json_encode([
            'error' => $e->getMessage()
        ]);
    }

?>