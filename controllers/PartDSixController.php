<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDSixController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDSixModel.php';
          $this->model = new PartDSixModel;
        }

        public function saveData () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;
          $postData = file_get_contents ("php://input");
          $request = json_decode ($postData);

          if ($this->session->exists ()) {
            $vars = array ();

            foreach ($request as $key => $value) {
              if ($value == "") $vars [$key] = null;
              else $vars [$key] = $value;
            }

            $this->model->setData (
              $this->session->getValue ('user')['id'], intval ($vars ['exp_months']), intval ($vars ['study_exp_reality']),
              serialize ($vars ['useful_knowledge']), intval ($vars ['work_contributes']), intval ($vars ['work_satisfaction']),
              intval ($vars ['study_level']), intval ($vars ['additional_interest']), intval ($vars ['other_work']),
              intval ($vars ['should_earn_more'])
            );

            $json = array ('status' => true);
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
                $dataset [$key]['useful_knowledge'] = unserialize ($value ['useful_knowledge']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
