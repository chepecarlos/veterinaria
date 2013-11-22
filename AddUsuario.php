 
<?php
require("Cabeza.php");
?>
	
	<?php
	 if($_POST){
		 require("SQL.php");
		 if($_POST["pass1"] == $_POST["pass2"]){
			 $queEmp = "SELECT * FROM `usr_usuarios`";
			//echo $queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
			$totEmp = mysql_num_rows($resEmp);
			//echo $totEmp;
			$queEmp = "INSERT INTO `veterinaria`.`usr_usuarios` (`usr_id`, `usr_username`, `usr_passwd`, `usr_accesibilidad`, `emp_usr_id`) VALUES ('".$totEmp."', '".$_POST["user"]."', '".$_POST["pass1"]."', '1', '1');";
			//echo $queEmp;
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
	
	<p>Nombre: <input type="text" name="user"></p>
	<p>Contraseña<input type="password" name="pass1"></p>
	<p>Confirmar-Contraseña<input type="password" name="pass2"></p>
	<p><input type="submit" value="Ingresar"></p>
	</form>
				</p></center>
       
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>
