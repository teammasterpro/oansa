<?php
    class Inicio extends CI_Controller
    {
        public function index()
        {
            $datos = array(
                'mensaje' => null
            );
            $this->load->view("index", $datos);
        }
    }
    