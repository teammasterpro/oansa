<!DOCTYPE html>
<html lang="es">

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
  <title>Oansa</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="<?= base_url() ?>css/main.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="app sidebar-mini rtl" style="overflow-x:hidden;">
  <!-- Navbar-->
  <header class="app-header"><a class="app-header__logo" href="index"><input type=image src="<?= base_url() ?>img/oansa.png"
        alt="description" align="Right"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
      <li id="list_desplegable"><a class="app-nav__item" href="#"><i class="fa fa-edit"></i>Acerca de</a>
        <ul>
          <li><a href="#" data-toggle="modal" data-target="#modalOansa">¿Qué es Oansa?</a></li>
          <li><a href="#" data-toggle="modal" data-target="#modalHimno">Himno de Oansa</a></li>
          <li><a href="#" data-toggle="modal" data-target="#modalPromesa">Promesa o Lema</a> </li>
          <li><a href="#" data-toggle="modal" data-target="#modalVersiculo">Versiculo</a> </li>
        </ul>
      </li>

      <li><a class="app-nav__item" href="#" data-toggle="modal" data-target="#modalEstudiante"><i class="fa fa-book"></i>
          Estudiante</a></li>
      <li><a class="app-nav__item" href="#"><i class="fa fa-money"></i> Donación</a></li>
      <li><a class="app-nav__item" href="<?= base_url() ?>reg-iglesia.html"><i class="fa fa-edit"></i> Registrar
          iglesia</a></li>
      <li><a class="app-nav__item" href="#" data-toggle="modal" data-target="#modalLogin"><i class="fa fa-user"></i>
          IniciarSesión</a></li>

      <!-- Modal Login-->
      <form class="login-form" action="<?= base_url() ?>opcionesC" method="POST">
        <div class="modal fade" id="modalLogin" tabindex="10" role="dialog" aria-labelledby="modalLoginCenterTitle"
          aria-hidden="true">
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

      <!--Modal estudiante-->
      <div class="modal fade" id="modalEstudiante" tabindex="10" role="dialog" aria-labelledby="modalEstudianteCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa fa-user"></i> Datos del estudiante</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label class="control-label">Documento del acudiente</label>
                <input class="form-control" type="password" placeholder="Acudiente" autofocus>
              </div>
              <div class="form-group">
                <label class="control-label">Documento del estudiante</label>
                <input class="form-control" type="password" placeholder="Estudiante">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
              <button class="btn btn-primary"><i class="fa fa-sign-in fa-lg fa-fw"></i>Entrar</button>
            </div>
          </div>
        </div>
      </div>

      <!--Modal oansa-->
      <div class="modal fade" id="modalOansa" tabindex="10" role="dialog" aria-labelledby="modalOansaCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <img src="<?= base_url() ?>img/oansa.png" alt="Oansa" style="position: initial">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p class="text-justify">
                Es un ministerio bibliocéntrico, no denominacional, dirigido a las Iglesias Evangélicas, que provee
                programas para niños,
                niñas, adolescentes y jóvenes. Por ser un ministerio para la Iglesia, es administrado por ella (la
                Iglesia
                local),
                siendo uno de los objetivos, el desarrollo de sus miembros. El enfoque en la juventud da un resultado
                fructífero
                en la expansión de la iglesia local. No solamente se atraen niños y jóvenes para guiarlos a Cristo,
                sino
                también
                a sus familias. <br /> <br /> Bendición #1. Ayuda a mantener el objeto principal de la iglesia.<br />
                Bendición
                #2. Provee un ambiente para el crecimiento de nuevos líderes de la iglesia.<br /> Bendición #3. Asiste
                a la
                iglesia
                en cultivar padres con mente espiritual.<br /> Bendición #4. Fundamenta a la próxima generación de la
                Iglesia
                a la Palabra de Dios.<br /> Bendición #5. Edifica un sentido eclesial de comunidad y familia.
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
            </div>
          </div>
        </div>
      </div>

      <!--Modal himno-->
      <div class="modal fade" id="modalHimno" tabindex="10" role="dialog" aria-labelledby="modalHimnoCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle">Himno de oansa</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>
                FIRME OANSA VA,<br /> CON LO QUE CRISTO DA.<br /> APROVADOS OBREROS SER<br /> Y CUMPLIR CON SU GRAN
                DEBER.<br /><br />

                <strong>CORO</strong><br /> OANSA JOVENES MARCHAD<br /> OANSA FUERTES EN VERDAD<br /> FIRME EN DIOS Y
                LA
                BIBLIA
                FIEL
                <br /> OANSA VA...<br /><br /> SEGUIR AL SALVADOR<br /> MARCHANDO SIN TEMOR<br /> EN SU PERFECTO AMOR<br /><br />
                LOOR
                CANTAR SU<br /> CAUSA DEFENDER<br /> SU OBRA EXTENDER<br /> LUCHAR CON GRAN PODER<br /> POR CRISTO EL
                REY..
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
            </div>
          </div>
        </div>
      </div>

      <!--Modal promesa-->
      <div class="modal fade" id="modalPromesa" tabindex="10" role="dialog" aria-labelledby="modalPromesaCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle">Promesa</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>
                YO ME COMPROMETO<br /> CON EL PROPOSITO<br /> DE LOS CLUBES OANSA.<br /> DE ALCANZAR A LA NIÑEZ<br /> Y
                LA
                JUVENTUD
                Y ENTRENARLES<br /> PARA QUE LE SIRVAN.
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
            </div>
          </div>
        </div>
      </div>

      <!--Modal versiculo-->
      <div class="modal fade" id="modalVersiculo" tabindex="10" role="dialog" aria-labelledby="modalVersiculoCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle">Texto lema</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>"Procura con diligencia presentarte a Dios, aprobado como obrero que no tiene de qué avergonzarse, que
                usa
                bien
                la Palabra de Verdad".<br /> 2 Timoteo 2:15
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-close"></i>Cerrar</button>
            </div>
          </div>
        </div>
      </div>

    </ul>
  </header>

  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>


  <div class="row">
    <!-- Menú de eventos-->
    <div class="col-md-3">
      <div class="col-md-3 position-fixed" style="width: auto; height: 100%; overflow-y: scroll;">
        <br><br><br>
        <h4 class="border-bottom border-gray pb-2 mb-0">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Eventos</font>
          </font>
        </h4>
        <div class="media text-muted pt-3"></div>
        <div class="card">
          <div class="card-header">
            Featured
          </div>
          <div class="card-body">
            <h5 class="card-title">Special title treatment</h5>
            <p class="card-text text-justify">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
        <br>
        <div class="card">
          <div class="card-header">
            Featured
          </div>
          <div class="card-body">
            <h5 class="card-title">Special title treatment</h5>
            <p class="card-text text-justify">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
        <br>
        <div class="card">
          <div class="card-header">
            Featured
          </div>
          <div class="card-body">
            <h5 class="card-title">Special title treatment</h5>
            <p class="card-text text-justify">With supporting text below as a natural lead-in to additional content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
        <br>
      </div>
    </div>

    <!-- Menú de noticias-->
    <div class="col-md-6">
      <br><br> <br>
      <main>
        <h4 class="border-bottom border-gray pb-2 mb-0">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Noticias recientes</font>
          </font>
        </h4>
        <div class="media text-muted pt-3"></div>
        <div class="card" style="width: auto;">
          <!--Fotos en movimiento-->
          <!--Agregar un foreach-->
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="<?= base_url() ?>img/dia-del-color.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Koala.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Penguins.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Personajes-biblicos.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <!--img class="card-img-top pixel" src="img/dia-del-color.jpg" alt="Card image cap"-->
          <div class="card-body">
            <h5 class="card-title">Día del color</h5>
            <a class="card-link">13/09/2018 11:14 am</a>
            <p class="card-text text-justify">Se consideró apropiado crear un Día Internacional del Color ya que el
              color es, en
              virtud
              de la percepción visual, uno de los fenómenos más influyentes en la vida de las personas y también uno de
              los
              canales que contribuye en mayor proporción a nuestro conocimiento del mundo externo. En este día se
              desarrollan
              actividades memorables acerca del color en distintas partes del mundo.</p>
            <a href="#" class="btn btn-primary">Ver más</a>
          </div>
        </div>
        <br>

        <div class="card" style="width: auto;">
          <!--Fotos en movimiento-->
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="<?= base_url() ?>img/dia-del-color.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Koala.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Penguins.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Personajes-biblicos.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text text-justify">Some quick example text to build on the card title and make up the bulk
              of the card's
              content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
        <br>

        <div class="card" style="width: auto;">
          <!--Fotos en movimiento-->
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="<?= base_url() ?>img/dia-del-color.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Koala.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Penguins.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Personajes-biblicos.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text text-justify">Some quick example text to build on the card title and make up the bulk
              of the card's
              content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
        <br>

        <div class="card" style="width: auto;">
          <!--Fotos en movimiento-->
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="<?= base_url() ?>img/dia-del-color.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Koala.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Penguins.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="<?= base_url() ?>img/Personajes-biblicos.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text text-justify">Some quick example text to build on the card title and make up the bulk
              of the card's
              content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
        </div>
      </main>
    </div>

    <!-- Menú de busqueda-->
    <div class="col-md-3">
      <div class="position-fixed" style="width: 22%; height: 100%;">
        <br><br><br>
        <h4 class="border-bottom border-gray pb-2 mb-0">
          <font style="vertical-align: inherit;">
            <font style="vertical-align: inherit;">Búsqueda</font>
          </font>
        </h4>
        <div class="media text-muted pt-3"></div>


        <div class="form-group">
          <label for="exampleSelect1">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">País</font>
            </font>
          </label>
          <select class="form-control" id="pais" onchange="departamento()">
            <?php
              foreach ($consulta->result() as $fila) {
            ?>
                <option value=<?= $fila->idPais ?>>
                    <?= $fila->Nombre ?>
                </option>
            <?php
              }
            ?>    
          </select>
        </div>

        <div class="form-group">
          <label for="exampleSelect2">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">Departamento</font>
            </font>
          </label>
          <select class="form-control" id="exampleSelect1">
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Cesar</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Guajira</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Magdalena</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Bolivar</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Antioquia</font>
              </font>
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="exampleTextarea">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">Municipio</font>
            </font>
          </label>
          <select class="form-control" id="exampleSelect1">
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Aguachica</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Valledupar</font>
              </font>
            </option>
            <option>
              <font style="vertical-align: inherit;">
                <font style="vertical-align: inherit;">Codazzi</font>
              </font>
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="exampleInputPassword1">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">Denominación</font>
            </font>
          </label>
          <select class="form-control">
            <option value="op1">Alianza</option>
          </select>
        </div>

        <div class="form-group">
          <label for="exampleInputPassword1">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">Iglesia</font>
            </font>
          </label>
          <select class="form-control">
            <option value="op1">Emmanuel</option>
          </select>
        </div>

        <div class="tile-footer">
          <button class="btn btn-primary" type="submit">
            <font style="vertical-align: inherit;">
              <font style="vertical-align: inherit;">Buscar</font>
            </font>
          </button>
        </div>
        <br>

        <!--
        <div class="list-group">
          <a class="list-group-item list-group-item-action active">
            Últimas busquedas
          </a>
          <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
          <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
        </div>
        -->
      </div>
    </div>

  </div>

  <!-- Essential javascripts for application to work-->
  <script src="<?= base_url() ?>js/jquery-3.2.1.min.js"></script>
  <script src="<?= base_url() ?>js/popper.min.js"></script>
  <script src="<?= base_url() ?>js/bootstrap.min.js"></script>
  <script src="<?= base_url() ?>js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="<?= base_url() ?>js/plugins/pace.min.js"></script>
  <!-- Page specific javascripts-->
  <script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>
  <?php 
      if(isset($mensaje)){
        ?>
        <? echo "imprime";?>
          <script type="text/javascript">
            $(document).ready(function(){
              $.notify({
                title: <? echo $titulo;?>,
                message: <? echo $mensaje;?>,
                icon: <? echo $icono;?> 
              },{
                type: <? echo $tipo;?>
              });
            });
          </script>
      <? } ?>
  <script type="text/javascript" src="<?= base_url() ?>js/plugins/chart.js"></script>
  <script>
    funtion departamento(){
      var pais = document.getElementById("pais").value;
      document.write(pais);
      <?php 
      $pais = "<script> document.write(pais) </script>";
      echo "latitude = $pais <br>";
      //echo base_url('inicioC/departamento/<script> document.write(pais) </script>') ?>
    }
  </script>

</body>

</html>