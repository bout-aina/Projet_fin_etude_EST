<?php
include ("conex.php");
if(isset($_POST['em'])){
	
//Récuperer email depuis variable $_POST
$mail = $_POST["mail"];if(!empty($mail)){
//Verification existance de l'email sur la base de données
$sql =("SELECT emailAss from cnxassistants WHERE emailAss ='".$mail."' limit 1");
 $query=mysqli_query($con,$sql);
 $sqlmdp="SELECT passAss from cnxassistants WHERE emailAss ='".$mail."' limit 1";
 $query2=mysqli_query($con,$sqlmdp);

//Si le mail existe
if(mysqli_num_rows($query)!=0){
while($data=mysqli_fetch_array($query2)){
$header="MIME-Version: 1.0\r\n";
$header.='From:"PrimFX.com"<support@primfx.com>'."\n";
$header.='Content-Type:text/html; charset="uft-8"'."\n";
$header.='Content-Transfer-Encoding: 8bit';

$message='
<html>
	<body>
		<div align="center">
			<br /> votre mot de passe est '.$data['passAss'].'
			<a href="http://localhost/colorlib-regform-20/index.php">connexion ici</a>
			
			<br />
		</div>
	</body>
</html>
';

mail($mail, "Salut tout le monde !", $message, $header);
// ini_set();
echo "<div style='color:green;background:rgb(217, 255, 179);' class='alert alert-danger'>
  un email a ete envoye
</div>";
}}else{ //Sinon
 echo "<div class='alert alert-danger'>
  ce utilisateur n'existe pas
</div>";

}}
else{
	echo "<div class='alert alert-danger'>
  entrez svp votre email
</div>";
	
}


 }
 
?>


<!DOCTYPE html>
<html>
<head>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head><body>
<section class="login-block">
    <div class="container">
    <div class="row">
        <div class="col-md-4 login-sec">
            <h2 class="text-center">Mot de passe oublie</h2>
            <form class="login-form" action="#" method="POST">
  <div class="form-group"><br><br><br><br>
    <label for="exampleInputEmail1" class="text-uppercase">Email</label>
    <input type="email" name="mail" class="form-control" placeholder="">
    
  </div>
  
  
  
    <div class="form-check">
 
    <button type="submit" name="em" class="btn btn-login float-right">Envoyer</button>
  </div>
  
</form>

        </div>
        <div class="col-md-8 banner-sec">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="d-block img-fluid" src="d.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>Nous sommes ici <br>pour vous</h2>
            <p>Pour recupurez votre mot de passe<br> veuillez juste ecrire votre email </p>
        </div>  
  </div>
    </div>
   
  </div>
            </div>     
            
        </div>
    </div>
</div>
</section></body>
<style>
    @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");
.login-block{
    background: #DE6262;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #FFB88C, #DE6262);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #FFB88C, #DE6262); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
float:left;
width:100%;
padding : 50px 0;
}
.banner-sec{background:url(https://static.pexels.com/photos/33972/pexels-photo.jpg)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
.carousel-inner{border-radius:0 10px 10px 0;}
.carousel-caption{text-align:left; left:5%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #DE6262; color:#fff; font-weight:600;}
.banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
.banner-text h2{color:#fff; font-weight:600;}
.banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
.banner-text p{color:#fff;}

    </style>