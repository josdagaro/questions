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
                  $this->session->getValue ('user')['id'], serialize ($vars ['languages']), intval ($vars ['present_ideas']), intval ($vars ['com_orally']), intval ($vars ['pers_convince']),
                  intval ($vars ['iden_symb']), intval ($vars ['accept_dif']), intval ($vars ['use_tools']), intval ($vars ['learn_update']), intval ($vars ['creative_innovative']),
                  intval ($vars ['search_analyze_manage_share']), intval ($vars ['create_innovate']), intval ($vars ['design_implement']), intval ($vars ['solve_problem']),
                  intval ($vars ['abstraction']), intval ($vars ['underst']), intval ($vars ['take_culture']), intval ($vars ['assume_resp']), intval ($vars ['planning_time']),
                  intval ($vars ['computer_tools']), intval ($vars ['imp_projects']), intval ($vars ['team_work']), intval ($vars ['indep_work']), intval ($vars ['apply_val']),
                  intval ($vars ['adapt_changes']), intval ($vars ['pressure_work']), intval ($vars ['strong_comp']), intval ($vars ['weak_comp']), intval ($vars ['useful_comp']),
                  intval ($vars ['useless_comp'])
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
                $dataset [$key]['languages'] = unserialize ($value ['languages']);
              }

              $json = array ('status' => true, 'dataset' => $dataset);
            }
            else $json = array ('status' => false, 'message' => 'Data is null');
          }

          echo json_encode ($json);
        }
    }
?>
