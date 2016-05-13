<?php
    class IndexController {
        public function __construct () {}

        public function index () {
            /*método por defecto
            No he incluido un motor de plantillas para dejarlo a elección de ustedes
            Si quieren usar AngularJS, ¡perfecto! :D
            Por defecto se llama este controllador y su método index
            Para probarlo, a continuación, al abrir la aplicación en el navegador con la URL principal, 
            es decir, http://localhost/questions, obtendremos el siguiente mensaje:*/
            echo 'Hola :)';
        }
    }
?>
