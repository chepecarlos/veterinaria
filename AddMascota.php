   
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		  	$queEmp = "INSERT INTO `veterinaria`.`prop_propietarios` (`prop_id`, `prop_nombre1`, `prop_nombre2`, `prop_apellido1`, `prop_apellido2`, `prop_fnacimiento`, `prop_direccion`, `prop_telcasa`, `prop_telcel`, `prop_teltrabajo`, `prop_email`, `prop_dui`, `prop_nit`, `prop_regfiscal`, `gen_genero_gen_id`) VALUES ('".$_POST["ID"]."', '".$_POST["Nombre1"]."', '".$_POST["Nombre2"]."', '".$_POST["Apellido1"]."', '".$_POST["Apellido2"]."', NULL, '".$_POST["Direcion"]."', '".$_POST["TelefonoCasa"]."', NULL, NULL, NULL, '".$_POST["DUI"]."', '".$_POST["NIT"]."', NULL, '1');";
			//echo $queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			echo "<p> Creacion de Cliente Satisfecha </p>";
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddCliente.php">
	
	<p>Primer nombre: <input type="text" name="Nombre1"></p>
	<p>Segundo nombre: <input type="text" name="Nombre2"></p>
	<p>Primer Apelliso: <input type="text" name="Apellido1"></p>
	<p>Segundo Apellido: <input type="text" name="Apellido2"></p>
	<p>Nacimiento(Año-Mes-Dia): <input type="text" name="Nacimiento"></p>
	<p>Descripcion: <input type="text" name="Descripcion"></p>
	<p>Especie: 
	<select name="Especie">
		<?php
		$queEmp = "SELECT * FROM `mas_mascotas`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Familia:
	<select name="Familia">
		<?php
		$queEmp = "SELECT * FROM `fam_familia`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Genero: 
	<select name="Genero">
		<?php
		$queEmp = "SELECT * FROM `gen_genero`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	
	<p>Estado: 
	<select name="Estado">
		<?php
		$queEmp = "SELECT * FROM `esm_estado_mascotas`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>EStado salida?:
	<select name="EstadoSalida">
		<?php
		$queEmp = "SELECT * FROM `tps_tipo_salida`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Fecha de ingreso(Año-Mes-Dia): <input type="text" name="FechaIngeso"></p>
	
	<p><input type="submit" value="Ingresar"></p>
	</form>
				</p></center>
       
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>


