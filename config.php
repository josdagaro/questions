<?php
    $config = Config::singleton ();
    //Configuración básica de MVC
    $config->set ('controllersF', 'controllers/');
    $config->set ('modelsF', 'models/');
    $config->set ('viewsF', 'views/');
    $config->set ('defaultController', 'Index');
    //Configuración de base de datos
    $config->set ('dbHost', 'localhost');
    $config->set ('dbName', 'questions');
    $config->set ('dbUser', 'root');
    $config->set ('dbPassword', '');
?>
