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
  
  <!--   Scripts esenciales para las páginas  -->
  <?php 
    include_once 'plantillas/scripts.php'
  ?>

  <!-- Page specific javascripts-->
  
  <?php
    include_once 'plantillas/fin.inc.php' 
  ?>