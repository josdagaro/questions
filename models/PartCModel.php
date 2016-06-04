<?php
	class PartCModel {
        protected $database;
        
        public function __construct () {$this->database = SPDO::singleton ();}

        public function setData ($graduateId, $longTerm, $activity) {
        	$query = $this->database->prepare ('CALL setPartC (?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $longTerm);
        	$query->bindParam (3, $activity);
        	$query->execute ();
        }
    }
?>