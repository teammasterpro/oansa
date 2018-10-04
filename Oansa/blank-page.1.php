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
          <h1><i class="fa fa-dashboard"></i> Agregar noticias</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Blank Page</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">Create a beautiful dashboard</div>
          </div>
        </div>
      </div>
    </main>

  <?php
    include_once 'plantillas/fin.inc.php'
  ?>