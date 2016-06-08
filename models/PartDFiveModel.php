<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartDFiveModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $timeCompany, $careerRelat, $ecoActivityCompany, $companyMonthlyAvg) {
        	$query = $this->database->prepare ('CALL setPartDFive (?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $timeCompany);
        	$query->bindParam (3, $careerRelat);
        	$query->bindParam (4, $ecoActivityCompany);
        	$query->bindParam (5, $companyMonthlyAvg);
        	$query->execute ();
        }

				public function getData () {
          $query = $this->database->prepare ('CALL getAllPartDFive ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
