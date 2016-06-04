<?php
    class PartBModel extends Model {
        public function __construct () {parent::__construct ();}

        public function setData ($graduateId, $languages, $presentIdeas, $comOrally, $persConvince, $idenSymb, $acceptDif, $useTools, $learnUpdate, $creativeInnovative, $searchAnalyzeManageShare, $designImplement, $solveProblem, $abstraction, $underst, $takeCulture, $assumeResp, $planningTime, $computerTools, $impProjects, $teamWork, $indepWork, $applyVal, $adaptChanges, $pressureWork, $strongComp, $weakComp, $usefulComp, $uselessComp) {
            $query = $this->database->prepare (
                'CALL setPartB (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
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
            $query->bindParam (12, $designImplement);
            $query->bindParam (13, $solveProblem);
            $query->bindParam (14, $abstraction);
            $query->bindParam (15, $underst);
            $query->bindParam (16, $takeCulture);
            $query->bindParam (17, $assumeResp);
            $query->bindParam (18, $planningTime);
            $query->bindParam (19, $computerTools);
            $query->bindParam (20, $impProjects);
            $query->bindParam (21, $teamWork);
            $query->bindParam (22, $indepWork);
            $query->bindParam (23, $applyVal);
            $query->bindParam (24, $adaptChanges);
            $query->bindParam (25, $pressureWork);
            $query->bindParam (26, $strongComp);
            $query->bindParam (27, $weakComp);
            $query->bindParam (28, $usefulComp);
            $query->bindParam (29, $uselessComp);
            $query->execute ();
        }
    }
?>
