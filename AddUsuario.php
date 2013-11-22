
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		 
		 if($_POST["pass1"] == $_POST["pass2"]){
			//$queEmp = "SELECT * FROM `usr_usuarios`";
			//echo $queEmp;
			//$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
			//$totEmp = mysql_num_rows($resEmp);
			//echo $totEmp;
			//$queEmp0 = "INSERT INTO `veterinaria`.`usr_usuarios` (`usr_username`, `usr_passwd`, `usr_accesibilidad`, `emp_usr_id`";
			//$queEmp1 =) "VALUES ('".$_POST["user"]."', '".$_POST["pass1"]."', '1', '1');";
			//echo $queEmp;
			
			$queEmp0 = "INSERT INTO `veterinaria`.`emp_empleados` ('emp_nombre1'";
			$queEmp1 = ") VALUES ('".$_POST["PrimerNombre"]."'";
			if($_POST["SegundoNombre"] != ""){
			$queEmp0 = $queEmp0.",'emp_nombre2'";
			$queEmp1 = $queEmp1.",'".$_POST["SegundoNombre"]."'";
			}
			$queEmp1 = $queEmp1.")";
			$queEmp = $queEmp0.$queEmp1;
			echo $queEmp;
			//$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
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
	<p>Telefono celular:  <input type="text" name="TelefonoCel"></p>
	<p>E-mail:  <input type="text" name="E-mail"></p>
	<p>DUI:  <input type="text" name="DUI"></p>	
	<p>NIT:  <input type="text" name="NIT"></p>
	<p>ISSS:  <input type="text" name="DUI"></p>	
	<p>Licencia de conducir: <input type=radio name="LC" value="1" >No <input type=radio name="LC" value="2">no</p>
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
