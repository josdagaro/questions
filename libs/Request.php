<?php
    class Request {
        private $controller;
        private $action;
        private $arguments;

        public function __construct () {
            if (isset ($_GET ['action']) != null) {
                $url = filter_input (INPUT_GET, 'action', FILTER_SANITIZE_URL);
                $url = explode ('/', $url);
                $url = array_filter ($url);
                $this->controller = array_shift ($url);
                $this->action = array_shift ($url);
                $this->arguments = $url;
            }

            if (!$this->controller) $this->controller = 'Index';
            if (!$this->action && $this->controller == 'Index') $this->action = 'index';
            if (!isset ($this->arguments)) $this->arguments = array ();
        }

        public function getController () {return $this->controller;}
        public function getAction () {return $this->action;}
        public function getArguments () {return $this->arguments;}
    }
?>
