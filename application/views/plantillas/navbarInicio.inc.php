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
    <a class="app-header__logo" href="<?= base_url() ?>index.php" ><input type="image" src="<?= base_url() ?>img/oansa.png" alt="description" align="Left" /></a>

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
</div>z
</div>
</ul>
</header>

<!-- Sidebar menu -->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>