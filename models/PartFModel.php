<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartFModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $fullName, $relationship, $country, $departament, $city, $resPhone, $mobPhone) {
        	$query = $this->database->prepare ('CALL setPartF (?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $graduateId);
        	$query->bindParam (2, $fullName);
        	$query->bindParam (3, $relationship);
          $query->bindParam (4, $country);
          $query->bindParam (5, $departament);
          $query->bindParam (6, $city);
          $query->bindParam (7, $resPhone);
          $query->bindParam (8, $mobPhone);
        	$query->execute ();
        }

        public function getData () {
          $query = $this->database->prepare ('CALL getAllPartF ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
