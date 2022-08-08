<?php
if (isset($_POST['l'])){

// 			echo("<script> var r=confirm('etes-vous sur de vous deconnecter .');
			 
// if (r == true)</script> ");
 header('location:http://localhost/park%20shine%20soo%20-%20Copie/home.php'); exit();			
}
					?>
<!DOCTYPE html>
<!-- <HTML lang="en" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"> -->
<HEAD>
  <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  <link href="css/ffolders.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/jquery.owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/animate.css">

  <style type="text/css">
  	@import url(https://fonts.googleapis.com/css?family=Lato:400,300);
  	body{
  		font-family: 'Lato', sans-serif;
  	}
  	h1{
		font-size: 86px;
	    color: #777;
	    font-weight: 300;
  	}
  	h4{
		font-size: 24px;
		color: #777;
		font-weight: 300;
  	}
  	p{
  		font-size: 17px;
  		color:#777;
  	}

  	.container.main{
  		padding-top: 40px;
  		padding-bottom: 40px;
  	}

  	.ffolder{
  		margin:0 20px 24px 0;
  	}
  	
  	span.version{
		font-size: 15px;
		font-weight: 400;
  	}

	.ffolder.demo span, .ffolder.demo2 span{
		background-color: transparent;
	}

  	.ffolder.demo span i{
    	color: #FF5E6E;
  	}

  	.sepSection{
  		margin-bottom: 50px;
  	}

  	p.info{
  		font-size: 15px;
		font-weight: 400;
  	}
	  @import url("https://fonts.googleapis.com/css?family=Roboto:400,400i,700");

* {
  font-family: Roboto, sans-serif;
  padding: 0;
  margin: 0;
}

html, body {
  width: 100%;
  height: 100%;
}

.flexbox {
  background: linear-gradient(155deg, #55c7ed, #2bb3e0, #3bc1ed);
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

#imaginary_container{
    margin-top:20%; /* Don't copy this */
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}
  </style>

</HEAD>
<body class="woocommerce shop-cart pc">
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
<BODY>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
	
<div class="container">
	<div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div id="imaginary_container"> <form action="#" method="POST">
                <div class="input-group stylish-input-group">
					
                    <input type="text" class="form-control"  name='cin' placeholder="Search" >
                    <span class="input-group-addon">
					
                        <button type="submit" name="search">
                            <span class="glyphicon glyphicon-search"></span>
						</button>  
						
                    </span>
                </div></form>
            </div>
        </div>
	</div>
</div>
	



</BODY>
</HTML>

<?php
include ("connexion.php");
if(isset($_POST['search'])){
	echo('<form action="#" method="POST" >
		 <button class ="save-button" type="submit"   name="savedItems" value="savedItems"> voir tous les dossiers</button></form>
		');
	$search=$_POST['cin'];

	$output="";
$search=preg_replace("#[^0-9a-z]#i","",$search);

$req="SELECT count(*) from users where cin like '%".$search."%'";

$result = $dbh->prepare($req); 
$result->execute(); 
$number_of_rows = $result->fetchColumn(); 

if($number_of_rows==0)
{
	
 
	echo "<div class='alert alert-danger'>
  ce dossier n'existe pas
</div>";
}
else{
	
	echo('<div class="container main">');
	 
	$reqa="SELECT * from users where cin like '%".$search."%'";

$stha = $dbh->query($reqa);
	$resa = $stha->fetchAll(PDO::FETCH_ASSOC); 
	
// and somewhere later:


	// and somewhere later:
	
	foreach ($resa as $ro) {
		echo('
	
		 <div class="ffolder small cyan"><span>');?>
		  <a style="color: aliceblue;" href="infopatient.php?id=<?= $ro['id'];?>"> <?=$ro['cin'];?></a>
		  <?php echo('</span></div>');		
	}
		echo('</div>
		');
}

}
else{
echo('<div class="container main">');
$req='SELECT * from users ';
  $sth = $dbh->query($req);
  
	$res = $sth->fetchAll(PDO::FETCH_ASSOC); 

// and somewhere later:

foreach ($res as $row) {
	echo('

	 <div class="ffolder small cyan"><span>');?>
	  <a style="color: aliceblue;" href="infopatient.php?id=<?= $row['id'];?>"> <?=$row['cin'];?></a>
	  <?php echo('</span></div>');
	
}
	echo('</div>
	');}
?>