<?php
    class IndexController {
    	private $config;

        public function __construct () {$this->config = Config::singleton ();}

        public function index () {readfile ($this->config->get ('viewsF').'index.html');}
    }
?>
