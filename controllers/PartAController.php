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
              }

  	        	$json = array ('status' => true);
          	}
          	else $json = array ('status' => false);

            echo json_encode ($json);
        }

        public function loadData () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if ($this->session->exists ()) {
            $minimizedData = $this->model->getData ();
            if ($minimizedData) {
              foreach ($minimizedData as $key => $value) {
                if ($value ['civil_state'] == 1) $dataset [$key]['civilState'] = 'Soltero(a)';
                else $dataset [$key]['civilState'] = utf8_encode ('Casado(a)/ Unión libre');
                $dataset [$key]['childrenNumb'] = $value ['children_numb'];
                if ($value ['housing'] == 1) $dataset [$key]['housing'] = 'En arriendo';
                else if ($value ['housing'] == 2) $dataset [$key]['housing'] = utf8_encode ('Propia y la está pagando');
                else if ($value ['housing'] == 3) $dataset [$key]['housing'] = 'Propia totalmente pagada';
                else if ($value ['housing'] == 4) $dataset [$key]['housing'] = 'De un familiar sin pagar arriendo';
                else if ($value ['housing'] == 5) $dataset [$key]['housing'] = 'De un tercero sin pagar arriendo';
                else $dataset [$key]['housing'] = 'Otra';
                /*Falta las limitaciones, pero necesito ver qué me mandan primero para serializar esos datos al guardarlos
                y saberlos tratar acá.
                if ($value ['limitations']) $dataset ['limitations'][$key] = '';*/
                if ($value ['performace'] == 1) $dataset [$key]['performace'] = 'Moverse o caminar';
                else if ($value ['performace'] == 2) $dataset [$key]['performace'] = 'Usar sus brazos y manos';
                else if ($value ['performace'] == 3) $dataset [$key]['performace'] = 'Ver, a pesar de usar lentes o gafas';
                else if ($value ['performace'] == 4) $dataset [$key]['performace'] = utf8_encode ('Oír, aún con aparatos especiales');
                else if ($value ['performace'] == 5) $dataset [$key]['performace'] = 'Hablar';
                else if ($value ['performace'] == 6) $dataset [$key]['performace'] = 'Entender o aprender';
                else if ($value ['performace'] == 7) $dataset [$key]['performace'] = utf8_encode ('Relacionarse con los demás por problemas mentales o emocionales');
                else if ($value ['performace'] == 8) $dataset [$key]['performace'] = utf8_encode ('Otra limitación permanente');
                $dataset [$key]['graduateId'] = $value ['graduate_id'];
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false);
          }

          echo json_encode ($json);
        }
    }
?>
