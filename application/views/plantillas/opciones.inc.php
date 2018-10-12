<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src=<?= $foto ?> alt="User Image" style="width: 48px; height: 48px ">
        <div>
          <p class="app-sidebar__user-name"><?= $nombre ?></p>
          <p class="app-sidebar__user-designation"><?= $rol ?></p>
        </div>
      </div>
      <ul class="app-menu">
        <!--li><a class="app-menu__item active" href="index.html"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">UI Elements</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="bootstrap-components.php"><i class="icon fa fa-circle-o"></i> Bootstrap Elements</a></li>
            <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li>
            <li><a class="treeview-item" href="ui-cards.php"><i class="icon fa fa-circle-o"></i> Cards</a></li>
            <li><a class="treeview-item" href="widgets.php"><i class="icon fa fa-circle-o"></i> Widgets</a></li>
            <li><a class="treeview-item" href="form-components.php"><i class="icon fa fa-circle-o"></i> Form Components</a></li>
            <li><a class="treeview-item" href="form-custom.php"><i class="icon fa fa-circle-o"></i> Custom Components</a></li>
            <li><a class="treeview-item" href="form-samples.php"><i class="icon fa fa-circle-o"></i> Form Samples</a></li>
            <li><a class="treeview-item" href="form-notifications.php"><i class="icon fa fa-circle-o"></i> Form Notifications</a></li>
            <li><a class="treeview-item" href="table-basic.php"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
            <li><a class="treeview-item" href="table-data-table.php"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
            <li><a class="treeview-item" href="noticias.php"><i class="icon fa fa-circle-o"></i> Agregar noticias</a></li>
            <li><a class="treeview-item" href="page-login.html"><i class="icon fa fa-circle-o"></i> Login Page</a></li>
            <li><a class="treeview-item" href="page-lockscreen.html"><i class="icon fa fa-circle-o"></i> Lockscreen Page</a></li>
            <li><a class="treeview-item" href="page-user.php"><i class="icon fa fa-circle-o"></i> User Page</a></li>
            <li><a class="treeview-item" href="page-invoice.php"><i class="icon fa fa-circle-o"></i> Invoice Page</a></li>
            <li><a class="treeview-item" href="page-calendar.php"><i class="icon fa fa-circle-o"></i> Calendar Page</a></li>
            <li><a class="treeview-item" href="page-mailbox.php"><i class="icon fa fa-circle-o"></i> Mailbox</a></li>
            <li><a class="treeview-item" href="page-error.php"><i class="icon fa fa-circle-o"></i> Error Page</a></li>
          </ul>
        </li-->

        <!--Estadísticas-->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Estadísticas</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/asistencias') ?>"><i class="icon fa fa-check"></i> Asistencias</a></li>
            <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank" rel="noopener"><i class="icon fa fa-bar-chart"></i> Puntaje</a></li>
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/crecimiento') ?>><i class="icon fa fa-area-chart"></i> Crecimiento</a></li>
          </ul>
        </li>

        <!--Calificaciones-->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">Registrar calificaciones</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/calificacionEstudiantes') ?>"><i class="icon fa fa-child"></i> Estudiantes</a></li>
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/calificacionLideres') ?>"><i class="icon fa fa-user"></i> Lideres</a></li>
          </ul>
        </li>

        <!--Miembros-->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Miembros</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/miembrosEstudiantes') ?>"><i class="icon fa fa-child"></i> Estudiantes</a></li>
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/miembrosLideres') ?>"><i class="icon fa fa-user"></i> Lideres</a></li>
          </ul>
        </li>

        <!--Responsabilidades-->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-universal-access"></i><span class="app-menu__label">Responsabilidades</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/responsabilidadVer') ?>"><i class="icon fa fa-eye"></i> Ver</a></li>
            <li><a class="treeview-item" href="<?php echo base_url('opcionesC/responsabilidadGestionar') ?>"><i class="icon fa fa-wrench"></i> Gestionar</a></li>
          </ul>
        </li>

        <!--Cursos-->
        <li><a class="app-menu__item" href="<?php echo base_url('opcionesC/cursos') ?>"><i class="app-menu__icon fa fa-mortar-board"></i><span class="app-menu__label">Cursos</span></a></li>
        <li><a class="app-menu__item" href="<?php echo base_url('opcionesC/noticias') ?>"><i class="app-menu__icon fa fa-newspaper-o"></i><span class="app-menu__label">Noticias</span></a></li>
        <li><a class="app-menu__item" href="<?php echo base_url('opcionesC/eventos') ?>"><i class="app-menu__icon fa fa-calendar"></i><span class="app-menu__label">Eventos</span></a></li>
        <li><a class="app-menu__item" href="<?php echo base_url('opcionesC/puntajes') ?>"><i class="app-menu__icon fa fa-sort-numeric-desc"></i><span class="app-menu__label">Puntajes</span></a></li>

      </ul>
    </aside>