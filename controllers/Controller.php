<?php
    abstract class Controller {
        protected $config;

        public function __construct () {$this->config = Config::singleton ();}
    }
?>
