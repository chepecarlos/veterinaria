
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		 
		 if($_POST["pass1"] == $_POST["pass2"]){
						
			$queEmp = "INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_nombre2`, `emp_apellido1`, `emp_apellido2`, `emp_fotoemp`, `emp_direccion`, `emp_telcasa`, `emp_telcelular`, `emp_email`, `emp_dui`, `emp_nit`, `emp_isss`, `emp_licconducir`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) 
			VALUES (NULL, '".$_POST["PrimerNombre"]."', '".$_POST["SegundoNombre"]."', '".$_POST["PrimerApellido"]."', '".$_POST["SegundoApellido"]."', NULL, '".$_POST["Direcion"]."', '".$_POST["Telefono"]."', '".$_POST["TelefonoCel"]."', '".$_POST["E-mail"]."', '".$_POST["DUI"]."', '".$_POST["NIT"]."', '".$_POST["Isss"]."', '".$_POST["LC"]."','".$_POST["Departamento"]."', '".$_POST["SEXO"]."', '".$_POST["Especializacion"]."', '".$_POST["Cargo"]."')";
			//echo $queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			$queEmp = "SELECT `emp_id` FROM `veterinaria`.`emp_empleados` where `emp_nombre1`='".$_POST["PrimerNombre"]."'";
			//echo "<br>".$queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			$ron = mysql_fetch_row($resEmp);
			//echo $ron[0];
			$queEmp0 = "INSERT INTO `veterinaria`.`usr_usuarios` (`usr_username`, `usr_passwd`, `usr_accesibilidad`, `emp_usr_id`";
			$queEmp1 = ") VALUES ('".$_POST["user"]."', '".$_POST["pass1"]."', '".$_POST["Cargo"]."', '".$ron[0]."');";
			$queEmp = $queEmp0.$queEmp1;
			//echo "<br>".$queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			echo "<p> Creacion de Usuario Satisfactoria </p>";
			 }
		 else
			echo "<p>Las contraseñas no coinciden intented de nuevo </p>";
		 
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddUsuario.php">
	<div align="center">
	<center>
	<p> Añadir un nuevo usuario al sistema</p>
	<p>Usuario: <input type="text" name="user"></p>
	<p>Contraseña: <input type="password" name="pass1"></p>
	<p>Confirmar-Contraseña: <input type="password" name="pass2"></p>
	<p>Primer nombre: <input type="text" name="PrimerNombre"></p>
	<p>Segundo nombre: <input type="text" name="SegundoNombre"></p>
	<p>Primer apellido: <input type="text" name="PrimerApellido"></p>
	<p>Segundo apellido: <input type="text" name="SegundoApellido"></p>
	<p>Sexo: <input type=radio name=SEXO value="1" >masculino <input type=radio name=SEXO value="2">femenino</p>
	<p>Cargo: 
	<select name="Cargo">
		<?php
		$queEmp = "SELECT * FROM `car_cargos`";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Especializacion: 
	<select name="Especializacion">
		<?php
		$queEmp = "SELECT * FROM `esp_especializaciones` ";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	
	<p>Direcion: <input type="text" name="Direcion"></p>
	
	<p>Departamento: 
	<select name="Departamento">
		<?php
		$queEmp = "SELECT * FROM `dep_departamento` ";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	
	<p>Municipio: 
	<select name="Municipio">
		<?php
		$queEmp = "SELECT * FROM `mun_municipio` ";
		$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
		while ($row = mysql_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Telefono: <input type="text" name="Telefono"></p>
	<p>Telefono celular: <input type="text" name="TelefonoCel"></p>
	<p>E-mail: <input type="text" name="E-mail"></p>
	<p>DUI: <input type="text" name="DUI"></p>	
	<p>NIT: <input type="text" name="NIT"></p>
	<p>ISSS: <input type="text" name="Isss"></p>	
	<p>Licencia de conducir: <input type=radio name="LC" value="1" >No <input type=radio name="LC" value="2">Si</p>
	<p><input type="submit" value="Ingresar"></p>
	</center>
	</div>
	</form>
	</p>
	
	</center>
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>
