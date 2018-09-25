<?php

class ValidarRegistro {

    private $nombre;
    private $email;
    
    private $errorNombre;
    private $errorEmail;
    private $errorClave;
    private $errorRclave;

    public function __construct($nombre, $email, $clave, $rclave){
        $this -> nombre = "";
        $this -> email = "";

        $this -> $errorNombre = $this -> validarNombre($nombre);
        $this -> $errorEmail = $this -> ValidarEmail($email);
        $this -> $errorClave = $this -> validarClave($clave);
        $this -> $errorRclave = $this -> validarRclave($clave, $rclave);
    }

    private function variableIniciada($variable){
        if(isset($variable) && !empty($variable)){
        return true;
        } else{
            return false;
        }
    }

    private function validarNombre($nombre){
        if(!$this -> variableIniciada($nombre)){
            return "Debes escribir tu nombre";
        } else{
            $this -> nombre = $nombre;
        }

        return "";
    }

    private function ValidarEmail($email){
        if(!$this -> variableIniciada($email)){
            return "Debes proporcionar un email";
        } else{
            $this -> email = $email;
        }

        return "";
    }

    private function validarClave($clave){
        if(!$this -> variableIniciada($clave)){
            return "Debes escribir una contraseña";
        }

        return "";
    }

    private function validarRclave($clave, $rclave){
        if(!$this -> variableIniciada($clave)){
            return "Debes crear una contraseña";
        }

        if(!$this -> variableIniciada($rclave)){
            return "Debes repetir tu contraseña";
        }
        
        if($clave !== $rclave){
            return "Las contraseñas los coniciden";
        }
        return "";
    }

    public function getNombre(){
        return $this -> nombre;
    }

    public function getEmail(){
        return $this -> email;
    }

    public function getErrorNombre(){
        return $this -> $errorNombre;
    }

    public function getErrorEmail(){
        return $this -> $errorEmail;
    }
    
    public function getErrorClave(){
        return $this -> $errorClave;
    }

    public function getErrorRclave(){
        return $this -> $errorRclave;
    }

    public function getError(){
        if($errorNombre != ""){
            return array("nombre",$errorNombre);
        }
    }
}

?>