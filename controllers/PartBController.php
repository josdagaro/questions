<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartBController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartBModel.php';
          $this->model = new PartBModel;
        }

        public function saveData () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;
          $postData = file_get_contents ("php://input");
          $request = json_decode ($postData);
          require 'libs'.ds.'Validator.php';

          if ($this->session->exists ()) {
            $check = false;
            $vars = array ();

            foreach ($request as $key => $value) {
              if (!isset ($value)) {
                $check = true;
                break;
              }
              else {
                $vars [$key] = $value;

                if ($key == 'competences' || $key == 'outstandings') {
                  foreach ($value as $tKey => $tValue) {
                      $validator = new Validator ($tValue);
                      if (!$validator->validate ()) {
                        $check = true;
                        break;
                      }

                  }
                }
              }
            }

            if (!$check) {
              $this->model->setData (
                $this->session->getValue ('user')['id'], serialize ($vars ['lenguages']), serialize ($vars ['competences']),
                serialize ($vars ['outstandings'])
              );

              $json = array ('status' => true);
            }
            else $json = array ('status' => false, 'message' => 'Some field does not exists or is null');
          }

          /* Testing */
          // $this->session->setValue ('test', $request);
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
                $dataset [$key]['languages'] = unserialize ($value ['languages']);
                $dataset [$key]['competences'] = unserialize ($value ['competences']);
                $dataset [$key]['outstandings'] = unserialize ($value ['outstandings']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
