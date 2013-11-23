<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		  	$queEmp = "INSERT INTO `veterinaria`.`prop_propietarios` (`prop_id`, `prop_nombre1`, `prop_nombre2`, `prop_apellido1`, `prop_apellido2`, `prop_fnacimiento`, `prop_direccion`, `prop_telcasa`, `prop_telcel`, `prop_teltrabajo`, `prop_email`, `prop_dui`, `prop_nit`, `prop_regfiscal`, `gen_genero_gen_id`) 
		  	VALUES (null, '".$_POST["Nombre1"]."', '".$_POST["Nombre2"]."', '".$_POST["Apellido1"]."', '".$_POST["Apellido2"]."','".$_POST["Fecha"]."', '".$_POST["Direcion"]."', '".$_POST["TelefonoCasa"]."', NULL, NULL, NULL, '".$_POST["DUI"]."', '".$_POST["NIT"]."', NULL, '1');";
			//echo $queEmp."<br>";
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			echo "<p> Creacion de Cliente Satisfecha </p>";
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddCliente.php">
	<div align="center">
	<p>Primer Nombre: <input type="text" name="Nombre1"></p>
	<p>Segundo Nombre : <input type="text" name="Nombre2"></p>
	<p>Primer Apellido: <input type="text" name="Apellido1"></p>
	<p>Segundo Apellido: <input type="text" name="Apellido2"></p>
	<p>Fecha de nacimiento (formato año-mes-dia)<input type="text" name="Fecha"></p>
	<p>Direcion: <input type="text" name="Direcion"></p>
	<p>Telefono Casa: <input type="text" name="TelefonoCasa"></p>
	<p>DUI: <input type="text" name="DUI"></p>
	<p>NIT: <input type="text" name="NIT"></p>
	</div>
	<p><input type="submit" value="Ingresar"></p>
	</form>
				</p></center>
       
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>

