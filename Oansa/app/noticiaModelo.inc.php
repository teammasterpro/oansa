<?php
class noticiaModelo
{
    
    public static function getNoticia($conexion){
        $noticia = array();

        if(isset($conexion)){
            try{
                include_once 'noticia.class.php';

                
                $sql  = 'SELECT * FROM `noticia`,`fotonoticia` WHERE `noticia`.`idNoticia` = `fotonoticia`.`idnoticia`';
                $sentencia = $conexion -> prepare($sql); //se usa prepare para Escapar caracteres en la consulta
                $sentencia -> execute();
                $resultado = $sentencia -> fetchALL();

                if(count($resultado)){
                    foreach ($resultado as $fila) {
                        $noticia [] = new Noticia(
                            $fila['idnoticia'], $fila['Nombre'], $fila['Fecha'], $fila['Descripcion'], $fila['Iglesia'], $fila['idfoto'], $fila['Foto']
                        );                        
                    }
                }else{
                    print "No hay noticias registradas";
                }

            }catch (PDOException $ex){
                print "Error" . $ex -> getMessage();
            }
        }

        return $noticia;
    }

    public static function setNoticia($conexion, $noticia){
        $noticiaRegistrada = false;
        if(isset($conexion)){
            try{                
                $sql  = "INSERT INTO `noticia`(`idNoticia`, `Nombre`, `Fecha`, `Descripcion`, `Iglesia`) VALUES (:idnoticia, :nombre, NOW(), :descripcion, iglesia)";

                $sentencia = $conexion -> prepare($sql); //se usa prepare para Escapar caracteres en la consulta
                $sentencia -> bindParam(':idnoticia', $noticia -> getIdNoticia(), PDO::PARAM_LOB);
                $sentencia -> bindParam(':nombre', $usuario -> obtener_nombre(), PDO::PARAM_STR);
                $sentencia -> bindParam(':descripcion', $noticia -> getDescripcion(), PDO::PARAM_STR);
                $sentencia -> bindParam(':iglesia', $noticia -> getIglesia(), PDO::PARAM_STR);
                
                $noticiaRegistrada = $sentencia -> execute();

                $sql  = 'INSERT INTO `fotonoticia`(`idfoto`, `idnoticia`, `Foto`) VALUES ($idfoto,$idnoticia,$foto)';
                $sentencia = $conexion -> prepare($sql); //se usa prepare para Escapar caracteres en la consulta
                $sentencia -> execute();
                $resultado = $sentencia -> fetchALL();

            }catch (PDOException $ex){
                print "Error" . $ex -> getMessage();
            }
        }
    }
}

?>