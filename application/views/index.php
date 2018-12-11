 <!-- Modal evento -->
 <div id="modalEventoDiv">
      <div class="modal fade bd-example-modal-lg" id="modalEvento" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
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
        <p class="card-text text-justify">No hay eventos en esta iglesia</p>
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
              <div class="card-header">Informacion</div>
              <div class="card-body">
                <p class="card-text text-justify">No hay noticias para mostrar </p>
              </div>
              
                            
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
    <script src="<? echo base_url() ?>js/jquery-3.2.1.min.js"></script>
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