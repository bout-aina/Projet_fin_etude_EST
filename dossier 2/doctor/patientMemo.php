<html>

</html>

<?php
include ("connexion.php");
$req='SELECT * FROM messages';
	$sth = $dbh->query($req);
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); 
	 echo'<div class="container bootstrap snippet">
    <div class="row">
    	<ul class="notes">';
		$x=0;
		$y=0;
	foreach ($res as $data){$x++;$y++;
$id=$data['id'];
	echo '
            <li>
                <div class="rotate-'.$x.' bg'.$y.'">
                    <small>'.$data['created_at'].'</small>
                    <h4></h4>
					<p>'.$data['message'].'</p>
					<form action="#" method="POST" >
    <button  type="submit" name="delete'.$id.'" value="delete'.$id.'" ><i    class="fa fa-trash-o "></i></button></form>
               
                </div>
            </li>   
		';
		if($x==2){$x=0;}
		if($y==4){$y=0;}
		if (isset($_POST["delete$id"])){
			
			
			/* $req="delete from contact where id='$id'";
			$sth = $dbh->query($req);
			$res = $sth->fetchAll(PDO::FETCH_ASSOC); */
			
			$count=$dbh->prepare("delete from messages where id='$id'");
			
			$count->execute();
			echo(" 
			<SCRIPT Language='JavaScript'>
			var txt;
			var r = confirm('suupression avec succes!');
			if (r == true) {
			  
			  javascript:location.reload(true);
			} else {
				javascript:location.reload(true);
			}
			
	  </SCRIPT>") ;
			
			}
		
		
}
echo'</ul>  
	</div>
</div>';





?>
