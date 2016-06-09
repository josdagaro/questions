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

            if ($this->session->exists ()) {
              $vars = array ();

            	if (isset ($_POST ['graduate_id'])) {
                require 'libs'.ds.'Validator.php';
                $vars ['graduate_id'] = $_POST ['graduate_id'];
                $validator = new Validator ($vars);

                if ($validator->validate ()) {
                  $secondaryVars = array (
                    'first_work', 'search_ch', 'type_link', 'current_occup', 'eco_activity', 'employment_relat', 'last_entry',
                    'week_work_hours_avg', 'field_activity', 'inst_links'
                  );

                  $size = sizeof ($secondaryVars);

                  for ($i = 0; $i < $size; $i ++) {
                    if (isset ($_POST [$secondaryVars [$i]])) $vars [$secondaryVars [$i]] = $_POST [$secondaryVars [$i]];
                    else $vars [$secondaryVars [$i]] = null;
                  }

        	        $this->model->setData (
                    $vars ['graduate_id'], $vars ['first_work'], $vars ['search_ch'], $vars ['type_link'],
                    $vars ['current_occup'], $vars ['eco_activity'], $vars ['employment_relat'], $vars ['last_entry'],
                    $vars ['week_work_hours_avg'], $vars ['field_activity'], $vars ['inst_links']
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
              foreach ($minData as $key => $value) $dataset [$key] = $value;
              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
