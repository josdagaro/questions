<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class GraduateController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'GraduateModel.php';
          $this->model = new GraduateModel;
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;

          	if (isset ($_POST ['cardId']) && isset ($_POST ['fullName']) && isset ($_POST ['country']) && isset ($_POST ['email']) &&
            isset ($_POST ['pin'])) {
              require 'libs'.ds.'Validator.php';

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

      	        $this->model->setData (
      	         $vars ['cardId'], $vars ['fullName'], $vars ['program'], $vars ['birthDate'], $vars ['country'], $vars ['departament'],
                 $vars ['city'], $vars ['resPhone'], $vars ['mobPhone'], $vars ['email'], $vars ['pin']
      	        );

                $this->session->setValue ('user', $vars);
              }

              foreach ($vars as $key => $value) {if ($key != 'pin') $user [$key] = $value [$key];}
  	        	$json = array ('status' => true, 'user' => $user);
          	}
          	else $json = array ('status' => false);

            echo json_encode ($json);
        }

        public function sigin () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if (!$this->session->exists ()) {
            if (isset ($_POST ['cardId']) && isset ($_POST ['pin'])) {
              require 'libs'.ds.'Validator.php';
              $vars = array ('cardId' => $_POST ['cardId'], 'pin' => $_POST ['pin']);
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $minData = $this->model->getSpecificData ();

                if ($minData) {
                  foreach ($minData as $key => $value) {$dataset = $value;}
                  $json = array ('status' => true, 'dataset' => $dataset);
                }
              }
              else $json = array ('status' => false);
            }
            else $json = array ('status' => false);
          }

          echo json_encode ($json);
        }

        public function logout () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if ($this->session->exists ()) {
            $this->session->unsetValue ('user');
            $this->session->destroy ();
            $json = array ('status' => true);
          }
          else $json = array ('status' => false);

          echo json_encode ($json);
        }
    }
?>
