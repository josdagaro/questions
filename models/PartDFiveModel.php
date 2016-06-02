<?php
	class PartDFiveModel {
        protected $database;
        
        public function __construct () {$this->database = SPDO::singleton ();}

        public function setData ($graduateId, $timeCompany, $careerRelat, $ecoActivityCompany, $companyMonthlyAvg) {
        	$query = $this->database->prepare ('CALL setPartDFive (?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $timeCompany);
        	$query->bindParam (3, $careerRelat);
        	$query->bindParam (4, $ecoActivityCompany);
        	$query->bindParam (5, $companyMonthlyAvg);
        	$query->execute ();
        }
    }
?>