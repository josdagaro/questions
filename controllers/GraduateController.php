<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class GraduateController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'GraduateModel.php';
          $this->model = new GraduateModel;
        }

        public function validate ($key, $vars) {
          $size = sizeof ($vars);

          for ($i = 0; $i < $size; $i ++) {
            if ($key == $vars [$i]) return false;
          }

          return true;
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;
            $postData = file_get_contents ("php://input");
            $request = json_decode ($postData);
            $check = false;
            $vars = array ();
            $secondaryVars = array ('program', 'birth_date', 'departament', 'city', 'res_phone', 'mob_phone');

            foreach ($request as $key => $value) {
              $validation = $this->validate ($key, $secondaryVars);

              if ($validation && !isset ($value)) {
                $check = true;
                break;
              }
              else if ($validation) $vars [$key] = $value;
            }

          	if (!$check) {
              require 'libs'.ds.'Validator.php';
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                foreach ($request as $key => $value) {
                  if (!$this->validate ($key, $secondaryVars)) {
                    if ($value == "") $vars [$key] = null;
                    else $vars [$key] = $value;
                  }
                }

      	        $this->model->setData (
      	         intval ($vars ['card_id']), $vars ['full_name'], $vars ['program'], $vars ['birth_date'], $vars ['country'], $vars ['departament'],
                 $vars ['city'], $vars ['res_phone'], $vars ['mob_phone'], $vars ['email'], intval ($vars ['pin']), intval ($vars ['role'])
      	        );

    	        	$json = array ('status' => true);
              }
              else $json = array ('status' => false, 'message' => 'Some field is null');
          	}
          	else $json = array ('status' => false, 'message' => 'Some field does not exists');

            echo json_encode ($json);
        }

        public function sigin () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;
          $postData = file_get_contents ("php://input");
          $request = json_decode ($postData);
          $check = false;

          if (!$this->session->exists ()) {
            if (isset ($request->card_id) && isset ($request->pin)) {
              require 'libs'.ds.'Validator.php';
              $vars = array ('card_id' => $request->card_id, 'pin' => $request->pin);
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $minData = $this->model->getSpecificData ($vars ['card_id'], $vars ['pin']);

                if ($minData) {
                  foreach ($minData as $key => $value) $dataset = $value;
                  $this->session->setValue ('user', $dataset);
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
