<!DOCTYPE html>
<html lang="es">
<head>
  <link rel="icon" href="<?= base_url() ?>img/oansa.ico" />
  <meta
  name="description"
  content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular."
  />
  <!-- Twitter meta -->
  <meta property="twitter:card" content="summary_large_image" />
  <meta property="twitter:site" content="@pratikborsadiya" />
  <meta property="twitter:creator" content="@pratikborsadiya" />
  <!-- Open Graph Meta -->
  <meta property="og:type" content="website" />
  <meta property="og:site_name" content="Vali Admin" />
  <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme" />
  <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin"/>
  <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png"/>
  <meta property="og:description"
  content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular."/>
  <title>Oansa</title>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Main CSS -->
  <link rel="stylesheet" type="text/css" href="<?= base_url() ?>css/main.css" />
  <!-- Font-icon css -->
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    
</head>

<body class="app sidebar-mini rtl" style="overflow-x:hidden;">
  <!-- Navbar -->
  <header class="app-header">
    <a class="app-header__logo" href="index" ><input type="image" src="<?= base_url() ?>img/oansa.png" alt="description" align="Right" /></a>

    <!-- Navbar Right Menu -->
    <ul class="app-nav">
      <li id="list_desplegable">
        <a class="app-nav__item" href="#"><i class="fa fa-edit"></i>Acerca de</a>
        <ul>
          <li>
            <a href="#" data-toggle="modal" data-target="#modalOansa">¿Qué es Oansa?</a>
          </li>
          <li>
            <a href="#" data-toggle="modal" data-target="#modalHimno">Himno de Oansa</a>
          </li>
          <li>
            <a href="#" data-toggle="modal" data-target="#modalPromesa">Promesa o Lema</a>
          </li>
          <li>
            <a href="#" data-toggle="modal" data-target="#modalVersiculo">Versiculo</a>
          </li>
        </ul>
      </li>

      <li>
        <a class="app-nav__item" href="#" data-toggle="modal" data-target="#modalEstudiante" ><i class="fa fa-book"></i> Estudiante</a>
      </li>
      <li>
        <a class="app-nav__item" href="#"><i class="fa fa-money"></i> Donación</a>
      </li>
      <li>
        <a class="app-nav__item" href="<?= base_url() ?>opcionesC/registrariglesia"><i class="fa fa-edit"></i> Registrar iglesia</a>
      </li>
      <li>
        <a class="app-nav__item" href="#" data-toggle="modal" data-target="#modalLogin"><i class="fa fa-user"></i> IniciarSesión</a>
      </li>

        <!-- Modal Login -->
        <form class="login-form" action="<?= base_url() ?>opcionesC" method="POST">
        <div class="modal fade" id="modalLogin" tabindex="10" role="dialog" aria-labelledby="modalLoginCenterTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user"></i> Ingresar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <label class="control-label">Usuario</label>
                  <input class="form-control" type="text" name="usuario" placeholder="Usuario" autofocus>
                </div>
                <div class="form-group">
                  <label class="control-label">Contraseña</label>
                  <input class="form-control" type="password" name="password" placeholder="Contraseña">
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
                <button class="btn btn-primary" type="submit"><i class="fa fa-sign-in"></i>Entrar</button>
              </div>
            </div>
          </div>
        </div>
      </form>

 <!-- Modal evento -->
    <div id="modalEventoDiv">
      <div class="modal fade bd-example-modal-lg" id="modalEvento" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
                <div class="modal-header" >
                  <h5 class="modal-title colormodal" id="exampleModalCenterTitle" " ><i class="fa fa-calendar"></i> {{eventosmodal.nombre}} </h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                <div class="row">
                <div class="col-md-7">
                  <div class="form-group for">
                    <label class="control-label"><h6>{{eventosmodal.fechaEvento}}</h6></label>
                    <br>
                    <h5>Descripcion</h5>
                    <p class="text-justify"> {{eventosmodal.descripcion}} </p>
                    <h5>Recomendacion</h5>
                    <p class="text-justify"> {{eventosmodal.recomendacion}}  </p>
                  </div>
                  </div>
                                     
                  <div class = "col-md-4">
                    <img src="<?= base_url() ?>{{eventosmodal.foto}}" style="width: 300px; height: 200px;">
                  </div>
                </div>              
                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
                </div>
                </div>
          </div>
        </div>
       </div>

    </div>

