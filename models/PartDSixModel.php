<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartDSixModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $expMonths, $studyExpReality, $usefulKnowledge, $workContributes, $workSatisfaction, $studyLevel, $additionalInterest, $otherWork, $shouldEarnMore) {
        	$query = $this->database->prepare ('CALL setPartDSix (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $expMonths);
        	$query->bindParam (3, $studyExpReality);
        	$query->bindParam (4, $usefulKnowledge);
        	$query->bindParam (5, $workContributes);
        	$query->bindParam (6, $workSatisfaction);
          $query->bindParam (7, $studyLevel);
          $query->bindParam (8, $additionalInterest);
          $query->bindParam (9, $otherWork);
          $query->bindParam (10, $shouldEarnMore);
        	$query->execute ();
        }

				public function getData () {
          $query = $this->database->prepare ('CALL getAllPartDSix ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
