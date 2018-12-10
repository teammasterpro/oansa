<?php

class InicioM extends CI_Model
{
    public function obtenerPais()
    {
     $resultPais = $this->db->query("select * from v_pais");
                                                       
           return $resultPais;
    }

    public function obtenerDepMuni()
    {

        $result = mysqli_query([
            'country' => 'CALL ListarDepart('. $_GET['id'].')',
            'region' => 'CALL ListarMuni('. $_GET['id'].')'
        ][ $_GET['query'] ]);

        return $result;
       
    }

    public function obtenerDeno()
    {
     $resultDeno = $this->db->query("select * from v_denominacion");
                                                       
           return $resultDeno;
    }

}
?>