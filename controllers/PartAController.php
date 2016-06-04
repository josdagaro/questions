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

            if ($this->session->exists ()) {
            	if (isset ($_POST ['graduateId']) && isset ($_POST ['civilState']) && isset ($_POST ['childrenNumb']) &&
              isset ($_POST ['housing']) && isset ($_POST ['limitations'])) {
                require 'libs'.ds.'Validator.php';

                $vars = array (
                  'graduateId' => $_POST ['graduateId'], 'civilState' => $_POST ['civilState'], 'childrenNumb' => $_POST ['childrenNumb'],
                  'housing' => $_POST ['housing'], 'limitations' => $_POST ['limitations']
                );

                $validator = new Validator ($vars);

                if ($validator->validate ()) {
                  if (isset ($_POST ['performace'])) $vars ['performace'] = $_POST ['performace'];
                  else $vars ['performace'] = null;

        	        $this->model->setData (
        	         $vars ['graduateId'], $vars ['civilState'], $vars ['childrenNumb'], $vars ['housing'], $vars ['limitations'], $vars ['performace']
        	        );

                  $json = array ('status' => true);
                }
                else $json = array ('status' => false);
            	}
              else $json = array ('status' => false);
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
            else $json = array ('status' => false);
          }

          echo json_encode ($json);
        }
    }
?>
