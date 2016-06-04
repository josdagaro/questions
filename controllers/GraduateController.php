<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class GraduateController extends Controller {
        public function __construct () {parent::__construct ();}

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;

          	if (isset ($_POST ['cardId']) && isset ($_POST ['fullName']) && isset ($_POST ['country']) && isset ($_POST ['email']) &&
            isset ($_POST ['pin'])) {
  	          require $this->config->get ('modelsF').'GraduateModel.php';
              require 'libs'.ds.'Validator.php';
  	          $graduateModel = new GraduateModel;

              $vars = array (
                'cardId' => $_POST ['cardId'], 'fullName' => $_POST ['fullName'], 'country' => $_POST ['country'], 'email' => $_POST ['email'],
                'pin' => $_POST ['pin']
              );

              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $secondaryVars = array ('program', 'birthDate', 'departament', 'city', 'resPhone', 'mobPhone');
                $size = sizeof ($secondaryVars);

                for ($i = 0; $i < $size; $i ++) {
                  if (isset ($_POST [$secondaryVars [$i]])) $vars [$secondaryVars [$i]] = $_POST [$secondaryVars [$i]];
                  else $vars [$secondaryVars [$i]] = null;
                }

      	        $graduateModel->setData (
      	         $vars ['cardId'], $vars ['fullName'], $vars ['program'], $vars ['birthDate'], $vars ['country'], $vars ['departament'],
                 $vars ['city'], $vars ['resPhone'], $vars ['mobPhone'], $vars ['email'], $vars ['pin']
      	        );
              }

  	        	$json = array ('status' => true);
          	}
          	else $json = array ('status' => false);

            echo json_encode ($json);
        }
    }
?>
