<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartCController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartCModel.php';
          $this->model = new PartCModel;
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
              if (!isset ($value)) {
                $check = true;
                break;
              }
              else $vars [$key] = $value;
            }

            if (!$check) {
              require 'libs'.ds.'Validator.php';
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $this->model->setData (
                  $this->session->getValue ('user')['id'], serialize ($vars ['long_term']), serialize ($vars ['activity'])
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
                $dataset [$key]['long_term'] = unserialize ($value ['long_term']);
                $dataset [$key]['activity'] = unserialize ($value ['activity']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
