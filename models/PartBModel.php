<?php
    require Config::singleton ()->get ('modelsF').'Model.php';

    class PartBModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $languages, $presentIdeas, $comOrally, $persConvince, $idenSymb, $acceptDif, $useTools, $learnUpdate, $creativeInnovative, $searchAnalyzeManageShare, $createInnovate, $designImplement, $solveProblem, $abstraction, $underst, $takeCulture, $assumeResp, $planningTime, $computerTools, $impProjects, $teamWork, $indepWork, $applyVal, $adaptChanges, $pressureWork, $strongComp, $weakComp, $usefulComp, $uselessComp) {
            $query = $this->database->prepare (
                'CALL setPartB (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
            );

            $query->bindParam (1, $graduateId);
            $query->bindParam (2, $languages);
            $query->bindParam (3, $presentIdeas);
            $query->bindParam (4, $comOrally);
            $query->bindParam (5, $persConvince);
            $query->bindParam (6, $idenSymb);
            $query->bindParam (7, $acceptDif);
            $query->bindParam (8, $useTools);
            $query->bindParam (9, $learnUpdate);
            $query->bindParam (10, $creativeInnovative);
            $query->bindParam (11, $searchAnalyzeManageShare);
            $query->bindParam (12, $createInnovate);
            $query->bindParam (13, $designImplement);
            $query->bindParam (14, $solveProblem);
            $query->bindParam (15, $abstraction);
            $query->bindParam (16, $underst);
            $query->bindParam (17, $takeCulture);
            $query->bindParam (18, $assumeResp);
            $query->bindParam (19, $planningTime);
            $query->bindParam (20, $computerTools);
            $query->bindParam (21, $impProjects);
            $query->bindParam (22, $teamWork);
            $query->bindParam (23, $indepWork);
            $query->bindParam (24, $applyVal);
            $query->bindParam (25, $adaptChanges);
            $query->bindParam (26, $pressureWork);
            $query->bindParam (27, $strongComp);
            $query->bindParam (28, $weakComp);
            $query->bindParam (29, $usefulComp);
            $query->bindParam (30, $uselessComp);
            $query->execute ();
        }

        public function getData () {
          $query = $this->database->prepare ('CALL getAllPartB ()');
    			$query->execute ();
    			return $query->fetchAll ();
        }
    }
?>
