<?php
if (isset($_POST['l'])){

// 			echo("<script> var r=confirm('etes-vous sur de vous deconnecter .');
			 
// if (r == true)</script> ");
 header('location:http://localhost/park%20shine%20soo%20-%20Copie/home.php'); exit();			
}
					?>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact V3</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="calendar.css">
    <link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main1.css">
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/animate.css">
<!--styles -->

	<link rel="stylesheet" href="css/main.css">
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>


</style>
	<!--styles -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head> 
   
<body class="page-about pc">
	<!-- page header -->
	<header id="home">
		<!-- sticky menu -->
		<div class="stick-wrapper">
			<div class="sticky clear">
			<div class="grid-row">
			<img class="splash" src="img/splash.png" alt="">
				<div class="logo">
					<a ><img src="images/logo.png" style="width:150px;" alt=""></a>

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
		<!--/ sticky menu -->
	</header>
	<!--/ page header  -->
	<div class="top">
		
	<img src="img/splash-top.png" style="width:1550px"class="splash-top" alt>
		<div class="page-title zoomIn animated">Calendrier</div>
	</div>
	<!-- page content -->
	<div class="top-bg">
		
    	<img src="img/splash-top.png" class="splash-top" alt>
		<div class="page-title zoomIn animated">Memo</div>
	</div>
	<!-- page content -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<div class="title">
<span class="main-title">Calendrier </span>
<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span><h5 style="font-size: 69px;" >Voir les rendez vous prises </h5>
</div>
 

<?php  

require("rendezVous.php");
require("Month.php");
$rdvs=new RendezVous();
 $month=new Month($_GET['month']??null,$_GET['year']??null);
 $start=$month->getStartingDay();
$weeks=$month->getWeeks();
 $start=$start->format('N')=== '1' ? $start : $month->getStartingDay()->modify('last monday');
$end=(clone $start)->modify('+'.(6+7*($weeks-1)) . 'days');

$rdvs= $rdvs->getRDVbyDay($start,$end);
// var_dump($rdv);
?>
 <div class="d-flex flex-row align-items-center justify-content-between mx-sm-3">
<a href="index.php?month=<?=$month->previousMonth()->month;?>&year=<?=$month->previousMonth()->year;?>" class ="btn btn-primary">&lt</a>
<h1><?= $month->toString();?></h1>
<a href="index.php?month=<?=$month->nextMonth()->month;?>&year=<?=$month->nextMonth()->year;?>" class ="btn btn-primary">&gt</a>
</div> 
<table class="calendar__table calendar__table--<?= $weeks;?>weeks">
    <?php  for($i=0;$i<$weeks;$i++ ):?>
  <tr>
  <?php  foreach($month->days as $k => $day):
    $date=(clone $start)->modify("+".($k+$i*7). "days");
    $rdvForDay=$rdvs[$date->format('Y-m-d')] ?? [];
    
    ?>
 <td  class ="<?=$month->withinMonth($date)? "":"calendar__othermonth";?>">
 <?php  if($i==0):?>
<div class ="calendar__weekday"><?= $day; ?> </div>
  <?php  endif; 
 // $s="style='background-color:  rgb(14, 147, 151);'";?> 
  <div class="calendar__day"  style="font-size: 16px;" ><?= $date->format('d');?></div> 
  <?php  
 
  
    $user = 'root';
    $pass = '';
    $dsn = 'mysql:host=127.0.0.1;dbname=paty12';
    try {
    $dbh = new PDO($dsn, $user, $pass);
    
    }
    catch (PDOException $e) {
    print "Erreur ! : " . $e->getMessage() ."<br/>";
    die();
    }?>
 <?php  
    $t=0;
  ?>
<?php  foreach($rdvForDay as $rdv) : 
$t++;
$id=$rdv['idRendezVous'];
    $stm = $dbh->prepare("SELECT user_id  FROM `rendezvouses` WHERE idRendezVous='$id' limit 1");
$stm->execute([$id]); 
$user = $stm->fetch();

$idU= $user['user_id'];
         $stmt = $dbh->query("SELECT * FROM `users` where id='$idU' LIMIT  1");
         $userrdv = $stmt->fetch();
         $first_name=$userrdv['name'];
        
// $id=$rdv['idRendezVous'];
  
   if($t>=10)
  //  $s="style='background-color:  rgb(238, 120, 120);'";
  echo("<div class='calendar__event'  style='background-color:  rgb(238, 120, 120);font-size: 16px;'>") ;
  else 
  echo("<div class='calendar__event' style='font-size: 16px'>") ;

   ?> 
  
   <!-- <div class="calendar__event" >  -->
   
   -<a href="rdv.php?id=<?= $rdv['idRendezVous'];?>"> <?= $first_name;?></a>
</div> 
  <?php  endforeach; ?>
</td> <?php  endforeach; ?>
    </tr>
    <?php  endfor; ?>
</table>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox_packed.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/main1.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/retina.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	</body>
	
	