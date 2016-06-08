<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDFourController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDFourModel.php';
          $this->model = new PartDFourModel;
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;

            if ($this->session->exists ()) {
              $vars = array ();

            	if (isset ($_POST ['graduate_id'])) {
                require 'libs'.ds.'Validator.php';
                $vars ['graduate_id'] = $_POST ['graduate_id'];
                $validator = new Validator ($vars);

                if ($validator->validate ()) {
                  $secondaryVars = array ('create_company', 'main_difficulty');
                  $size = sizeof ($secondaryVars);

                  for ($i = 0; $i < $size; $i ++) {
                    if (isset ($_POST [$secondaryVars [$i]])) $vars [$secondaryVars [$i]] = $_POST [$secondaryVars [$i]];
                    else $vars [$secondaryVars [$i]] = null;
                  }

        	        $this->model->setData ($vars ['graduate_id'], $vars ['create_company'], $vars ['main_difficulty']);
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
