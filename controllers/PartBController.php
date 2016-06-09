<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartBController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartBModel.php';
          $this->model = new PartBModel;

          $data = array (
            'languages', 'present_ideas', 'com_orally', 'pers_convince', 'iden_symb', 'accept_dif', 'use_tools', 'learn_update',
            'creative_innovative', 'search_analyze_manage_share', 'create_innovate', 'design_implement', 'solve_problem', 'abstraction',
            'underst', 'take_culture', 'assume_resp', 'planning_time', 'computer_tools', 'imp_projects', 'team_work', 'indep_work',
            'apply_val', 'adapt_changes', 'pressure_work', 'strong_comp', 'weak_comp', 'useful_comp', 'useless_comp'
          );

          $size = sizeof ($data);
          for ($i = 0; $i < $size; $i ++) $this->items [$i + 1] = $data [$i];
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
                  $vars ['graduate_id'], serialize ($vars ['languages']), $vars ['present_ideas'], $vars ['com_orally'], $vars ['pers_convince'],
                  $vars ['iden_symb'], $vars ['accept_dif'], $vars ['use_tools'], $vars ['learn_update'], $vars ['creative_innovative'],
                  $vars ['search_analyze_manage_share'], $vars ['create_innovate'], $vars ['design_implement'], $vars ['solve_problem'],
                  $vars ['abstraction'], $vars ['underst'], $vars ['take_culture'], $vars ['assume_resp'], $vars ['planning_time'],
                  $vars ['computer_tools'], $vars ['imp_projects'], $vars ['team_work'], $vars ['indep_work'], $vars ['apply_val'],
                  $vars ['adapt_changes'], $vars ['pressure_work'], $vars ['strong_comp'], $vars ['weak_comp'], $vars ['useful_comp'],
                  $vars ['useless_comp']
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
