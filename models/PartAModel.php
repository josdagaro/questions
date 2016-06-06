<?php
	require Config::singleton ()->get ('modelsF').'Model.php';

	class PartAModel extends Model {
    public function __construct () {parent::__construct ();}

    public function setData ($graduateId, $civilState, $childrenNumb, $housing, $limitations, $performace) {
	    $query = $this->database->prepare ('CALL setPartA (?, ?, ?, ?, ?, ?)');
	    $query->bindParam (1, $graduateId);
	    $query->bindParam (2, $civilState);
	    $query->bindParam (3, $childrenNumb);
	    $query->bindParam (4, $housing);
	    $query->bindParam (5, $limitations);
	    $query->bindParam (6, $performace);
	    $query->execute ();
    }

		public function getData () {
			$query = $this->database->prepare ('CALL getAllPartA ()');
			$query->execute ();
			return $query->fetchAll ();
		}

		public function getSpecificData () {}
	}
?>
