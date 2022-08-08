<?php
require('connexion.php');
require("rendezVous.php");
require("Month.php");

$id=$_GET['id'];

$stmt = $dbh->query("SELECT * FROM `users` where id='$id' LIMIT  1");
$user = $stmt->fetch();

if(isset($_POST['ticket'])){


}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--styles -->
	<link rel="stylesheet" href="css2/font-awesome.css">
	<link rel="stylesheet" href="css2/owl.carousel.css">
	<link rel="stylesheet" href="css2/main.css">
	<link rel="stylesheet" href="css2/jquery.fancybox.css">
	<link rel="stylesheet" href="css2/animate.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!--styles -->
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts2/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css2/util.css">
	<link rel="stylesheet" type="text/css" href="css2/main1.css">
<!--===============================================================================================-->
</head>


<body style="background-image: url('b.jpg')";>

	<div class="contact1">
		<div class="container-contact1">
			<div class="contact1-pic js-tilt" data-tilt>
				<img src="images/img.png" alt="IMG">
			</div>

			
		
			<form action="http://localhost/doctor/uploadFile/index.php?id=<?= $user['id'];?>" method="POST" >
				<span class="contact1-form-title">
				Vos information
				</span>

				
				
				<div class="wrap-input1 validate-input" data-validate = "Name is required">
					<input class="input1" type="text" name="name" value="<?php echo $user['name']?>" placeholder="Name"  readonly>
					<span class="shadow-input1"></span>
				</div>
				<div class="wrap-input1 validate-input" data-validate = "Name is required">
					<input class="input1" type="text" name="cin" value="<?php echo$user['cin']?>" placeholder="Name"  readonly>
					<span class="shadow-input1"></span>
				</div>

				<div class="wrap-input1 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					<input class="input1" type="text" name="mobile" value="<?php echo $user['mobile']?>" placeholder="Email"  readonly>
					<span class="shadow-input1"></span>
				</div>

				<div class="wrap-input1 validate-input" data-validate = "Subject is required">
					<input class="input1" type="text" name="email" value="<?php echo $user['email']?>" placeholder="Subject"  readonly>
					<span class="shadow-input1"></span>
				</div>

				
				
				<div class="container-contact1-form-btn">
					<button  type="submit" name='ticket1' style="background-color: rgb(5, 170, 134)"; class="contact1-form-btn">
					<span >


							voir les fichiers de ce dossier
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>

	
		</div>
	</div>




<!--===============================================================================================-->
	<script src="vendor2/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/bootstrap/js/popper.js"></script>
	<script src="vendor2/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<!--===============================================================================================-->
	<script src="js2/main1.js"></script>

</body>
</html>







