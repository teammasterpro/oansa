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
      <div class="page-error tile">
        <h1><i class="fa fa-exclamation-circle"></i> Error 404: Page not found</h1>
        <p>The page you have requested is not found.</p>
        <p><a class="btn btn-primary" href="javascript:window.history.back();">Go Back</a></p>
      </div>
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