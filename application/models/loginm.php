<?php

class LoginM extends CI_Model
{
    public function getDatos($usuario = '', $password = '')
    {
        $result = $this->db->query("call login('" . $usuario . "', '" . $password . "')");

        return $result->row();
    }
}
?>