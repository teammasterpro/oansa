<?php
class Usuario{
    
    private $id;
    private $nombre;
    private $email;
    private $clave;
    private $fechaRegistro;
    private $activo;

    public function __construct($id, $nombre, $email, $clave, $fechaRegistro, $activo){
        $this -> id = $id;
        $this -> nombre = $nombre;
        $this -> email = $email;
        $this -> clave = $clave;
        $this -> fechaRegistro = $fechaRegistro;
        $this -> activo = $activo;
    }

    public function getId(){
        return $this -> id;
    }

    public function getNombre(){
        return $this -> nombre;
    }

    public function getEmail(){
        return $this -> email;
    }

    public function getClave(){
        return $this -> clave;
    }

    public function getFechaRegistro(){
        return $this -> fechaRegistro;
    }

    public function getActivo(){
        return $this -> activo;
    }

    public function setNombre($nombre){
        $this -> nombre = $nombre;
    }

    public function setEmail($email){
        $this -> email = $email;
    }

    public function setClave($clave){
        $this -> clave = $clave;
    }

    public function setActivo($activo){
        $this -> activo = $activo;
    }
}
?>