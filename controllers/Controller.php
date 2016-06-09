<?php
    require 'libs'.ds.'Session.php';

    abstract class Controller {
        protected $config;
        protected $session;
        protected $model;
        protected $items;

        public function __construct () {
          $this->config = Config::singleton ();
          $this->session = new Session;
          $this->session->init ();
          $this->model = null;
          $this->items [0] = 'graduate_id';
        }
    }
?>
