<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class GraduateController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'GraduateModel.php';
          $this->model = new GraduateModel;
          $data = array ('card_id', 'full_name', 'country', 'email', 'pin');
          $size = sizeof ($data);
          for ($i = 0; $i < $size; $i ++) $this->items [$i + 1] = $data [$i];
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;
            $size = sizeof ($this->items);
            $check = false;
            $vars = array ();

            for ($i = 0; $i < $size; $i ++) {
              if (!isset ($_POST [$this->items [$i]])) {
                $check = true;
                break;
              }
              else $vars [$this->items [$i]] = $_POST [$this->items];
            }

          	if (!$check) {
              require 'libs'.ds.'Validator.php';
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $secondaryVars = array ('program', 'birth_date', 'departament', 'city', 'res_phone', 'mob_phone');
                $size = sizeof ($secondaryVars);

                for ($i = 0; $i < $size; $i ++) {
                  if (isset ($_POST [$secondaryVars [$i]])) $vars [$secondaryVars [$i]] = $_POST [$secondaryVars [$i]];
                  else $vars [$secondaryVars [$i]] = null;
                }

      	        $this->model->setData (
      	         $vars ['card_id'], $vars ['full_name'], $vars ['program'], $vars ['birth_date'], $vars ['country'], $vars ['departament'],
                 $vars ['city'], $vars ['res_phone'], $vars ['mob_phone'], $vars ['email'], $vars ['pin']
      	        );

                $this->session->setValue ('user', $vars);
                foreach ($vars as $key => $value) if ($key != 'pin') $user [$key] = $value; /*Creo el vector user para pasar todos los datos menos el pin, por seguridad.
                                                                                              Como el foreach recorre el vector vars por sus llaves, entonces value va a cambiar en cada iteración
                                                                                            */
    	        	$json = array ('status' => true, 'user' => $user);
              }
              else $json = array ('status' => false, 'message' => 'Some field is null');
          	}
          	else $json = array ('status' => false, 'message' => 'Some field does not exists');

            echo json_encode ($json);
        }

        public function sigin () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if (!$this->session->exists ()) {
            if (isset ($_POST ['card_id']) && isset ($_POST ['pin'])) {
              require 'libs'.ds.'Validator.php';
              $vars = array ('card_id' => $_POST ['card_id'], 'pin' => $_POST ['pin']);
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $minData = $this->model->getSpecificData ($vars ['card_id'], $vars ['pin']);

                if ($minData) {
                  foreach ($minData as $key => $value) {$dataset = $value;}
                  unset ($dataset ['pin']);
                  $json = array ('status' => true, 'dataset' => $dataset);
                }
              }
              else $json = array ('status' => false, 'message' => 'Some field is null');
            }
            else $json = array ('status' => false, 'message' => 'Some field does not exists');
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
          else $json = array ('status' => false, 'message' => 'Logout error');

          echo json_encode ($json);
        }
    }
?>
