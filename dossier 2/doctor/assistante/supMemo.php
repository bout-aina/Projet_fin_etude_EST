<?php
include ("conex.php");
if(isset($_GET["idMemo"]))
{$requete="DELETE FROM memo WHERE idMemo='".$_GET['idMemo']."'";
$resultat=mysql_query($requete);
include_once ("memoAss.php");
}



?>