<!-- Modal estudiante -->

<div class="modal fade" id="modalEstudiante" tabindex="10" role="dialog" aria-labelledby="modalEstudianteCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user"></i> Datos del estudiante </h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  <div class="modal-body">
    <div class="form-group">
      <label class="control-label">Documento del acudiente</label>
      <input class="form-control" type="password" placeholder="Acudiente" autofocus />
    </div>
    <div class="form-group">
      <label class="control-label">Documento del estudiante</label>
      <input class="form-control" type="password" placeholder="Estudiante" />
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">
      <i class="fa fa-close"></i>Cerrar
    </button>
    <button class="btn btn-primary">
      <i class="fa fa-sign-in fa-lg fa-fw"></i>Entrar
    </button>
  </div>
</div>
</div>
</div>

<!-- Modal oansa -->
<div class="modal fade" id="modalOansa" tabindex="10" role="dialog" aria-labelledby="modalOansaCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <img src="<?= base_url() ?>img/oansa.png" alt="Oansa" style="position: initial"/>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
       <span aria-hidden="true">&times;</span>
      </button>
  </div>
  <div class="modal-body">
    <p class="text-justify">
      Es un ministerio bibliocéntrico, no denominacional, dirigido a
      las Iglesias Evangélicas, que provee programas para niños,
      niñas, adolescentes y jóvenes. Por ser un ministerio para la
      Iglesia, es administrado por ella (la Iglesia local), siendo
      uno de los objetivos, el desarrollo de sus miembros. El
      enfoque en la juventud da un resultado fructífero en la
      expansión de la iglesia local. No solamente se atraen niños y
      jóvenes para guiarlos a Cristo, sino también a sus familias.
      <br />
      <br />
      Bendición #1. Ayuda a mantener el objeto principal de la
      iglesia.<br />
      Bendición #2. Provee un ambiente para el crecimiento de nuevos
      líderes de la iglesia.<br />
      Bendición #3. Asiste a la iglesia en cultivar padres con mente
      espiritual.<br />
      Bendición #4. Fundamenta a la próxima generación de la Iglesia
      a la Palabra de Dios.<br />
      Bendición #5. Edifica un sentido eclesial de comunidad y
      familia.
    </p>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal" >
      <i class="fa fa-close"></i>Cerrar
    </button>
  </div>
</div>
</div>
</div>

<!-- Modal himno -->
<div class="modal fade" id="modalHimno" tabindex="10" role="dialog" aria-labelledby="modalHimnoCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalCenterTitle"> Himno de oansa </h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
       <span aria-hidden="true">&times;</span>
      </button>
  </div>
  <div class="modal-body">
    <p>
      FIRME OANSA VA,<br />
      CON LO QUE CRISTO DA.<br />
      APROVADOS OBREROS SER<br />
      Y CUMPLIR CON SU GRAN DEBER.<br /><br />

      <strong>CORO</strong><br />
      OANSA JOVENES MARCHAD<br />
      OANSA FUERTES EN VERDAD<br />
      FIRME EN DIOS Y LA BIBLIA FIEL <br />
      OANSA VA...<br /><br />
      SEGUIR AL SALVADOR<br />
      MARCHANDO SIN TEMOR<br />
      EN SU PERFECTO AMOR<br /><br />
      LOOR CANTAR SU<br />
      CAUSA DEFENDER<br />
      SU OBRA EXTENDER<br />
      LUCHAR CON GRAN PODER<br />
      POR CRISTO EL REY..
    </p>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">
      <i class="fa fa-close"></i>Cerrar
    </button>
