<?php
  class Validator {
    private $vars;

    public function __construct ($vars = null) {$this->vars = $vars;}

    public function validate () {
      if ($this->vars != null) {
        foreach ($this->vars as $key => $value) {
          if (!isset ($value) || $value == null) return false;
        }

        return true;
      }
      else return false;
    }
  }
?>
