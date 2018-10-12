<?php

    class OpcionesC extends CI_Controller
    {
        public function oansa()
        {
            //Codigo para cargar la vista de general
            $this->load->view('menu');
        }

        public function asistencias()
        {
            //Codigo para cargar la vista de estadisticas de asistencia
            $this->load->view('page-error');
        }

        public function puntaje()
        {
            //Codigo para cargar la vista de estadisticas de puntaje
            $this->load->view('page-error');
        }

        public function crecimiento()
        {
            //Codigo para cargar la vista de estadisticas de crecimiento
            $this->load->view('ui-cards');
        }
        
        public function calificacionEstudiantes()
        {
            //Codigo para cargar la vista de Registrar calificación de estudiantes
            $this->load->view('form-samples');
        }

        public function calificacionLideres()
        {
            //Codigo para cargar la vista de Registrar calificación de lideres
            $this->load->view('page-invoice');
        }

        public function miembrosEstudiantes()
        {
            //Codigo para cargar la vista de miembros estudiantes
            $this->load->view('page-calendar');
        }

        public function miembrosLideres()
        {
            //Codigo para cargar la vista de miembros lideres
            $this->load->view('lideres');
        }

        public function responsabilidadVer()
        {
            //Codigo para cargar la vista de ver Responsabilidades
            $this->load->view('form-custom');
        }

        public function responsabilidadGestionar()
        {
            //Codigo para cargar la vista de gestionar Responsabilidades
            $this->load->view('form-components');
        }

        public function cursos()
        {
            //Codigo para cargar la vista de cursos
            $this->load->view('page-mailbox');
        }

        public function noticias()
        {
            //Codigo para cargar la vista de noticias
            $this->load->view("/plantillas/inicio.inc.php");
            $this->load->view("/plantillas/navbar.inc.php");
            $this->load->view("/plantillas/opciones.inc.php", $datos);
            $this->load->view('noticias');
        }

        public function eventos()
        {
            //Codigo para cargar la vista de eventos
            $this->load->view('eventos');
        }

        public function puntajes()
        {
            //Codigo para cargar la vista de puntajes
            $this->load->view('table-basic');
        }
    }

?>