</div>
</div>
</div>
</div>

<!-- Modal promesa -->
<div class="modal fade" id="modalPromesa" tabindex="10" role="dialog" aria-labelledby="modalPromesaCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalCenterTitle"> Promesa </h5>
      <button type="button" class="close" data-dismiss="modal"aria-label="Close" >
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  <div class="modal-body">
    <p>
      YO ME COMPROMETO<br />
      CON EL PROPOSITO<br />
      DE LOS CLUBES OANSA.<br />
      DE ALCANZAR A LA NIÑEZ<br />
      Y LA JUVENTUD Y ENTRENARLES<br />
      PARA QUE LE SIRVAN.
    </p>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">
      <i class="fa fa-close"></i>Cerrar
    </button>
  </div>
</div>
</div>
</div>

<!-- Modal versiculo -->
<div class="modal fade" id="modalVersiculo" tabindex="10" role="dialog" aria-labelledby="modalVersiculoCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalCenterTitle"> Texto lema </h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
  </div>
  <div class="modal-body">
    <p>
      "Procura con diligencia presentarte a Dios, aprobado como
      obrero que no tiene de qué avergonzarse, que usa bien la
      Palabra de Verdad".<br />
      2 Timoteo 2:15
    </p>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal" >
      <i class="fa fa-close"></i>Cerrar
    </button>
  </div>
</div>
</div>
</div>
</ul>
</header>

<!-- Sidebar menu -->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<div class="row">
  <!-- Menú de eventos -->
  <div class="col-md-3">
    <div class="col-md-3 position-fixed" style="width: auto; height: 100%; overflow-y: scroll;">
    <br /><br /><br />
    <h4 class="border-bottom border-gray pb-2 mb-0" > 
      <font style="vertical-align: inherit;"> <font style="vertical-align: inherit;" ><i class="fa fa-calendar" ></i> Eventos</font>
      </font>
    </h4>

    <div class="media text-muted pt-3"></div>

    <div class="card" id="noEvento">
      <div class="card-header">Informacion</div>
      <div class="card-body">
        <h5 class="card-title" name="titulo"></h5>
        <p class="card-text text-justify">...No hay eventos en esta iglesia...</p>
      </div>
    </div>
    <div id="eventosDiv">
      <div v-for="d in eventos">
        <div class="card" >
        
          <div class="card-header"><h5>{{ d.nombre }}</h5></div>
          <div class="card-body">
            <h6 class="card-title" name="titulo">{{ d.fechaEvento }}</h6>
            <p class="card-text text-justify">{{ d.descripcionC }}</p>
            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#modalEvento" id="{{d.idEvento}}" 
            onclick="idboton(this)">Ver más</a>
            
          </div>   
        </div>
        <br>
      </div> 
    </div>  
  </div>
</div>

