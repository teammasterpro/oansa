<?php

class LoginC extends CI_Controller
{
    public function index()
    {
        $this->session->sess_destroy();
        $usuario = $this->input->post('usuario');
        $password = $this->input->post('password');

        $this->load->model('loginM');

        $fila = $this->loginM->getDatos($usuario, $password);

        if ($fila != null) {

            $datos = array(

                'nombre' => $fila->nombre,
                'rol' => $fila->rol,
                'foto' => $fila->Foto, 
                'mensaje' => "Bienvenido"
            );
            $this->load->view("/plantillas/inicio.inc.php");
            $this->load->view("/plantillas/navbar.inc.php");
            $this->load->view("/plantillas/opciones.inc.php", $datos);
            $this->load->view("menu");

        } else {
            $datos = array(
                'titulo' => "Error : ",                
                'mensaje' => "Datos incorrectos",
                'icono' => 'fa fa-check',
                'tipo' => "danger"
            );
            $this->load->view("index", $datos);
        }


        //cookie
        /*$data = array('usuario' => $usuario, 'id' => 0, 'login' => true);
        $this->session->set_userdata($data);*/
    }
}