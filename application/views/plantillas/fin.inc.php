8    <script type="text/javascript">
    function funcion(){

      var nombre = document.getElementById('nombre').innerHTML;
      var rol = document.getElementById('rol').innerHTML;
      var foto = document.getElementById("foto").src;
      alert("Hola mundo " + nombre + "\n" + rol + "\n" + foto);

      $.ajax({
          type: "POST",
          url: "localhost/oansa/opcionesC",
          data: {
            'nombre': nombre,
            'rol': rol,
            'foto': foto
            }
        })
        .done(function( msg ) {
          alert( "Devolución de PHP "+ msg);
        });
    }
    </script>
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