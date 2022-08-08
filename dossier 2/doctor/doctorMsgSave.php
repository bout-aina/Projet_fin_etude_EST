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
    <form action="http://localhost/doctor/doctorMsg.php" method= "POST" >
		 

		 <button    class ="save-button"  type="submit"  onClick = "this.style.visibility= 'hidden';" name="all" value="all">voir   tous    les     messages  </button></form>
		  
         <div class="top-bg">
		
    	<img src="img/splash-top.png" class="splash-top" alt>
		<div class="page-title zoomIn animated">Shop</div>
	</div>
	<!-- page content -->
	<div class="page-content">
		<div class="grid-row">
			<!-- Shop -->
			<div class="title clear">
				<div><a  id="tit" href="shop-product-list.html">Les messages enregistres </a>
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

	$reqa='SELECT * FROM contacts where save=1';
$stha = $dbh->query($reqa);
$resa = $stha->fetchAll(PDO::FETCH_ASSOC); 

foreach ($resa as $rowa){ 
	$ida=$rowa['id'];
	echo('<tbody>								
	<tr class="cart_item">
		<td class="product-quantity">
			<span class="amount">'.$rowa['date'].'</span>			
		</td>
		<td class="product-quantity">
			<span class="amount">'.$rowa['fullname'].'</span>			
		</td>
		<td class="product-quantity">
			<span class="amount">'.$rowa['email'].'</span>			
		</td>
		<td class="product-quantity">
			<span class="amount">'.$rowa['telephone'].'</span>			
		</td>
		<td class="product-quantity">
		<span class="amount">'.$rowa['message'].'</span>			
		</td>
		<td >
		<form action="#" method="POST" >
<button  class ="delete-button" type="submit" name="delete'.$ida.'" value="delete'.$ida.'" >x</button></form>

		</td>	
		<td class="product-remove">
		<form action="#" method="POST" >
		 

<button  class ="save-button" type="submit" name="unsave'.$ida.'" value="unsave'.$ida.'">unsave</button></form>
		</td>
	</tr>');
if (isset($_POST["delete$ida"])){
echo($_POST["delete$ida"]);

/* $req="delete from contact where id='$id'";
$sth = $dbh->query($req);
$res = $sth->fetchAll(PDO::FETCH_ASSOC); */

$counta=$dbh->prepare("delete from contacts where id='$ida'");

$counta->execute();
	
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
if (isset($_POST["unsave$ida"])){
	
	/* $req="delete from contact where id='$id'";
	$sth = $dbh->query($req);
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); */
	$sqla = "update contacts set save=0 where id='$ida'";
	$stmta= $dbh->prepare($sqla);
	$stmta->execute([$ida]);
	
	echo(" 
	<SCRIPT Language='JavaScript'>
alert('operation effectuée avec succes, veuillez consulter la pages des messages non enregistrés');
javascript:location.reload(true);
</SCRIPT>") ;
	
	

	
	}
}
	echo('<tr>
	
	</tr> 
</tbody>
</table>
</form>');
	
	
?>