<!-- Menú de noticias -->
<div class="col-md-6">
  <br /><br />
  <br />

  <main>

        <h4 class="border-bottom border-gray pb-2 mb-0"> 
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;"><i class="fa fa-newspaper-o"></i> Noticias recientes</font>
          </font>
        </h4>
        <div class="media text-muted pt-3"></div>
            
            <div class="card"  id="noNoticias">

              <P>No hay noticias para mostrar </P>
                            
            </div>
          
            <div id="noticiasDiv">
              <div v-for="noticia in itemsNoticias">
               
                <div class="card" style="width: auto, height:auto; ;">
                
                  <!--Fotos en movimiento-->
                  <!--Agregar un foreach-->
                  <div  id="carrusel{{noticia.idNoticia}}" class="carousel slide" data-ride="carousel">
                    
                    <ol class="carousel-indicators">
                      <div v-for="foto in noticia.fotos" >

                          <li data-target="#carrusel{{noticia.idNoticia}}" data-slide-to="{{foto.id}}" :class="{ active: foto.id==0 }"></li>
                          
                      </div>  
                       
                    </ol>
                                        
                    <div class="carousel-inner">
                      <div>
                          <div v-for="foto in noticia.fotos" class="carousel-item" :class="{ active: foto.id==0 }" >
                              <img class="d-block w-100" src="<?= base_url() ?>{{foto.foto}}"  alt="First slide" >
                          </div>
                      </div>
                                          
                    </div>
                    <a class="carousel-control-prev" href="#carrusel{{noticia.idNoticia}}" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carrusel{{noticia.idNoticia}}" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                  
                  <div class="card-body">
                    <h5 class="card-title">{{noticia.nombre}} </h5>
                    <a class="card-link">{{noticia.fecha}}</a>
                    <p class="card-text text-justify">{{noticia.descripcion}} </p>
                    <a href="#" class="btn btn-primary">Ver más</a>
                   
                  </div>
                  
                </div>
                <br>
              </div>
              
        </div>
        
  </main>
</div>

<!-- Menú de busqueda -->
<div class="col-md-3">
  <div class="position-fixed" style="width: 22%; height: 100%;">
    <br /><br /><br />
    <h4 class="border-bottom border-gray pb-2 mb-0">
      <font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;"><i class="fa fa-search"></i> Búsqueda</font>
      </font>
    </h4>
    <div class="media text-muted pt-3"></div>

    <div id="lugar">
      <div class="form-group">
        <label for="exampleSelect1">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">País</font>
          </font>
        </label>
        <select class="form-control" id="pais">
          <option v-for="d in paises" :value="d.id">{{d.nombre}}</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleSelect2">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Departamento</font>
          </font>
        </label>
        <select name="region" id="departamento" class="form-control">
          <option>Seleccione </option>
          <option v-for="d in departamentos" :value="d.idDepartamento">{{d.nombre}}</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleTextarea">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Municipio</font>
          </font>
        </label>
        <select name="city" id="municipio" class="form-control">
          <option>Seleccione </option>
          <option v-for="d in municipios" :value="d.id">{{d.nombre}}</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword1">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Denominación</font>
          </font>
        </label>
        <select class="form-control" id="denominacion" disabled="true">
          <option v-for="d in denominaciones" :value="d.idDeno">{{d.Nombre}}</option>
        </select>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword1">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Iglesia</font>
          </font>
        </label>
        <select class="form-control" id="iglesias">
          <option value="0"> Seleccione </option>
          <option v-for="d in iglesias" :value="d.idIglesia">{{d.Nombre}}</option>
        </select>
      </div>
    </div>

    <div class="tile-footer">
      <button class="btn btn-primary" type="submit" id="buscar">
        <font style="vertical-align: inherit;">
          <font style="vertical-align: inherit;">Buscar</font>
        </font>
      </button>
    </div>
    <br />

  </div>

