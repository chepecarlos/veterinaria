<?php
session_start(); 
if( empty($_SESSION["Usuario"])) 
{
 session_destroy();
 header("Location: index.html");	
}
?>
<!DOCTYPE HTML>
<html>

<head>
  <title>photo_style_two</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js">
  </script>
</head>

<body>
  <div id="main">
    <header>
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="index.html">Burgos<span class="logo_colour">_Veterinaria</span></a></h1>
          <h2>Salud, Cuidado y Felicidad .</h2>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
		      <li><a href="#">Usuario</a>
                <ul>
                  <li><a href="AddUsuario.php">Añadir</a></li>
                  <li><a href="EditUsuario.php">Editar</a></li>
                </ul>
              </li>	
              <li><a href="#">Cliente</a>
                <ul>
                  <li><a href="AddCliente.php">Añadir</a></li>
                  <li><a href="VerCliente.php">Ver</a></li>
                </ul>
              </li>	
              <li><a href="#">Mascotas</a>
                <ul>
                  <li><a href="AddMascota.php">Añadir</a></li>
                  <li><a href="EditMascota.php">Editar</a></li>
                </ul>
              </li>	
          <li>
			  <?php
			  if (! empty($_SESSION["Activo"])) 
					{
						?>
					<a href="CerraSesion.php" title="Cerrar sesión">Salir</a></li>
					<? echo "<li><H2>".$_SESSION["Usuario"]."</H1></li>";
					}
			  ?>
        </ul>
      </nav>
    </header>
            <center>
