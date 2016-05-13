<?php
    header ("Access-Control-Allow-Origin: *");
    define ("ds", DIRECTORY_SEPARATOR);
    require 'controllers/FrontController.php';
    require 'libs/Request.php';
    FrontController::main (new Request);
?>
