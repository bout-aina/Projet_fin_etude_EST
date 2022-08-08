<?php
include ("conex.php");
$search=$_POST['search'];
$output="";
$search=preg_replace("#[^0-9a-z]#i","",$search);
$squery =("SELECT * from users,dossiermedical where users.id=dossiermedical.id and users.cin like '%".$search."%'");
$query=mysql_query($squery);
$count=mysql_num_rows($query);
if($count==0)
{
	echo "<div class='alert alert-danger'>
  ce dossier n'existe pas
</div>";
	include("dossiermedical.php");
	
}else
{
	while($data=mysql_fetch_array($query)){
		echo '
                  <div class="top-droppable folder tooltiper tooltiper-up" data-tooltip="0 file" id="folder1"><a href="#"><i class="fa fa-folder" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true"></i><p>'.$data['cin'].'</p><a></div>
 <div class="top-droppable folder-content easeout2 closed" id="folder1-content">
    <div class="close-folder-content"><i class="fa fa-times" aria-hidden="true"></i></div>
    <h2><i class="fa fa-folder" aria-hidden="true"></i><span>'.$data['cin'].'</span></h2>
  </div>';
	}
}














?>