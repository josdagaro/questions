<?php
    class SPDO extends PDO {
        private static $instance = null;

        public function __construct () {
            $config = Config::singleton ();

            parent::__construct (
                'mysql:host=' . $config->get ('dbHost').';dbname=' . $config->get ('dbName'),
                $config->get ('dbUser'), $config->get ('dbPassword')
            );
        }

        public static function singleton () {
            if ( self::$instance == null ) self::$instance = new self ();
            return self::$instance;
        }
  }
?>
