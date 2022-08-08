<?php
include ("connexion.php");

echo'<div class="left">';	$x=0;
$req='SELECT * from users,dossiermedicales where users.id=dossiermedicale.idpatient';
  $sth = $dbh->query($req);
  
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); 

// and somewhere later:

foreach ($res as $row) {
  $x++;
  echo '
      <div class="top-droppable folder tooltiper tooltiper-up" data-tooltip="0 file" id="folder'.$x.'">
      <a href="#"><i class="fa fa-folder" aria-hidden="true">
      </i><i class="fa fa-check" aria-hidden="true"></i>';
      ?>
     
      <a href="infopatient.php?id=<?= $row['id'];?>"> <?=$row['cin'];?></a>
   
      <i class="fa fa-check" aria-hidden="true"></i><p></p>
      </a></div>
      
<?php
 
}
if($x==4){$x=0;
   }
  echo '</div>';
	







?>