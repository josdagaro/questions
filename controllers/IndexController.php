<?php
    class IndexController {
        public function __construct () {}

        public function index () {            
            header ('Location: views/');
        }
    }
?>
