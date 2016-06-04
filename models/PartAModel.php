<?php
	class PartAModel {
  	protected $database;

    public function __construct () {$this->database = SPDO::singleton ();}

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
	}
?>
