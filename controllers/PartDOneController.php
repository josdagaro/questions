<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDOneController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDOneModel.php';
          $this->model = new PartDOneModel;;
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

            $secondaryVars = array (
              'remunerated_activity', 'diligence_work', 'after_dilig_work', 'reasons_not_dilig', 'work_availab',
              'activity_role'
            );

            if ($this->session->exists ()) {
              $check = false;
              $vars = array ();

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
                    $this->session->getValue ('user')['id'], intval ($vars ['more_time_activity']), intval ($vars ['remunerated_activity']),
                    intval ($vars ['diligence_work']), intval ($vars ['after_dilig_work']), intval ($vars ['reasons_not_dilig']),
                    intval ($vars ['work_availab']), intval ($vars ['activity_role'])
                  );

                  $json = array ('status' => true);
                }
                else $json = array ('status' => false, 'message' => 'Some field is null');
            	}
              else $json = array ('status' => false, 'message' => 'Some field does not exists');
            }

            echo json_encode ($json);
        }

        public function loadData () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if ($this->session->exists ()) {
            $minData = $this->model->getData ();

            if ($minData) {
              $dataset = array ();
              foreach ($minData as $key => $value) $dataset [$key] = $value;
              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
