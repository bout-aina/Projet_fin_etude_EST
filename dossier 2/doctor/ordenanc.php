<?php
require('connexion.php');

if (isset($_POST["valide"])){
	$id=$_GET['id'];
    $ls=$_POST["ls"];
    $lc=$_POST["lc"];
    $la=$_POST["la"];
    $ld=$_POST["ld"];
    $rs=$_POST["rs"];
    $rc=$_POST["rc"];
    $ra=$_POST["ra"];
    $rd=$_POST["rd"];

    $sq = "insert into optics (idRDV,leftSphere,leftCylindre,leftAxe,leftAdd,rightSphere,rightCylindre,rightAxe,rightAdd) value( '$id','$ls','$lc','$la','$ld','$rs','$rc','$ra','$rd')";
 $dbh->exec($sq);
 

	 header("location:http://localhost/doctor/pdf/ordonance1.php?id=$id");

}
if (isset($_POST["quite"])){
	
	
	 header("location:http://localhost/doctor/index.php");

}if (isset($_POST["quiter"])){
	
	
	header("location:http://localhost/doctor/index.php");

}

				?>





<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Prescription </label>
		<input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab">Mesure optic</label>
		<div class="login-form">
        
			<div class="sign-in-htm">
            <form  method="POST" >
				<div class="group">
					<label for="user" class="label">prescription ou medicament </label>
					<input id="user" type="text" name='pre' class="input">
				</div>
                
				<!-- <div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div> -->
				<div class="group">
					<input  type="submit"  name='add' class="button"   value="ajouter ">
                </div>
			
                
                <div class="group">
					<label for="user" class="label">les prescriptions saisies</label>
					<textarea id="user" type="text" name='total'  class="input" readonly>
                    <?php
$myfile = fopen("ord.txt", "a+") or die ("Unable to open file!");
// $text1='data';

 
if (isset($_POST['add'])){
    $txt="\n"."-".$_POST["pre"];
    // echo(fread($myfile,filesize("ord.txt")).$txt);
    while(!feof($myfile)) {
        echo fgetc($myfile);
      }
   echo($txt);
    fwrite($myfile, $txt);
    
   

}



if (isset($_POST['valider'])){
	$id=$_GET['id'];
	$t= fread($myfile,filesize("ord.txt"));
	 $sqla = "insert into prescriptions (idRDV,data) value( '$id','$t')";
	 $dbh->exec($sqla);
	 ftruncate($myfile,0);
	//  header("Refresh:0");
	
	 header("location:http://localhost/doctor/pdf/ordonance2.php?id=$id");
	
 }
if (isset($_POST['vider'])){

   
     ftruncate($myfile,0);
     header("Refresh:0");
 }
?>
                    </textarea>
				</div>
				<div class="group">
					<input type="submit"   name='vider' class="button"   value="vider ">
				</div>
                <div class="group">
					<input type="submit" name='valider' class="button"   value="valider ">
</div>
<div class="group">
					<input type="submit" name='quiter' class="button"   value="quitter">
</div>
				<div class="hr"></div>
                </form>
            </div>
            
			<div class="for-pwd-htm">
            <form method="POST">
                <div class="group">
					<input  class="button" value="                           oeil droite" readonly>
				</div>
				<div class="group">
					<label for="user" class="label">Sphere</label>
                    <input id="user"  name="rs"type="text" class="input">
                    <label for="user"  class="label">Cylindre</label>
					<input id="user" name="rc" type="text" class="input" >
					
                </div>
                <div class="group">
					<label for="user" class="label">Axe</label>
					<input id="user"  name="ra"type="text" class="input">
				</div><div class="group">
					<label for="user" class="label">Add</label>
					<input id="user" name="rd" type="text" class="input">
				</div>
			
				<div class="group">
					<input  class="button" value="                            oeil gauche" readonly>
				</div>
				<div class="group">
					<label for="user" class="label">Sphere</label>
                    <input id="user"  name="ls"type="text" class="input">
                    <label for="user" class="label">Cylindre</label>
					<input id="user" name="lc"type="text" class="input">
                </div>
                <div class="group">
					<label for="user" class="label">Axe</label>
					<input id="user" name="la" type="text" class="input">
				</div><div class="group">
					<label for="user" class="label">Add</label>
					<input id="user"  name="ld"type="text" class="input">
				</div>
				<div class="group">
					<input type="reset"  class="button" value="vider">
				</div>
				<div class="group">
					<input type="submit" class="button" name="valide" value="valider">
				</div>
				<div class="group">
					<input type="submit" name='quite' class="button"   value="quitter">
</div>
                <div class="hr"></div>
                    </form>
            </div>
            
		</div>
	</div>
</div>

  
<style>
 body {
	margin:0;
	color:#edf3ff;
	background:#c8c8c8;
	background:url(b.jpg) fixed;
	background-size: cover;
	font:600<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

 16px/18px 'Open Sans',sans-serif;
}
:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width: 100%;
	margin:auto;
	max-width:510px;
	min-height:1300px;
	position:relative;
	background:url(https://maxcdn.icons8.com/app/uploads/2016/03/material-1-1000x563.jpg) no-repeat center;
	background-size: cover;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-wrap.login-html.login-form.for-pwd-htm{
	
	min-height:1200px;
	
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(0,0,0,0.5);
}
.login-html .sign-in-htm,
.login-html .for-pwd-htm
{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	-webkit-transform:rotateY(180deg);
	        transform:rotateY(180deg);
	-webkit-backface-visibility:hidden;
	        backface-visibility:hidden;
	-webkit-transition:all .4s linear;
	transition:all .4s linear;
}

.login-html .sign-in,
.login-html .for-pwd,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .for-pwd:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	-webkit-perspective:1000px;
	        perspective:1000px;
	-webkit-transform-style:preserve-3d;
	        transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.for-pwd-htm.group .label,
.for-pwd-htm .group .input,
.for-pwd-htm .group .button{
	width:100%;
	color:#fff;
	display:block;
}.for-pwd-htm  .sign-in-htm,

.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}


.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}

.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}

.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	-webkit-transition:all .2s ease-in-out 0s;
	transition:all .2s ease-in-out 0s;
}

.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}

.login-form .group label .icon:after{
	top:6px;
	right:0;
	-webkit-transform:scale(0) rotate(0);
	        transform:scale(0) rotate(0);
}

.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}

.login-form .group .check:checked + label .icon:before{
	-webkit-transform:scale(1) rotate(45deg);
	        transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	-webkit-transform:scale(1) rotate(-45deg);
	        transform:scale(1) rotate(-45deg);
}

.login-html .sign-in:checked + .tab + .for-pwd + .tab + .login-form .sign-in-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}
.login-html .for-pwd:checked + .tab + .login-form .for-pwd-htm{
	-webkit-transform:rotate(0);
	        transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}</style>
