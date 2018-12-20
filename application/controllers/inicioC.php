<?php
    class InicioC extends CI_Controller
    {
      

        public function index()
        {
            $this->load->view("/plantillas/navbarInicio.inc.php");
            $this->load->view("index");
        }

        public function datos()
        {
            $datos['paises'] = $this->db->query("select * from paises")->result_array();
            $datos['denominaciones'] = $this->db->query("select * from denominaciones")->result_array();
            print(json_encode($datos));
        }

        public function departamentos($pais='')
        {

           // $d = $this->db->query("select * from departamentos where pais=('". $pais."')")->result_array();
            $this->db->select('*')->from('departamentos')->where('departamentos.pais', $pais);
            $query=$this->db->get()->result_array();
            print(json_encode($query));
        }

       

        public function iglesias() 
        {
            $r = $this->input->post();


            $d = $this->db->query("CALL ListarIglesiaByBusqueda('". $r['pais']."','". $r['departamento']."',
            '". $r['municipio']."','". $r['denominacion']."')")->result_array();
           print_r(json_encode($d));
             

            
        }

        public function eventos($igle=''){

            $d = $this->db->query("CALL ListarEventos('". $igle."')")->result_array();
            
            print(json_encode($d));

        }

        public function Noticias($igle='',$inicio=''){
            //setcookie("iglesia","",time()-1000,"/");
            setcookie("iglesia",$igle,time()+60*60*24*365,"/");

            $d= $this->db->query("select * from noticias where noticias.iglesia='".$igle."' ORDER BY noticias.fecha DESC LIMIT 0,20 ")->result_array();
            print(json_encode($d));
        }

    }
    ?>