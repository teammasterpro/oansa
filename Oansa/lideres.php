<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Lideres - Oansa</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">Vali</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!--Notification Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 4 new notifications.</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Lisa sent you a mail</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Mail server not working</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <div class="app-notification__content">
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Lisa sent you a mail</p>
                      <p class="app-notification__meta">2 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Mail server not working</p>
                      <p class="app-notification__meta">5 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Transaction complete</p>
                      <p class="app-notification__meta">2 days ago</p>
                    </div></a></li>
              </div>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>

        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    
    <?php
    include_once 'plantillas/Menu.inc.php'
    ?>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-user"></i> Lideres</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Blank Page</a></li>
        </ul>
      </div>


        <div class="tile mb-4">
              <div class="page-header">
                <div class="row">
                  <div class="col-lg-12">
                  <!--div class="autocomplete" style="width:300px;">
                    <input id="myInput" type="text" name="myCountry" placeholder="Country">
                  </div>
                  <input type="submit"-->
                    <h2 class="mb-3 line-head" id="buttons">Autocompletar</h2>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-6">
                  <form>
                      <fieldset>
                          <legend class="form-group">Datos personales</legend>
                    <div class="form-group">
                      <label for="exampleInputEmail1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Nombre de la iglesia</font></font></label>
                      <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Nombre de la iglesia"><small class="form-text text-muted" id="emailHelp"><font style="vertical-align: inherit;"></font></small>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Denominación</font></font></label>
                      <select class="form-control"><option value="op1">Alianza</option> </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleSelect1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">País</font></font></label>
                      <select class="form-control" id="exampleSelect1">
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Colombia</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Peru</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Bolivia</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Argentina</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Venezuela</font></font></option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleSelect2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Departamento</font></font></label>
                      <select class="form-control" id="exampleSelect1">
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cesar</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Guajira</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Magdalena</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Bolivar</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Antioquia</font></font></option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleTextarea"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Municipio</font></font></label>
                        <select class="form-control" id="exampleSelect1">
                          <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Aguachica</font></font></option>
                          <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Valledupar</font></font></option>
                          <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Codazzi</font></font></option>
                        </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputFile"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Dirección</font></font></label>
                      <input class="form-control" id="exampleInputFile" type="" aria-describedby="fileHelp"><small class="form-text text-muted" id="fileHelp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></small>
                    </div>
                    </fieldset>
                  </form>
                </div>
                <div class="col-lg-6">
                    <form>
                        <legend class="form-group">Datos del usuario</legend>
                      <div class="form-group">
                          <label class="control-label" for="disabledInput"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Usuario</font></font></label>
                          <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Usuario"><small class="form-text text-muted" id="emailHelp"><font style="vertical-align: inherit;"></font></small>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Contraseña</font></font></label>
                            <input class="form-control" id="readOnlyInput" type="password" placeholder="Contraseña">
                        </div>                        
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Confirme la contraseña</font></font></label>
                            <input class="form-control" id="readOnlyInput" type="password" placeholder="Confirme la contraseña">
                          </div>
                        </div>
                      </div>                      
                      
                      <br>
                      <legend class="form-group">Información de la tarjeta</legend>
                      <div class="form-group">
                        <label class="control-label" for="disabledInput"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Número de la tarjeta</font></font></label>
                        <input class="form-control"  type="tel" aria-describedby="emailHelp" placeholder="Número de la tarjeta"><small class="form-text text-muted" id="emailHelp"><font style="vertical-align: inherit;"></font></small>
                      </div>
                      <div class="form-group">
                        <label class="control-label" for="disabledInput"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Nombre y apellidos del titular</font></font></label>
                        <input class="form-control"  type="text" placeholder="Nombre y apellidos"><small class="form-text text-muted" id="emailHelp"><font style="vertical-align: inherit;"></font></small>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Fecha de vencimiento</font></font></label>
                            <input class="form-control" type="password" placeholder="Fecha de vencimiento">
                        </div>                        
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label class="control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Codigo de seguridad</font></font></label>
                            <input class="form-control" type="password" placeholder="Codigo de seguridad">
                          </div>
                        </div>
                      </div> 
                    </form>
                  </div>
              </div>
              <div class="tile-footer">
                <button class="btn btn-primary" type="submit"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Registrar</font></font></button>
              </div>
            </div>
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
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>