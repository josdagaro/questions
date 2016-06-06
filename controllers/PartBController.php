<?php
    require Config::singleton ()->get ('controllersF').'Controller.php';

    class PartBController extends Controller {
        public function __construct () {
          parent::__construct ();
          require $this->config->get ('modelsF').'PartBModel.php';
          $this->model = new PartBModel;

          $data = array (
            'languages', 'presentIdeas', 'comOrally', 'persConvince', 'idenSymb', 'acceptDif', 'useTools', 'learnUpdate',
            'creativeInnovative', 'searchAnalyzeManageShare', 'createInnovate', 'designImplement', 'solveProblem', 'abstraction',
            'underst', 'takeCulture', 'assumeResp', 'planningTime', 'computerTools', 'impProjects', 'teamWork', 'indepWork',
            'applyVal', 'adaptChanges', 'pressureWork', 'strongComp', 'weakComp', 'usefulComp', 'uselessComp'
          );

          $size = sizeof ($data);
          for ($i = 0; $i < $size; $i ++) $this->items [$i + 1] = $data [$i];
        }

        public function saveData () {
          header ('Content-type: application/json; charset=utf-8');
          $json = null;

          if ($this->session->exists ()) {
            if (isset ($_POST ['graduateId']) && isset ($_POST ['languages']) && isset ($_POST ['presentIdeas']) &&
            isset ($_POST ['comOrally']) && isset ($_POST ['persConvince']) && isset ($_POST ['idenSymb']) &&
            isset ($_POST ['acceptDif']) && isset ($_POST ['useTools']) && isset ($_POST ['learnUpdate']) &&
            isset ($_POST ['creativeInnovative']) && isset ($_POST ['searchAnalyzeManageShare']) &&
            isset ($_POST ['createInnovate']) && isset ($_POST ['designImplement']) && isset ($_POST ['solveProblem']) &&
            isset ($_POST ['abstraction']) && isset ($_POST ['underst']) && isset ($_POST ['takeCulture']) &&
            isset ($_POST ['assumeResp']) && isset ($_POST ['planningTime']) && isset ($_POST ['computerTools']) &&
            isset ($_POST ['impProjects']) && isset ($_POST ['teamWork']) && isset ($_POST ['indepWork']) &&
            isset ($_POST ['applyVal']) && isset ($_POST ['adaptChanges']) && isset ($_POST ['pressureWork']) &&
            isset ($_POST ['strongComp']) && isset ($_POST ['weakComp']) && isset ($_POST ['usefulComp']) &&
            isset ($_POST ['uselessComp'])) {
              require 'libs'.ds.'Validator.php';
              $vars = array ();
              $size = sizeof ($this->items);
              for ($i = 0; $i < $size; $i ++) $vars [$this->items [$i]] = $_POST [$this->items];
              $validator = new Validator ($vars);

              if ($validator->validate ()) {
                $this->model->setData (
                  $vars ['graduateId'], $vars ['languages'], $vars ['presentIdeas'], $vars ['comOrally'], $vars ['persConvince'],
                  $vars ['idenSymb'], $vars ['acceptDif'], $vars ['useTools'], $vars ['learnUpdate'], $vars ['creativeInnovative'],
                  $vars ['searchAnalyzeManageShare'], $vars ['createInnovate'], $vars ['designImplement'], $vars ['solveProblem'],
                  $vars ['abstraction'], $vars ['underst'], $vars ['takeCulture'], $vars ['assumeResp'], $vars ['planningTime'],
                  $vars ['computerTools'], $vars ['impProjects'], $vars ['teamWork'], $vars ['indepWork'], $vars ['applyVal'],
                  $vars ['adaptChanges'], $vars ['pressureWork'], $vars ['strongComp'], $vars ['weakComp'], $vars ['usefulComp'],
                  $vars ['uselessComp']
                );

                $json = array ('status' => true);
              }
              else $json = array ('status' => false);
            }
            else $json = array ('status' => false);
          }

          echo json_encode ($json);
        }
    }
?>
