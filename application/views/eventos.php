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

  <!--Menu-->
  <main class="app-content">
    <div class="app-title">
      <div>
        <h1>Agregar noticias</h1>
      </div>
    </div>
    <form action="app/noticia.class.php" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Nombre de la noticia</font>
                </font>
              </label>
              <input class="form-control" type="text" aria-describedby="emailHelp" placeholder="Nombre de la noticia"><small
                class="form-text text-muted" id="emailHelp">
                <font style="vertical-align: inherit;"></font>
              </small>
            </div>
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Descripción de la noticia</font>
                </font>
              </label>
              <textarea class="form-control text-justify" name="" id="" cols="30" rows="10" placeholder="Describe la noticia"></textarea>
            </div>
            <div class="form-group">
              <label>
                <font style="vertical-align: inherit;">
                  <font style="vertical-align: inherit;">Foto principal de la noticia</font>
                </font>
              </label>
              <input class="form-control-file" type="file" name="" id="img">
            </div>
            <input class="btn btn-primary" type="submit" value="Agregar">
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
  <!-- Page specific javascripts-->
  
  <?php
    include_once 'plantillas/fin.inc.php' 
  ?>