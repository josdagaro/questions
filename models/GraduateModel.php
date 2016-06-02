<?php
	class GraduateModel {
        protected $database;
        
        public function __construct () {$this->database = SPDO::singleton ();}

        public function setData ($cardId, $fullName, $program, $birthDate, $country, $departament, $city, $resPhone, $mobPhone, $email, $pin) {
        	/*$query = $this->database->prepare (
        		'CALL setGraduate ('.$cardId.', "'.$fullName.'", "'.$program.'", "'.$birthDate.'", "'.$country.'", "'.$departament.'", "'.$city.'", "'.$resPhone.'", "'.$mobPhone.'", "'.$email.'", '.$pin.')'
        	);*/
        	$query = $this->database->prepare ('CALL setGraduate (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        	$query->bindParam (1, $cardId);
        	$query->bindParam (2, $fullName);
        	$query->bindParam (3, $program);
        	$query->bindParam (4, $birthDate);
        	$query->bindParam (5, $country);
        	$query->bindParam (6, $departament);
        	$query->bindParam (7, $city);
        	$query->bindParam (8, $resPhone);
        	$query->bindParam (9, $mobPhone);
        	$query->bindParam (10, $email);
        	$query->bindParam (11, $pin);
        	$query->execute ();
        }
    }
?>