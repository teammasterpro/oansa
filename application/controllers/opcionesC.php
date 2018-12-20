<?php

class OpcionesC extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
     
        // load Session Library
        $this->load->library('session');
         
        // load url helper
        $this->load->helper('url');
    }

    public function index()
    {
        $usuario = $this->input->post('usuario');
        $password = $this->input->post('password');

        $this->load->model('loginM');

        $fila = $this->loginM->getDatos($usuario, $password);

        if ($fila != null) {

            $datos = array(
                'idlider' => $fila->idLider,
                'nombre' => $fila->nombre,
                'rol' => $fila->tipoLider,
                'foto' => $fila->perfil,
                'iglesia' => $fila->iglesia,
                'estado' => $fila->estado
            );
            $this->session->set_userdata($datos, true);

            if ($this->session->userdata('estado') == 'Activo') {
                if ($this->session->userdata('rol') == 'Director General') {

                } else if ($this->session->userdata('rol') == 'Director Local') {
                    $this->load->view("/plantillas/inicio.inc.php");
                    $this->load->view("/plantillas/navbar.inc.php");
                    $this->load->view("/plantillas/opciones.inc.php");
                    $this->load->view("menu");
                }
            }


        } else {
            
            $datos = array(
                'titulo' => "Error : ",
                'mensaje' => "Datos incorrectos",
                'icono' => 'fa fa-ban',
                'tipo' => "danger"
            );
            $this->load->view("/plantillas/navbarInicio.inc.php");
            $this->load->view("index", $datos);
        }
    }

    public function registrariglesia()
    {
        $this->load->view("/plantillas/navbarInicio.inc.php");
        $this->load->view('reg-iglesia');
    }

    public function oansa()
    {
            //Codigo para cargar la vista de general


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('menu');
    }

    public function configuracion()
    {
            //Codigo para cargar la vista de general


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-user');
    }

    public function perfil()
    {
            //Codigo para cargar la vista de general


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-user');
    }

    public function cerrarSesion()
    {
            //Codigo para cargar la vista de general

        session_destroy();
        $this->load->view('index');
    }

    public function asistencias()
    {
            //Codigo para cargar la vista de estadisticas de asistencia


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-error');
    }

    public function puntaje()
    {
            //Codigo para cargar la vista de estadisticas de puntaje


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-error');
    }

    public function crecimiento()
    {
            //Codigo para cargar la vista de estadisticas de crecimiento


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('ui-cards');
    }

    public function calificacionEstudiantes()
    {
            //Codigo para cargar la vista de Registrar calificación de estudiantes


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('form-samples');
    }

    public function calificacionLideres()
    {
            //Codigo para cargar la vista de Registrar calificación de lideres


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-invoice');
    }

    public function miembrosEstudiantes()
    {
            //Codigo para cargar la vista de miembros estudiantes


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-calendar');
    }

    public function miembrosLideres()
    {
            //Codigo para cargar la vista de miembros lideres


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('lideres');
    }

    public function responsabilidadVer()
    {
            //Codigo para cargar la vista de ver Responsabilidades

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
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
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('form-components');
    }

    public function cursos()
    {
            //Codigo para cargar la vista de cursos

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('page-mailbox');
    }

    public function noticias()
    {
            //Codigo para cargar la vista de noticias   

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('noticias');
    }

    public function eventos()
    {
            //Codigo para cargar la vista de eventos

        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('eventos');
    }

    public function puntajes()
    {
            //Codigo para cargar la vista de puntajes


        $this->load->view('/plantillas/inicio.inc.php');
        $this->load->view('/plantillas/navbar.inc.php');
        $this->load->view('/plantillas/opciones.inc.php');
        $this->load->view('table-basic');
    }
}

?>