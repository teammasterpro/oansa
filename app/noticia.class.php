<?php 
class Noticia 
{
    private $idnoticia;
    private $nombre;
    private $fecha;
    private $descripcion;
    private $iglesia;
    private $idFoto;
    private $foto;
    
    public function __construct($idnoticia, $nombre, $fecha, $descripcion, $iglesia, $idFoto, $foto)
    {
        $this -> idnoticia = $idnoticia;
        $this -> nombre = $nombre;
        $this -> fecha = $fecha;
        $this -> descripcion = $descripcion;
        $this -> iglesia = $iglesia;
        $this -> idFoto = $idFoto;
        $this -> foto = $foto;
    }

    public function getIdNoticia()
    {
        return $this -> idnoticia;
    }

    public function getNombre()
    {
        return $this -> nombre;
    }

    public function getFecha()
    {
        return $this -> fecha;
    }

    public function getDescripcion()
    {
        return $this -> descripcion;
    }

    public function getIglesia()
    {
        return $this -> iglesia;
    }

    public function getIdFoto()
    {
        return $this -> Idfoto;
    }

    public function getFoto()
    {
        return $this -> foto;
    }

    public function setIdNoticia($idnoticia)
    {
        $this -> idnoticia = $idnoticia;
    }

    public function setNombre($nombre)
    {
        $this -> nombre = $nombre;
    }

    public function setFecha($fecha)
    {
        $this -> fecha = $fecha;
    }

    public function setDescripcion($descripcion)
    {
        $this -> descripcion = $descripcion;
    }

    public function setIglesia($iglesia)
    {
        $this -> iglesia = $iglesia;
    }

    public function setIdFoto($idFoto){
        $this -> idFoto = $idFoto;
    }

    public function setFoto($foto){
        $this -> foto = $foto;
    }

    public function validarFoto(){
        
    }
}
 
?>