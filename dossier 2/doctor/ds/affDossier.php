<?php
include ("connexion.php");

echo'<div class="left">';	$x=0;
$req='SELECT * from users,dossiermedicale where users.id=dossiermedicale.idpatient';
  $sth = $dbh->query($req);
  
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); 

// and somewhere later:

foreach ($res as $row) {
  $x++;
  echo '
 
  <div class="top-droppable folder tooltiper tooltiper-up" data-tooltip="0 file" id="folder'.$x.'">
  <a href="#"><i class="fa fa-folder" aria-hidden="true"></i><i class="fa fa-check" aria-hidden="true">
  </i>
  <p>'.$row['cin'].'</p><a></div>
<div class="top-droppable folder-content easeout2 closed" id="folder1-content">
<div class="close-folder-content"><i class="fa fa-times" aria-hidden="true"></i></div>
<h2><i class="fa fa-folder" aria-hidden="true"></i><span>'.$row['cin'].'</span></h2>
</div>
';

 
}
if($x==4){$x=0;
   }
  echo '</div>';
	







?>