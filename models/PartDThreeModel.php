<?php
	class PartDThreeModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $firstWork, $careerRelat, $labourForms, $ecoActivity, $monthlyIncome) {
        	$query = $this->database->prepare ('CALL setPartDThree (?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $firstWork);
        	$query->bindParam (3, $careerRelat);
        	$query->bindParam (4, $labourForms);
        	$query->bindParam (5, $ecoActivity);
        	$query->bindParam (6, $monthlyIncome);
        	$query->execute ();
        }
    }
?>
