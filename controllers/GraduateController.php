<?php
    class GraduateController {
    	private $config;

        public function __construct () {$this->config = Config::singleton ();}

        public function saveData () {
        	header ('Content-type: application/json; charset=utf-8');
        	$json = null;

        	if (isset ($_POST [''])) {        		
	        	require $this->config->get ('modelsF').'GraduateModel.php';
	        	$graduateModel = new GraduateModel;	        	
	        	$graduateModel->setData (
	        		$_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST [''], $_POST ['']
	        	);

	        	$json = array ('status' => true);
        	}
        	else $json = array ('status' => false);
        	
            echo json_encode ($json);
        }
    }
?>
