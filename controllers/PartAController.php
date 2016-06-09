<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartAController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartAModel.php';
          $this->model = new PartAModel;
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;
            $postData = file_get_contents ("php://input");
            $request = json_decode ($postData);

            if ($this->session->exists ()) {
              $check = false;
              $vars = array ();

              foreach ($request as $key => $value) {
                if ($key != 'performace' && !isset ($value)) {
                  $check = true;
                  break;
                }
                else if ($key != 'performace') $vars [$key] = $value;
              }

            	if (!$check) {
                require 'libs'.ds.'Validator.php';
                $validator = new Validator ($vars);

                if ($validator->validate ()) {
                  if (isset ($request->performace)) $vars ['performace'] = $request->performace;
                  else $vars ['performace'] = null;

        	        $this->model->setData (
        	         $this->session->getValue ('user')['id'], $vars ['civil_state'], $vars ['children_numb'], $vars ['housing'],
                   serialize ($vars ['limitations']), $vars ['performace']
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
