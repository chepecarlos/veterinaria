<?php
session_start();  
require("SQL.php");



$queEmp = "SELECT *
FROM `usr_usuarios`
WHERE `usr_username` LIKE '".$_POST['user']."'
AND `usr_passwd` LIKE '".$_POST['pass']."'";

//echo $queEmp;
$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
$totEmp = mysql_num_rows($resEmp);

//echo "<br>";
//echo $totEmp;

if($totEmp> 0){
	$_SESSION["Activo"] = 1;
	$_SESSION["Usuario"] = $_POST['user'];
	header("Location: Registro.php");
}
else{
	header("Location: index.html");
}
mysql_close($conexion);
?>
