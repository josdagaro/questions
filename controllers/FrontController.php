<?php
    class FrontController {
        public static function main (Request $petition) {
            require 'libs/Config.php';
            require 'libs/SPDO.php';
            require 'config.php';
            if (!$petition->getController ()) $controllerName = $config->get ('defaultController');
            else $controllerName = $petition->getController ();
            $controllerName = $controllerName.'Controller';
            $actionName = $petition->getAction ();
            $controllerPath = $config->get ('controllersF').$controllerName.'.php';
            if (is_file ($controllerPath)) require $controllerPath;
            else die ('El controlador no existe - 404 not found');

            if (is_callable (array ($controllerName, $actionName)) == false)
                trigger_error ($controllerName.'->'.$actionName.'` no existe', E_USER_NOTICE);

            $controller = new $controllerName ();

            if ($petition->getArguments () != null)
                call_user_func (array ($controller, $actionName), $petition->getArguments ());
            else call_user_func (array ($controller, $actionName));
        }
    }
?>
