<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartCController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartCModel.php';
          $this->model = new PartCModel;
          $this->items [1] = 'long_term';
          $this->items [2] = 'activity';
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
                $this->model->setData (
                  $vars ['graduate_id'], serialize ($vars ['long_term']), serialize ($vars ['activity'])
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
