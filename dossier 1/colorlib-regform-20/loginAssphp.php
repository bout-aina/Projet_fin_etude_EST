<?php
include ("conex.php");
if(isset($_POST['em'])){
	
//Récuperer email depuis variable $_POST
$mail = $_POST["mail"];if(!empty($mail)){
//Verification existance de l'email sur la base de données
$sql =("SELECT emailAss from cnxassistants WHERE emailAss ='".$mail."' limit 1");
 $query=mysql_query($sql);

//Si le mail existe
if(mysql_num_rows($query)==1){

$header="MIME-Version: 1.0\r\n";
$header.='From:"PrimFX.com"<support@primfx.com>'."\n";
$header.='Content-Type:text/html; charset="uft-8"'."\n";
$header.='Content-Transfer-Encoding: 8bit';

$message='
<html>
	<body>
		<div align="center">
			<br />cliquer ici pour modifier votre mot de passe
			<a href=http://localhost/colorlib-regform-20/mdpAss.php>mon nouveau mot de passe</a>
			
			<br />
		</div>
	</body>
</html>
';

mail($mail, "Salut tout le monde !", $message, $header);
echo "<div style='color:green;' class='alert alert-danger'>
  un email a ete envoye
</div>";
}else{ //Sinon
 echo "<div class='alert alert-danger'>
  ce utilisateur n'existe pas
</div>";

}}
else{
	echo "<div class='alert alert-danger'>
  entrez svp votre email
</div>";
	
}


 }
 include("loginAss.php");
 
?>

