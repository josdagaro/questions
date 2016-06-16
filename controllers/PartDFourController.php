<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartDFourController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartDFourModel.php';
          $this->model = new PartDFourModel;
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
                $this->session->getValue ('user')['id'], $vars ['create_company'], $vars ['main_difficulty']
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
              foreach ($minData as $key => $value) $dataset [$key] = $value;
              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
