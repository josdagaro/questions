<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDTwoController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDTwoModel.php';
          $this->model = new PartDTwoModel;
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
                $this->session->getValue ('user')['id'], intval ($vars ['first_work']), intval ($vars ['search_ch']), intval ($vars ['type_link']),
                serialize ($vars ['current_occup']), serialize ($vars ['eco_activity']), intval ($vars ['employment_relat']), floatval ($vars ['last_entry']),
                floatval ($vars ['week_work_hours_avg']), intval ($vars ['field_activity']), intval ($vars ['inst_links'])
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
                $dataset [$key]['current_occup'] = unserialize ($value ['current_occup']);
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
