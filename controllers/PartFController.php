<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartFController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartFModel.php';
          $this->model = new PartFModel;
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
            $secondaryVars = array ('relationship', 'departament', 'city', 'res_phone', 'mob_phone');

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
                 $this->session->getValue ('user')['id'], $vars ['full_name'], $vars ['relationship'],
                 $vars ['country'], $vars ['departament'], $vars ['city'], $vars ['res_phone'], $vars ['mob_phone']
                );

                $json = array ('status' => true);
              }
              else $json = array ('status' => false, 'message' => 'Some field is null');
            }
            else $json = array ('status' => false, 'message' => 'Some field does not exists');

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

?>
