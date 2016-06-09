<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartDFourModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $createCompany, $mainDifficulty) {
        	$query = $this->database->prepare ('CALL setPartDFour (?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $createCompany);
        	$query->bindParam (3, $mainDifficulty);
        	$query->execute ();
        }

				public function getData () {
          $query = $this->database->prepare ('CALL getAllPartDFour ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
