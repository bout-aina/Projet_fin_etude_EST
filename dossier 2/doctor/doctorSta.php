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
	<title>Espace Medecin</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<!--styles -->
	 
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/stat.css">

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!--styles -->
	
</head>
<body class="contact-page pc">
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
	<div class="container">
	<div class="row text-center">
	<div class="title">
	
	<br><br>
<span class="main-title">Statistiques </span>
<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span><h5 style="font-size: 69px;" >Pourcentage des rendez-vous </h5>
</div>		
	
<?php
require('connexion.php');
/******************************** la table user*************************8*/ 
// pourcentage par jour
$date=date("Y-m-d");
$sql="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 10) like '$date'";

$result = $dbh->prepare($sql); 
$result->execute(); 
$user= $result->fetchColumn(); 
// le nombre des user par mois
$dateM=date("Y-m");
$datemm=date('Y-m',strtotime("-1 month"));
$sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$dateM'";

$result1 = $dbh->prepare($sql1); 
$result1->execute(); 
$mois= $result1->fetchColumn(); 
// le nombre des user par ann
$dateY=date("Y");
$dateyy=date('Y',strtotime("-1 year"));
$sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 4) like '$dateY'";

$result1 = $dbh->prepare($sql1); 
$result1->execute(); 
$year= $result1->fetchColumn(); 

$d=($user*100)/10;
$m=($mois*100)/3120;
$y=($year*100)/3120;
?>
		<div class="col-sm-4">
		    <div class="progressbar">
            <div class="second circle" data-percent=<?=$d?>>
              <strong></strong>
              <span>Aujourd'hui</span>

            </div>
            </div>
		</div>
		
		<div class="col-sm-4">
		    <div class="progressbar">
            <div class="second circle" data-percent=<?=$m?>>
              <strong></strong>
              <span>Ce_mois</span>
            </div>
            </div>
		</div>
		
		<div class="col-sm-4">
		    <div class="progressbar">
            <div class="second circle" data-percent=<?=$y?>>
              <strong></strong>
              <span>Cette_annee</span>
            </div>
            </div>
		</div>
		<div class="container">
	<div class="row text-center">
	<div class="title">
	
	<br><br>
<span class="main-title">Statistiques </span>
<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span><h5 style="font-size: 69px;" >Pourcentage des comptes créées </h5>
</div>		
    </div></div></div>
	</div>
</div>

<?php
echo "<br><br><br>";
 

include("static2.php");
 ?>
<?php

echo "<br><br><br>";




?>
<script src="https://rawgit.com/kottenator/jquery-circle-progress/1.2.2/dist/circle-progress.js"></script>


<script>

$(document).ready(function ($) {
    function animateElements() {
        $('.progressbar').each(function () {
            var elementPos = $(this).offset().top;
            var topOfWindow = $(window).scrollTop();
            var percent = $(this).find('.circle').attr('data-percent');
            var animate = $(this).data('animate');
            if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
                $(this).data('animate', true);
                $(this).find('.circle').circleProgress({
                    // startAngle: -Math.PI / 2,
                    value: percent / 100,
                    size : 400,
                    thickness: 15,
                    fill: {
                        color: '#66d8f5'
                    }
                }).on('circle-animation-progress', function (event, progress, stepValue) {
                    $(this).find('strong').text((stepValue*100).toFixed(0) + "%");
                }).stop();
            }
        });
    }

    animateElements();
    $(window).scroll(animateElements);
});
</script>