<?php

class Conexion{
    private static $conexion;

    public static function abrirConexion(){
        if(!isset(self::$conexion)){    //Si no esta iniciada la variable conexion
            try{
                include_once 'config.inc.php';  //agregar lo que hay en config.inc = juntar otros partes de codigo

                self::$conexion = new PDO("mysql:host=$nombre_servidor; dbname=$db",$nombre_usuario,$clave); //Drvier que trabaja hasta con 20 db distintas
                //self::$conexion=new PDO("mysql:host=$nombre_servidor; dbname=$nombre_db", $nombre_usuario,$password);
                self::$conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$conexion -> exec("SET CHARACTER SET utf8");

                //print "Conexión abierta" ."<br>";
            }catch (PDOException $ex){
                print "Error: ". $ex -> getMessage() . "<br>";
                die();
            }
        }
    }

    public static function cerrarConexion(){
        if(isset(self::$conexion)){
            self::$conexion = null;
        }
        //print "Conexión cerrada";
    }

    public static function getConexion(){
        return self::$conexion;
    }
}
?>