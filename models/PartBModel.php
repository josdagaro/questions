<?php
    require Config::singleton ()->get ('modelsF').'Model.php';

    class PartBModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $languages, $competences, $outstandings) {
            $query = $this->database->prepare ('CALL setPartB (?, ?, ?, ?)');
            $query->bindParam (1, $graduateId);
            $query->bindParam (2, $languages);
            $query->bindParam (3, $competences);
            $query->bindParam (4, $outstandings);
            $query->execute ();
        }

        public function getData () {
          $query = $this->database->prepare ('CALL getAllPartB ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
