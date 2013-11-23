    
<?php
require("Cabeza.php");
require("SQL.php");
?>
<?php
	 if($_POST){
		echo "hola"; 
	 }
	 else{
	 ?>
     <center><p>
	 <form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddCita.php"> 
	 
	 <p><input type="submit" value="Ingresar"></p>
	 </form>
	 <p></center>
<?php
	}
?>
           
<?php
require("Pie.php");
?>

