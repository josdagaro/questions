<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartEController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartEModel.php';
          $this->model = new PartEModel;
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
            $secondaryVars = array ('reason_study_again', 'reason_no_study_again', 'other_study');

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
                 $this->session->getValue ('user')['id'], intval ($vars ['classify_sense_belong']), intval ($vars ['eval_work_possib']),
                 intval ($vars ['study_again']), serialize ($vars ['reason_study_again']), serialize ($vars ['reason_no_study_again']),
                 intval ($vars ['want_other_study']), intval ($vars ['other_study']), intval ($vars ['recommend'])
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

              foreach ($minData as $key => $value) {
                $dataset [$key] = $value;
                $dataset [$key]['reason_study_again'] = unserialize ($value ['reason_study_again']);
                $dataset [$key]['reason_no_study_again'] = unserialize ($value ['reason_no_study_again']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>

?>
