<?php
    class InicioC extends CI_Controller
    {
        public function index()
        {
            $this->load->model('inicioM');

            $result = $this->inicioM->obtenerPais();
            $datos = array('consulta' => $result);
            
            $this->load->view("index", $datos);
            
        }

        public function departamento($pais)
        {
            echo $pais;
            $this->load->model('inicioM');
        }
    }
    