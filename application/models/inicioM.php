<?php

class InicioM extends CI_Model
{
    public function obtenerPais()
    {
        $result = $this->db->query("select * from v_pais");

        return $result;
    }
}
?>