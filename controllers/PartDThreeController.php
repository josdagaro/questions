<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDThreeController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDThreeModel.php';
          $this->model = new PartDThreeModel;
        }

        public function saveData () {
          	header ('Content-type: application/json; charset=utf-8');
          	$json = null;
            $postData = file_get_contents ("php://input");
            $request = json_decode ($postData);

            //if ($this->session->exists ()) {
            if (true) {
              $vars = array ();
              require 'libs'.ds.'Validator.php';

              foreach ($request as $key => $value) {
                if ($value == "") $vars [$key] = null;
                else $vars [$key] = $value;
              }

              $validator = new Validator ($vars);

              if ($validator->validate ($vars)) {
        	      $this->model->setData (
                  //$this->session->getValue ('user')['id'], intval ($vars ['first_work']), intval ($vars ['career_relat']), intval ($vars ['labour_forms']),
                  1, intval ($vars ['first_work']), intval ($vars ['career_relat']), intval ($vars ['labour_forms']),
                  serialize ($vars ['eco_activity_alumn']), floatval ($vars ['monthly_income'])
                );

                $json = array ('status' => true);
              }
              else $json = array ('status' => false, 'message' => 'Some field is null or does not exists');
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
                $dataset [$key]['eco_activity'] = unserialize ($value ['eco_activity']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
