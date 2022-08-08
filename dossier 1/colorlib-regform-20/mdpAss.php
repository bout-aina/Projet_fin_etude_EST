<?php
include ("loginAssphp.php");
if(isset($_POST['em2'])){
	
$nvmdp=$_POST['nvmdp'];
$nvmdp2=$_POST['nvmdp2'];
if(!empty($nvmdp) || !empty($nvmdp))
{
	if($nvmdp==$nvmdp2)
	{
		include ("conex.php");
		
		$req="UPDATE `cnxassistants` SET `passAss`='".$nvmdp2."' WHERE emailAss='".$_POST["mail"]."'";
		mysql_query($req);
		echo "<div class='alert alert-danger'>
  mot de passe modifiee
</div>";
	}else{
		 echo "<div class='alert alert-danger'>
  les deux mot de passe doit etre identiques
</div>";
	}
	
}else 
{
	 echo "<div class='alert alert-danger'>
  Remplir tout les champs
</div>";
}

}




?>











<!DOCTYPE html>
<html>
<head>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>


.login_main{
background-image: url(http://data.freehdw.com/creativity-water-spray-drops-flower-rose-desktop-images.jpg);
background-position: cover;
background-position:repeat-y;
}

.login_heading{

	text-align: center;
	color:green;
	margin-bottom: 30px;
	margin-top:120px;

}
.login_form_0{



}
.login_wrapper{
max-width:500px;
margin-left: 32%;
margin-bottom: 115px;
box-shadow: 0 12px 200px #e7e7e7;
padding: 25px;
}


.login_wrapper label{
font-weight:500;
font-style: 18px;
padding: 5px;

}


.login_submit{

margin-left: 30%;
}

.login_submit_button_0 button{

margin-left: 40%;
margin-top: 20px;

}

.login_or{
opacity: 0.7;
text-align: center;
font-weight: 400;

}
.login_or_0{
opacity: 0.7;
color: white;
text-align: center;
font-weight: 400;


}
.login_or_another{
text-align: center;
font-weight:500;

}

.login_form_1{
margin-top: 80px;
color: white;
text-align: center;
font-weight: 400;


}
.login_check_0{

margin-top: 7px;

}
.login_check_1{

	font-size: 18px;
margin-left:-305px;
}

.login_check_1 input[type="checkbox"]{
	width:20px;
	height: 20px;
margin-top: 0px;
	
	}


@media only screen and (max-width: 787px) {
   
.login_check_0{
margin-left:90px;

}

.login_wrapper{
	margin-left: 1px;
}

.login_or_another{
	font-size: 22px;
}

   }



</style></head><body>
<form action="#" method="POST">
<div class="container-fluid login_main">


<h1 class="login_heading">  Recupurer votre mot de passe</h1>

<div class="login_wrapper">

<form class="login_form_1">

    <div class="input-group form-group-lg">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="text" type="nvmdp" class="form-control" name="nvmdp" placeholder="Nouveau mot de passe">
    </div><br/>
	<div class="input-group form-group-lg">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="text" type="nvmdp2" class="form-control" name="nvmdp2" placeholder="comfirmer votre nouveau mot de passe">
    </div><br/>




</form>
<div class="login_submit_button_0">

<input type="submit" style="margin-left:100px;" class="btn btn-primary btn-lg" name="em2" value="ENVOYER">
</div>	

</div>
</div>
</form></body>