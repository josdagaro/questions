<?php
	class PartDTwoModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $firstWork, $searchCh, $typeLink, $currentOccup, $ecoActivity, $employmentRelat, $lastEntry, $weekWorkHoursAvg, $fieldActivity, $instLinks) {
        	$query = $this->database->prepare ('CALL setPartDTwo (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $firstWork);
        	$query->bindParam (3, $searchCh);
        	$query->bindParam (4, $typeLink);
        	$query->bindParam (5, $currentOccup);
        	$query->bindParam (6, $ecoActivity);
            $query->bindParam (7, $employmentRelat);
            $query->bindParam (8, $lastEntry);
            $query->bindParam (9, $weekWorkHoursAvg);
            $query->bindParam (10, $fieldActivity);
            $query->bindParam (11, $instLinks);
        	$query->execute ();
        }
    }
?>
