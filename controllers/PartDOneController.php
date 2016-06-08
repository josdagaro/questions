<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDOneController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDOneModel.php';
          $this->model = new PartDOneModel;
          $this->items [1] = 'more_time_activity';
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;

            if ($this->session->exists ()) {
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
                  $secondaryVars = array (
                    'remunerated_activity', 'diligence_work', 'after_dilig_work', 'reasons_not_dilig', 'work_availab',
                    'activity_role'
                  );

                  $size = sizeof ($secondaryVars);

                  for ($i = 0; $i < $size; $i ++) {
                    if (isset ($_POST [$secondaryVars [$i]])) $vars [$secondaryVars [$i]] = $_POST [$secondaryVars [$i]];
                    else $vars [$secondaryVars [$i]] = null;
                  }

        	        $this->model->setData (
                    $vars ['graduate_id'], $vars ['more_time_activity'], $vars ['remunerated_activity'], $vars ['diligence_work'],
                    $vars ['after_dilig_work'], $vars ['reasons_not_dilig'], $vars ['work_availab'], $vars ['activity_role']
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
