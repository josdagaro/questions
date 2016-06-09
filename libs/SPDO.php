<?php
    class SPDO extends PDO {
        private static $instance = null;

        public function __construct () {
            $config = Config::singleton ();

            parent::__construct (
                'mysql:host=' . $config->get ('databaseHost').';dbname=' . $config->get ('databaseName'),
                $config->get ('databaseUser'), $config->get ('databasePassword')
            );
        }

        public static function singleton () {
            if ( self::$instance == null ) self::$instance = new self ();
            return self::$instance;
        }
  }
?>
