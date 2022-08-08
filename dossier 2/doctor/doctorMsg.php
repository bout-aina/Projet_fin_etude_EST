
<?php
if (isset($_POST['l'])){

// 			echo("<script> var r=confirm('etes-vous sur de vous deconnecter .');
			 
// if (r == true)</script> ");
 header('location:http://localhost/park%20shine%20soo%20-%20Copie/home.php'); exit();			
}
					?>
<!DOCTYPE HTML>
<html>

<head>
	<title>Shop Cart</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<!--styles -->
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/jquery.owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/animate.css">
	<!--styles -->
</head>
<body class="woocommerce shop-cart pc">
	<!-- page header -->
	<header id="home">
		<div class="stick-wrapper">
			<div class="sticky clear">
				<div class="grid-row">
					<img class="splash" src="img/splash.png" alt="">
					<div class="logo">
						<a href="index.html"><img src="images/logo.png"  width="130"alt=""></a>
					</div>
					<nav class="nav">
						<a href="#" class="switcher">
							<i class="fa fa-bars"></i>
						</a>
						<ul class="clear">
						<!-- <li><a href="http://localhost/assistante/index.php">Rendez vous</a></li>
						<li><a href="http://localhost/assistante/memoAss.php">Memo</a></li> -->

							<li><a href="index.php">Rendez-vous</a></li>
							<li class="left">
							<a href='doctorMemo.php'>Memo</a>
							<ul>
								<li><a href="doctorMemo.php"><span>Assistante</span></a></li>
								<li><a href="doctorMemo1.php"><span>Patient</span></a></li>
	
							</ul>
						</li>
                            <li><a href="doctorSta.php">Statistique</a></li>
							<li><a href="dossierMedical.php">Patients</a></li>
							<li><a href="doctorMsg.php">Messages</a></li>
						<li class="last"><form action="#" method="POST" >
							<!-- <button  type="submit" name='logout'></button> -->
							<button  type="submit" name='l' >
								
								<a> Deconnexion</a>
					</button>
						
							
						</form>
						</li>
					</ul>
					</nav>
				</div>
			</div>
		</div>

	</header>
	
	<form action="http://localhost/doctor/doctorMsgSave.php" method="POST" >
		 <button class ="save-button" type="submit"   name="savedItems" value="savedItems"> voir les messages eregistrés</button></form>
		<div class="top-bg">
		
    	<img src="img/splash-top.png" class="splash-top" alt>
		<div class="page-title zoomIn animated">Shop</div>
	</div>
	<!-- page content -->
	<div class="page-content">
		<div class="grid-row">
			<!-- Shop -->
			<div class="title clear">
				<div><a  id="tit">Les messages des Patients</a>
				<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span></div>
			</div>
			<div id="content" role="main">
				<form action="#" method="post">
					<table class="shop_table cart">
						<thead>
							<tr style="width: 20px;">
								<!-- <th class="product-thumbnail">&nbsp;</th> -->
								<th class="product-quantity" style="width: 80px;">Date</th>
								<th class="product-quantity" style="width: 100px;">Nom</th>
								<th class="product-quantity" style="width: 100px;">Email</th>
								<th class="product-quantity" style="width: 100px;">Tel</th>
								<th class="product-quantity"style="width: 200px;">Message</th>
								<th class="product-pin" style="width: 40px;"> supprimer&nbsp;</th>
								<th class="product-remove" style="width: 40px;"> Epingler&nbsp;</th>
								

							</tr>
						</thead>
<?php 


include("connexion.php");

/* if (isset($_POST["all"])){ */
	$req='SELECT * FROM contacts';
	$sth = $dbh->query($req);
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); 
	
	foreach ($res as $row){ 
		$id=$row['id'];
		echo('<tbody>								
		<tr class="cart_item">
			<td class="product-quantity">
				<span class="amount">'.$row['date'].'</span>			
			</td>
			<td class="product-quantity">
				<span class="amount">'.$row['fullname'].'</span>			
			</td>
			<td class="product-quantity">
				<span class="amount">'.$row['email'].'</span>			
			</td>
			<td class="product-quantity">
				<span class="amount">'.$row['telephone'].'</span>			
			</td>
			<td class="product-quantity">
			<span class="amount">'.$row['message'].'</span>			
			</td>
			<td >
			<form action="#" method="POST" >
	<button   class ="delete-button" type="submit" name="delete'.$id.'" value="delete'.$id.'" >x</button></form>
	
			</td>	
			<td class="product-remove">
			<form action="#" method="POST" >
			 
	
	<button   id="save'.$id.'" class ="save-button" type="submit" name="save'.$id.'" value="save'.$id.'">save</button></form>
			</td>
			
		
			
		</tr>');
	if (isset($_POST["delete$id"])){
	
		// echo("<script>
		// alert('ce message est supprimé avec succes ,prière d'actualiser la page');
		
		
		// </script>");
	/* $req="delete from contact where id='$id'";
	$sth = $dbh->query($req);
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); */
	
	$count=$dbh->prepare("delete from contacts where id='$id'");
	
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
	if (isset($_POST["save$id"])){

		/* $req="delete from contact where id='$id'";
		$sth = $dbh->query($req);
		$res = $sth->fetchAll(PDO::FETCH_ASSOC); */
		$sql = "update contacts set save=1 where id='$id'";
		$stmt= $dbh->prepare($sql);
		$stmt->execute([$id]);
		
		echo(" 
		<SCRIPT Language='JavaScript'>
	alert('enregistrement avec succes, veuillez consulter la pages des messages enregistrés');
		
  </SCRIPT>") ;
  echo("<script>
  document.getElementById('save".$id."').disabled = true;</script>");

	
		}
	
	}
		echo('<tr>
		
		</tr> 
	</tbody>
	</table>
	</form>');
	
	
	
	
	
	
	

?>

