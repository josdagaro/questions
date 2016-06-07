<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartAController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartAModel.php';
          $this->model = new PartAModel;
          $data = array ('civil_state', 'children_numb', 'housing', 'limitations');
          $size = sizeof ($data);
          for ($i = 0; $i < $size; $i ++) $this->items [$i + 1] = $data [$i];
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
                  if (isset ($_POST ['performace'])) $vars ['performace'] = $_POST ['performace'];
                  else $vars ['performace'] = null;

        	        $this->model->setData (
        	         $vars ['graduate_id'], $vars ['civil_state'], $vars ['children_numb'], $vars ['housing'], serialize ($vars ['limitations']), $vars ['performace']
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

              foreach ($minData as $key => $value) {
                $dataset [$key] = $value;
                $dataset [$key]['limitations'] = unserialize ($value ['limitations']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
