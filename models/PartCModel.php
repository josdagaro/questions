<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartCModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $longTerm, $activity) {
        	$query = $this->database->prepare ('CALL setPartC (?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $longTerm);
        	$query->bindParam (3, $activity);
        	$query->execute ();
        }

				public function getData () {
          $query = $this->database->prepare ('CALL getAllPartC ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
