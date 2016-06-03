<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartAController extends Controller {
        public function __construct () {parent::__construct ();}

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;

          	if (isset ($_POST ['graduateId']) && isset ($_POST ['civilState']) && isset ($_POST ['childrenNumb']) &&
            isset ($_POST ['housing']) && isset ($_POST ['limitations'])) {
  	          require $this->config->get ('modelsF').'PartAModel.php';
  	          $partAModel = new PartAModel;

              $vars = array (
                'graduateId' => $_POST ['graduateId'], 'civilState' => $_POST ['civilState'], 'childrenNumb' => $_POST ['childrenNumb'],
                'housing' => $_POST ['housing'], 'limitations' => $_POST ['limitations']
              );

              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                if (isset ($_POST ['performace'])) $vars ['performace'] = $_POST ['performace'];
                else $vars ['performace'] = null;

      	        $partAModel->setData (
      	         $vars ['graduateId'], $vars ['civilState'], $vars ['childrenNumb'], $vars ['housing'], $vars ['limitations'], $vars ['performace']
      	        );
              }

  	        	$json = array ('status' => true);
          	}
          	else $json = array ('status' => false);

            echo json_encode ($json);
        }
    }
?>
