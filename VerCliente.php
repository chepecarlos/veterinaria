   
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 	  	$queEmp = "SELECT * FROM `prop_propietarios`";
			//echo $queEmp;
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error()); 
			echo "<p><h1>Lista de Clientes</h1></p>";		 
	?>
				<center><p>
		<?php
		echo "<table>"; 
		echo "<tr><td>ID</td><td>Nombre 1</td><td>Nombre 2</td><td>Apellido 1</td><td>Apellido 2</td><td>Direcion</td><td>Telefono</td><td>DUI</td><td>NIT</td></tr> \n"; 
			while ($row = mysql_fetch_row($resEmp)){ 
				echo "<tr>";
				echo "<td>$row[0]</td>";
				echo "<td>$row[1]</td>";
				echo "<td>$row[2]</td>";
				echo "<td>$row[3]</td>";
				echo "<td>$row[4]</td>";
				echo "<td>$row[6]</td>";
				echo "<td>$row[7]</td>";
				echo "<td>$row[11]</td>";
				echo "<td>$row[12]</td>";
				echo "</tr>"; 
				} 
			echo "</table>"; 
?> 			
		</p></center>
       
     <?php
		
     ?>  
       
<?php
require("Pie.php");
?>

