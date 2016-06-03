<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class IndexController extends Controller {
        public function __construct () {parent::__construct ();}

        public function index () {readfile ($this->config->get ('viewsF').'index.html');}
    }
?>
