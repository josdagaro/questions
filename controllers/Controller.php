<?php
    require 'libs'.ds.'Session.php';

    abstract class Controller {
        protected $config;
        protected $session;
        protected $model;

        public function __construct () {
          $this->config = Config::singleton ();
          $this->session = new Session;
          $this->session->init ();
          $this->model = null;
        }
    }
?>
