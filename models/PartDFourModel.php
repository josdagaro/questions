<?php
	class PartDFourModel {
        protected $database;
        
        public function __construct () {$this->database = SPDO::singleton ();}

        public function setData ($graduateId, $createCompany, $mainDifficulty) {
        	$query = $this->database->prepare ('CALL setPartDFour (?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $createCompany);
        	$query->bindParam (3, $mainDifficulty);
        	$query->execute ();
        }
    }
?>