  <?php
    //include_once 'plantillas/inicio.inc.php' 
  ?>

  <!-- Navbar-->
  <?php
    //include_once 'plantillas/navbar.inc.php' 
  ?>
  
  <?php
    //include_once 'plantillas/menu.inc.php'
  ?>

  <!--Menu-->
  <main class="app-content">
    <div class="app-title">
      <div>
        <h1>Noticias</h1>
      </div>
    </div>
    <form action="app/noticia.class.php" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">Noticia</th>
                  <th scope="col">Fecha</th>
                  <th scope="col">Opciones</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Día del color</td>
                  <td>13/09/2018 11:14 am</td>
                  <td>
                    <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button>
                    <button type="button" class="btn btn-warning"><i class="icon fa fa-pencil"></i></button>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                      <i class="icon fa fa-remove"></i>
                    </button>
                  </td>
                </tr>
                <tr>
                  <td>Personajes bíblicos</td>
                  <td>13/09/2018 11:14 am</td>
                  <td>
                    <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button>
                    <button type="button" class="btn btn-warning"><i class="icon fa fa-pencil"></i></button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                      <i class="icon fa fa-remove"></i>
                    </button>
                  </td>
                </tr>
                <tr>
                  <td>Venta de tamales</td>
                  <td>13/09/2018 11:14 am</td>
                  <td>
                    <button type="button" class="btn btn-primary"><i class="fa fa-eye"></i></button>
                    <button type="button" class="btn btn-warning"><i class="icon fa fa-pencil"></i></button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                      <i class="icon fa fa-remove"></i>
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>

            <h2 class="mb-3 line-head" id="buttons"></h2>
            <button onclick="location.href='agregar-noticias.php'" type="button" class="btn btn-success"><i class="icon fa fa-plus"></i> Nueva</button>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Desea borrar esta noticia</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    Día del color
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-danger">Borrar</button>
                  </div>
                </div>
              </div>
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