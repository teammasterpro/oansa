<?php
  include_once 'plantillas/inicio.inc.php'
?>

<body class="app sidebar-mini rtl">
  <!-- Navbar-->
  <?php
    include_once 'plantillas/navbar.inc.php'
  ?>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  
  <?php
    include_once 'plantillas/menu.inc.php'
  ?>

  
  <main class="app-content">
    <div class="app-title">
      <div>
        <h1>Agregar noticias</h1>
      </div>
    </div>
    <form action="agregar-noticias.php" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Nombre de la noticia</font>
                </font>
              </label>
              <input class="form-control" type="text" name="titulo" placeholder="Nombre de la noticia" require><small
                class="form-text text-muted" id="titulo">
              </small>
            </div>
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Descripción de la noticia</font>
                </font>
              </label>
              <textarea class="form-control text-justify" name="descripcion" id="descripcion" cols="30" rows="10" placeholder="Describe la noticia"></textarea>
            </div>
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Fotos de la noticia</font>
                </font>
              </label>
              <input class="form-control-file" type="file" name="fotos" accept=".pdf,.jpg,.png" multiple id="img">
            </div>
            <input class="btn btn-primary" id="demoNotify" type="button" value="Agregar">
          </div>
        </div>
      </div>
    </form>

  </main>

  <!-- Essential javascripts for application to work-->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="js/plugins/pace.min.js"></script> 
  <!--Page specific javascripts-->
  <script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>
  <script type="text/javascript" src="js/plugins/sweetalert.min.js"></script>
  <script type="text/javascript">
      $('#demoNotify').click(function(){
      	$.notify({
      		title: "Exito : ",
      		message: "Noticia guardada",
      		icon: 'fa fa-check' 
      	},{
      		type: "info"
      	});
      });
      $('#demoSwal').click(function(){
      	swal({
      		title: "Are you sure?",
      		text: "You will not be able to recover this imaginary file!",
      		type: "warning",
      		showCancelButton: true,
      		confirmButtonText: "Yes, delete it!",
      		cancelButtonText: "No, cancel plx!",
      		closeOnConfirm: false,
      		closeOnCancel: false
      	}, function(isConfirm) {
      		if (isConfirm) {
      			swal("Deleted!", "Your imaginary file has been deleted.", "success");
      		} else {
      			swal("Cancelled", "Your imaginary file is safe :)", "error");
      		}
      	});
      });
    </script>

  <?php
    include_once 'plantillas/fin.inc.php'
  ?>