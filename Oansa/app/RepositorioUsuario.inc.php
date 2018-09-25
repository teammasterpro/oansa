<?php

class RepositorioUsuario {

    public static function getUsuarios($conexion){
        $usuarios = array();

        if(isset($conexion)){
            try{
                include_once 'Usuario.class.php';

                $sql = "SELECT * from usuarios";
                $sentencia = $conexion -> prepare($sql); //se usa prepare para Escapar caracteres en la consulta
                $sentencia -> execute();
                $resultado = $sentencia -> fetchALL();

                if(count($resultado)){
                    foreach ($resultado as $fila) {
                        $usuarios [] = new Usuario(
                            $fila['id'], $fila['nombre'], $fila['email'], $fila['clave'], $fila['fecha_registro'], $fila['activo']
                        );                        
                    }
                }else{
                    print "No hay usuarios registrados";
                }

            }catch (PDOException $ex){
                print "Error" . $ex -> getMessage();
            }
        }

        return $usuarios;
    }

    public static function cantUsuarios($conexion){
        $cantUsuarios = nul;

        if(isset($conexion)){
            try{
                $sql = "SELECT COUNT(*) as total FROM usuarios";
                $sentecia = $conexion -> prepare($sql);
                $sentecia -> execute();
                $resultado = $sentecia -> fetch();
                $cantUsuarios = $resultado['total'];
            } catch (PDOExeption $ex){
                print "Error" . $ex -> getMessage();
            }
        }
        return $cantUsuarios;
    }

}

?>