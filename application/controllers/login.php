<?php

class Login extends CI_Controller
{
    public function index()
    {
        $usuario = $this->input->post('usuario');
        $password = $this->input->post('password');

        $this->load->model('loginm');

        $fila = $this->loginm->getDatos($usuario, $password);

        if ($fila != null) {

            $datos = array(

                'nombre' => $fila->Nombre,
                'rol' => $fila->rol,
                'foto' => $fila->Foto, 
                'mensaje' => "Bienvenido"
            );
            $this->load->view("menu", $datos);

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