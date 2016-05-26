<?php
    class IndexController {
        public function __construct () {}

        public function index () {readfile ('views/index.html');}
    }
?>
