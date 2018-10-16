<?php

class OpcionesC extends CI_Controller
{

    public function index()
    {
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

    public function oansa()
    {
            //Codigo para cargar la vista de general
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('menu');
    }

    public function asistencias()
    {
            //Codigo para cargar la vista de estadisticas de asistencia
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('page-error');
    }

    public function puntaje()
    {
            //Codigo para cargar la vista de estadisticas de puntaje
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('page-error');
    }

    public function crecimiento()
    {
            //Codigo para cargar la vista de estadisticas de crecimiento
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('ui-cards');
    }

    public function calificacionEstudiantes()
    {
            //Codigo para cargar la vista de Registrar calificación de estudiantes
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('form-samples');
    }

    public function calificacionLideres()
    {
            //Codigo para cargar la vista de Registrar calificación de lideres
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('page-invoice');
    }

    public function miembrosEstudiantes()
    {
            //Codigo para cargar la vista de miembros estudiantes
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('page-calendar');
    }

    public function miembrosLideres()
    {
            //Codigo para cargar la vista de miembros lideres
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('lideres');
    }

    public function responsabilidadVer()
    {
            //Codigo para cargar la vista de ver Responsabilidades
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('form-custom');
    }

    public function responsabilidadGestionar()
    {
            //Codigo para cargar la vista de gestionar Responsabilidades
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('form-components');
    }

    public function cursos()
    {
            //Codigo para cargar la vista de cursos
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('page-mailbox');
    }

    public function noticias()
    {
            //Codigo para cargar la vista de noticias   
        $data = $this->input->post();
        print_r($data);

        $nombre = $this->input->post("nombre");
        $rol = $this->input->post("rol");
        $foto = $this->input->post("foto");

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('noticias');
    }

    public function eventos()
    {
            //Codigo para cargar la vista de eventos
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('eventos');
    }

    public function puntajes()
    {
            //Codigo para cargar la vista de puntajes
        $nombre = $this->input->post('nombre');
        $rol = $this->input->post('rol');
        $foto = $this->input->post('foto');

        $datos = array(

            'nombre' => $nombre,
            'rol' => $rol,
            'foto' => $foto,
            'mensaje' => "Bienvenido"
        );

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php', $datos);
        $this->load->view('table-basic');
    }
}

?>