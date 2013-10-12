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
                  <li><a href="#">Eliminar</a></li>
                </ul>
              </li>	
          <li><a href="#">About Me</a></li>
          <li><a href="#">My Portfolio</a></li>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Example Drop Down</a>
            <ul>
              <li><a href="#">Drop Down One</a></li>
              <li><a href="#">Drop Down Two</a>
                <ul>
                  <li><a href="#">Sub Drop Down One</a></li>
                  <li><a href="#">Sub Drop Down Two</a></li>
                  <li><a href="#">Sub Drop Down Three</a></li>
                  <li><a href="#">Sub Drop Down Four</a></li>
                  <li><a href="#">Sub Drop Down Five</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down Three</a></li>
              <li><a href="#">Drop Down Four</a></li>
              <li><a href="#">Drop Down Five</a></li>
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
