<?php
	class PartDOneModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $moreTimeActivity, $remuneratedActivity, $diligenceWork, $afterDiligWork, $reasonsNotDilig, $workAvailab, $activityRole) {
        	$query = $this->database->prepare ('CALL setPartDOne (?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $moreTimeActivity);
        	$query->bindParam (3, $remuneratedActivity);
        	$query->bindParam (4, $diligenceWork);
        	$query->bindParam (5, $afterDiligWork);
        	$query->bindParam (6, $reasonsNotDilig);
            $query->bindParam (7, $workAvailab);
            $query->bindParam (8, $activityRole);
        	$query->execute ();
        }
    }
?>
