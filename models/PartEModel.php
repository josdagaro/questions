<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartEModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $classifySenseBelong, $evalWorkPossib, $studyAgain, $reasonStudyAgain,
        $reasonNoStudyAgain, $wantOtherStudy, $otherStudy, $recommend) {
        	$query = $this->database->prepare ('CALL setPartE (?, ?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $classifySenseBelong);
        	$query->bindParam (3, $evalWorkPossib);
          $query->bindParam (4, $studyAgain);
          $query->bindParam (5, $reasonStudyAgain);
          $query->bindParam (6, $reasonNoStudyAgain);
          $query->bindParam (7, $wantOtherStudy);
          $query->bindParam (8, $otherStudy);
          $query->bindParam (9, $recommend);
        	$query->execute ();
        }

        public function getData () {
          $query = $this->database->prepare ('CALL getAllPartE ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
