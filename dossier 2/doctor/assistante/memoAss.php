

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
	<title>About Us</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<!--styles -->
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/main.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!--styles -->
	<style>
	
body{margin-top:20px;}

ul.notes li {
  margin: 10px 40px 50px 0px;
  float: left;
}

ul.notes li, ul.tag-list li {
  list-style: none;
}

ul.notes li div small {
  position: absolute;
  top: 5px;
  right: 5px;
  font-size: 10px;
}

div.rotate-1 {
  -webkit-transform: rotate(-6deg);
  -o-transform: rotate(-6deg);
  -moz-transform: rotate(-6deg);
}

div.rotate-2 {
  -o-transform: rotate(4deg);
  -webkit-transform: rotate(4deg);
  -moz-transform: rotate(4deg);
  position: relative;
  top: 5px;
}

.bg1 {
  background-color: #23c6c8;
  color: #ffffff;
}

.bg2 {
  background-color: #ed5565;
  color: #ffffff;
}

.bg3 {
  background-color: #1ab394;
  color: #ffffff;
}

.bg4 {
  background-color: #f8ac59;
  color: #ffffff;
}

ul.notes li div {
  text-decoration: none;
  color: #000;
  display: block;
  height: 210px;
  width: 210px;
  padding: 1em;
  -moz-box-shadow: 5px 5px 7px #212121;
  -webkit-box-shadow: 5px 5px 7px rgba(33, 33, 33, 0.7);
  box-shadow: 5px 5px 7px rgba(33, 33, 33, 0.7);
  -moz-transition: -moz-transform 0.15s linear;
  -o-transition: -o-transform 0.15s linear;
  -webkit-transition: -webkit-transform 0.15s linear;
}



	</style>
	
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
				<a ><img src="images/logo.jpg" style="width:150px;" alt=""></a>


				</div>
				<nav class="nav">
					<a href="#" class="switcher">
						<i class="fa fa-bars"></i>
					</a>
					<ul class="clear">
						<li><a href="http://localhost/doctor/assistante/index.php">Rendez vous</a></li>
						<li><a href="http://localhost/doctor/assistante/memoAss.php">Memo</a></li>

						<!-- <li class="last"><a href="#">Deconnexion</a></li> -->
						<li class="last"><form action="#" method="POST" >
							<button  type="submit" name='l'>
							<a> Deconnexion</a>
						 
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
	
	<div class="top-bg">
		
	<img src="img/splash-top.png" style="width:1550px;" class="splash-top" alt>
		<div class="page-title zoomIn animated"></div>
	</div>
	<!-- page content -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<div class="title">
<span class="main-title">MEMO </span>
<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span><h5 style="font-size: 69px;">Voir les Memo de votre medecin </h5>
</div>
<?php include ("affmemo.php");?>



	<!--/ subscribe  -->
	<!-- page footer -->
	
	<!--/ page footer  -->
	<a href="#" id="scroll-top" class="scroll-top"><i class="fa fa-angle-up" style="color:blue;"></i></a>
	<!-- scripts -->
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox_packed.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/retina.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
		
	<!--/ scripts  -->
</body>
</html>