</div>

    <!-- Essential javascripts for application to work -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="<? echo base_url() ?>js/popper.min.js"></script>
    <script src="<? echo base_url() ?>js/bootstrap.min.js"></script>
    <script src="<? echo base_url() ?>js/main.js"></script>
    <!-- The javascript plugin to display page loading on top -->
    <script src="<? echo base_url() ?>js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts -->
    <script type="text/javascript" src="js/plugins/bootstrap-notify.min.js" ></script>
    <script type="text/javascript" src="<? echo base_url() ?>js/plugins/chart.js" ></script>
    <script type="text/javascript" src="<? echo base_url() ?>js/vue.js" ></script>

    <script type="text/javascript">
       
        var inicio=0;
        var estadoN=true;
        var estadoE=true;

      var v_lugar = new Vue({
        el: "#lugar",
        data: {
          paises: [],
          departamentos: [],
          municipios: [],
          denominaciones: [],
          iglesias: []
        }
      });

      var v_eventosDiv = new Vue({
        el: "#eventosDiv",
        data: {
          eventos: []
        }
      });

      var v_eventosmodalDiv = new Vue({
        el: "#modalEventoDiv",
        data: {
          eventosmodal: []
        }
      });

      var v_noticasDiv = new Vue({
        el: "#noticiasDiv",
        data: {
          noticias: []
          
        },
        computed:{
            itemsNoticias(){
                return this.noticias.map( noticia => {
                    return Object.assign( noticia, { fotos: JSON.parse( noticia.fotos )})
               })
            }
        }

        });

      $.get("<? echo base_url() ?>inicioC/datos/", function(data) {
        var d = $.parseJSON(data);

        v_lugar.paises = d["paises"];
        v_lugar.denominaciones = d["denominaciones"];
      });

      $(function() {
        $("#pais").change(function() {
       
          $.get(
            "<? echo base_url() ?>inicioC/departamentos/" + $("#pais").val(),
            function(data) {
              var d = $.parseJSON(data);
              arr=d;
              v_lugar.departamentos = d;
            }
            );
        });
      });

      $(function() {
        $("#departamento").change(function() {
         
         var codigo=$("#departamento").val();
         
             var d = $.parseJSON( v_lugar.departamentos[codigo-1]['municipio']);
         
            v_lugar.municipios = d;

              $("#denominacion").attr("disabled", false);
          
        });
      });

      $(function() {
        $("#denominacion").change(function() {
         
          $.post(
            "<? echo base_url() ?>inicioC/iglesias/",
            {
              pais: $("#pais").val(),
              departamento: $("#departamento").val(),
              municipio: $("#municipio").val(),
              denominacion: $("#denominacion").val()
            },

            function(data) {
              var d = $.parseJSON(data);
              v_lugar.iglesias = d;
            }
            );
        });
      });

      $(function() {
        $("#buscar").click(function() {
          $.get("<? echo base_url() ?>inicioC/Noticias/" + $("#iglesias").val(),
            inicio,
            function(data) {
              var d = $.parseJSON(data);
              
              if (Object.entries(d).length === 0) {
              
                
                
               if(estadoN==false)
                {
                  $("#noticiasDiv").css("visibility", "hidden");
                
                  $("#noNoticias").css("visibility", "visible");
                  $("#noNoticias").toggle();


                  estadoN=true;
                }
               

              } else {
               
                if(estadoN==true)
                {
               
                  $("#noticiasDiv").css("visibility", "visible");
                  $("#noNoticias").css("visibility", "hidden");
                  $("#noNoticias").toggle();
                  v_noticasDiv.noticias = d;
                  estadoN=false;
                
                }    
                     
              }
            }
            );

          $.get("<? echo base_url() ?>inicioC/fotoNoticias/" + $("#iglesias").val(),
            inicio,
            function(data) {
              var d = $.parseJSON(data);

              v_noticasDiv.fotos = d;

            }
            );

          $.get("<? echo base_url() ?>inicioC/eventos/" + $("#iglesias").val(),
            function(data) {
              var d = $.parseJSON(data);

              if (Object.entries(d).length === 0) {

                if(estadoE==false)
                {
                  $("#eventosDiv").css("visibility", "hidden");
                $("#noEvento").css("visibility", "visible");
                $("#noEvento").toggle();
                estadoE=true;
                }
                
              } else {
                if(estadoE==true)
                {
                $("#eventosDiv").css("visibility", "visible");
                $("#noEvento").css("visibility", "hidden");
                $("#noEvento").toggle();
                v_eventosDiv.eventos = d;
                estadoE=false;
                }
                
              }
            }
            );
        });
      });

      function idboton(bot) {
        let id = bot.id;
        v_eventosDiv.eventos.forEach(function(element) {
        if(id==element.idEvento )
        {
          
          v_eventosmodalDiv.eventosmodal=element;
        }
        
        });
       
      }
    </script>
  </body>
  </html>