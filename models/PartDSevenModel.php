<?php
	class PartDSevenModel {
        protected $database;
        
        public function __construct () {$this->database = SPDO::singleton ();}

        public function setData ($graduateId, $lookingFirstJob, $monthsLookingJob, $getJob, $difficultGetJob, $searchChJob) {
        	$query = $this->database->prepare ('CALL setPartDSeven (?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $lookingFirstJob);
        	$query->bindParam (3, $monthsLookingJob);
        	$query->bindParam (4, $getJob);
        	$query->bindParam (5, $difficultGetJob);
        	$query->bindParam (6, $searchChJob);    
        	$query->execute ();
        }
    }
?>