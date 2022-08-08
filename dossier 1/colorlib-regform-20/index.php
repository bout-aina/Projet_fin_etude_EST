

<?php
include ("conex.php");
//error_reporting(0);
  if(isset($_POST['cnxass']))
  { 
    // Getting username/ email and password
    $email=$_POST['emailass'];
    $password=($_POST['mdpass']);
	
	 IF (empty($email) || empty($password)) {
		 $err = "<div class='alert alert-danger'>
  tout les champs doivent etre remplir
</div>";
  }

  

  IF (!empty($err)) {

    // there are errors
    echo("<p>".$err."</p>");

  }ELSE{
    // Fetch data from database on the basis of username/email and password
    $sql ="SELECT emailAss,passAss FROM cnxassistants WHERE emailAss='".$email."' and passAss='".$password."' limit 1";
  $result=mysqli_query($con,$sql);
	if(mysqli_num_rows($result)==1)
	{
echo "welcome";		
exit();
  }else{
	  echo "<div class='alert alert-danger'>
  Email ou mot de passe incorrect
</div>";
  }
  
  }
}


if(isset($_POST['connexionMedecin']))
{ 
  // Getting username/ email and password
  $email1=$_POST['emailMed'];
  $password1=($_POST['passwordMed']);

 IF (empty($email1) || empty($password1)) {
   $err1 = "<div class='alert alert-danger'>
tout les champs doivent etre remplir
</div>";
}



IF (!empty($err1)) {

  // there are errors
  echo("<p>".$err1."</p>");

}ELSE{
  // Fetch data from database on the basis of username/email and password
  $sql1 ="SELECT email,password FROM medecins WHERE email='".$email1."' and password='".$password1."' limit 1";
$result1=mysqli_query($con,$sql1);
if(mysqli_num_rows($result1)==1)
{ echo('welcome ssi tib');
// include('\park shine soo\doctor.html');
exit();
}else{
  echo "<div class='alert alert-danger'>
Email ou mot de passe incorrect
</div>";
}

}
}



?>







<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contactez_nous</title>
  <link rel="stylesheet" type="text/css" href="contact_us.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper">

  <section class="user">
    <div class="user_options-container">
      <div class="user_options-text">

        <div class="user_options-unregistered">
          <h2 class="user_registered-title">Assistante</h2>
          <span class="border"></span>
          <h5 class="user_registered-text">Notre cabinet vous contactera<br> le plus rapidement possible.</h5><br><br><br><br><br><br><br><br><br><br>
          <button class="user_unregistered-signup" id="signup-button">Medecin <i class="fas fa-arrow-right"></i></button>
        </div>

        <div class="user_options-registered">
          <h2 class="user_unregistered-title">Medecin</h2>
          <span class="border"></span>
          <h5>Notre cabinet vous contactera le plus<br> rapidement possible.</h5>
       
          <div class="social">
         <br><br><br><br><br><br><br><br><br><br><br>
          </div>
          <button class="user_registered-login" id="login-button"><i class="fas fa-arrow-left"> </i>   Assistante</button><br><br>
        </div>
      </div>
      
      <div class="user_options-forms bounceLeft" id="user_options-forms">
        <div class="user_forms-login">
          <h2 class="forms_title">Assistante</h2>
          <span class="center_border" style="background: #3a58f9;margin-bottom: 10px;"></span>
           <div class="form-group contact_us">
             <br>  <br>  <br> 
            </div>
          <form class="forms_form"  action="#" method="POST">

            <div class="form-group contact_us">  
              <input type="email" name="emailass"  class="full text-center" id="email" placeholder="  Email  " />
			
            </div>
			 <div class="form-group contact_us">
              <input type="text" name="mdpass" class="full text-center" id="societe" placeholder="  Mot De Passe  "/>
            </div>

           
           
         
 <div class="form-group contact_us">
             <a href="http://localhost/colorlib-regform-20/loginAss.php" style="color:blue;">Mot de passe oublié</a>
            </div>
            <div class="form-group contact_us">
             <br>  
            </div>

            <input class="btn btn-warning" name="cnxass" value="CONNEXION" type="submit" ><span> </span>
          </form>
        </div>

        <div class="user_forms-signup">
          <h2 class="forms_title">Medecin</h2>
          <span class="center_border" style="background: #3a58f9;margin-bottom: 10px;"></span>
          <form class="forms_form" action="#" method="POST">
            <div class="form-group contact_us">
             <br>  <br>  <br> 
            </div>

                          <div class="form-group contact_us">
                            <input type="email" name="emailMed"  class="full text-center" id="email" placeholder="  Email  "/>
                            <!-- <i class="fas fa-comment"></i> -->
                          </div> 
						  
						  
						  
						  <div class="form-group contact_us">
                          <input type="text" name="passwordMed" class="full text-center" id="societe"  placeholder="  Mot De Passe  "/>
                            <!-- <i class="fas fa-building"></i> -->
                          </div>
<div class="form-group contact_us">
             <a href="" style="color:blue;">Mot de passe oublié</a>
            </div>    <div class="form-group contact_us">
             <br>   
            </div>
            <input class="btn btn-warning" name="connexionMedecin" value="CONNEXION" type="submit" ><span> </span>

           </form>
        </div>
      </div>
    </div>
  </section>

<script type="text/javascript">
  
  const signupButton = document.getElementById("signup-button"),
  loginButton = document.getElementById("login-button"),
  userForms = document.getElementById("user_options-forms");

/**
 * Add event listener to the "Sign Up" button
 */
signupButton.addEventListener(
  "click",
  ()=>{
    userForms.classList.remove("bounceRight");
    userForms.classList.add("bounceLeft");
  },
  false
);

/**
 * Add event listener to the "Login" button
 */
loginButton.addEventListener(
  "click",
  () => {
    userForms.classList.remove("bounceLeft");
    userForms.classList.add("bounceRight");
  },
  false
);
</script>
<style>


@charset "utf-8";
/* CSS Document */
* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
          margin: 0;
          padding: 0
}

body {
  font-family: "Montserrat", sans-serif;
  background: url(a.jpg) no-repeat 50% 50%;
  background-size: 100%;
  background-position: center;
}

/* -----------START animation draw svg------------------ */

.overlay {
     z-index: 1;
     position: absolute;
     width: 100%;
     height: 100vh;
     background: #000;
     text-align: center;
     display: table;
     
}

.overlay > .wrapperr{
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 30%;
}

.overlay-2 {
     z-index: 0;
     position: absolute;
     width: 100%;
     height: 100vh;
     background: #3a58f9;
}

.st0{
  stroke: #fff;
  opacity: 10;
  stroke-dasharray: 2000;
  stroke-width:1;
  animation: animate 3s cubic-bezier(0,0.23,1,.1);
}

.st1{
      stroke: #fff;
      stroke-dasharray: 1800;
      opacity: 10;
      stroke-width:3;
      stroke-miterlimit:10;
      animation: animatee 3s cubic-bezier(0,0.23,1,.1);
}

@keyframes animate {
      0%{
        opacity: 0;
        fill: none;
        stroke-dashoffset:2000; 
        stroke: #3a58f9;
      }

      25%{
        opacity: 10;
        fill: none;
        stroke-dashoffset:2000; 
      }

      100%{
        stroke: white;
        fill: none;
      }
}

@keyframes animatee {
      0%{
            opacity: 0;
            fill: none;
            stroke-dashoffset:2000; 
      }

      30%{
            opacity: 10;
            fill: none;
            stroke-dashoffset:2000; 
      }

      100%{
            opacity: 10;
            fill: rgba(58,123,213,0);
      }

}


.error {
  width: 100%; 
  margin: 0px; 
}

.error p{
  text-align: center;
  color: #3a58f9; 
  padding: 0;
  margin: 0
}


::-webkit-scrollbar { 
    display: none; 
}

::-moz-selection {
  background: #000;
  color: #fff; }

::selection {
  background: #000;
  color: #fff; }

.border{
  display: block;
  margin: 10px 0 10px;
  width: 60px;
  height: 4px;
  background: #fff;
  text-align: left;
  border-radius: 30px;
}

.border-blue{
  display: block;
  margin: 0px 200px 30px;
  width: 90px;
  height: 4px;
  background: #3a58f9;
  text-align: center;
  border-radius: 30px;
}


.center_border{
  display: block;
  margin:auto;
  width: 60px;
  height: 4px;
  border: none;
  border-radius: 30px;
  margin-top: 10px;
}


h5{
  color: #fff;
  font-weight: 500;
  font-size: 15px;
  padding: 0 110px 0 0;
  font-family: poppins;
  letter-spacing: 1px;
  text-transform: uppercase;
  text-align: left;
}

 h6{
  color: #fff;
  font-weight: 600;
  font-size: 14px;
  font-family: poppins;
  text-align: left;
  margin-bottom: 10px;
}

 p{
  color: #eee;
  font-weight: 400;
  font-size: 12px;
  padding: 0 30px 0 0;
  margin-top: 0;
  margin-bottom: 10px;
  font-family: montserrat;
  letter-spacing: 2px;
  text-align: left;

}

button {
  background-color: transparent;
  padding: 0;
  border: 0;
  outline: 0;
  cursor: pointer;
}

button span{
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.3s;
}

button span:after {
  content: '\203A';
  position: absolute;
  opacity: 0;
  top: -1.5px;
  right: -20px;
  transition: 0.3s;
}

button:hover span {
  padding-right: 15px;
}

button:hover span:after {
  opacity: 1;
  right: 0;
}

button:focus{
  outline: none
}




form{
  margin-top: 50px;
  text-align: center;
}

.form-group{
  margin-top: 8px;
}

input {
  background-color: transparent;
  text-align: center;
  padding: 12px 15px;
  border: 2px solid #3a58f9;
  font-size: 14px;
  color: #3a58f9;
  font-family: poppins;
}

[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}

textarea{
      background: transparent;
      padding-top: 5px;
      margin: 3px 0 0;
      border: 2px solid #3a58f9;
      color: #3a58f9;
      text-align: center;
}

input::placeholder,
textarea::placeholder {
    font-family: poppins;
    font-weight: 300;
    font-size: 14px;
    color: #3a58f9;

}

.ness{
      width: 176px;
      margin: 2px;
}

.full{
      width: 360px;
}

.btn-warning{
    margin-top: 10px;
    margin-left: 0px;
    border-radius: 0px;
    background: #3a58f9;
    border: none;
    color: #fff; 
    padding: 0;
    height: 45px;
    width: 360px;
    font-size: 14px;
    font-weight: bold;
    letter-spacing: 2px;
}

.btn-warning:hover{
      
    background: transparent;
    border: 2px solid #3a58f9;
    color: #3a58f9;
}



/**
 * Bounce to the left side
 */
@-webkit-keyframes bounceLeft {
  0% {
    -webkit-transform: translate3d(100%, -50%, 0);
            transform: translate3d(100%, -50%, 0);
  }
  50% {
    -webkit-transform: translate3d(-30px, -50%, 0);
            transform: translate3d(-30px, -50%, 0);
  }
  100% {
    -webkit-transform: translate3d(0, -50%, 0);
            transform: translate3d(0, -50%, 0);
  }
}
@keyframes bounceLeft {
  0% {
    -webkit-transform: translate3d(100%, -50%, 0);
            transform: translate3d(100%, -50%, 0);
  }
  50% {
    -webkit-transform: translate3d(-30px, -50%, 0);
            transform: translate3d(-30px, -50%, 0);
  }
  100% {
    -webkit-transform: translate3d(0, -50%, 0);
            transform: translate3d(0, -50%, 0);
  }
}
/**
 * Bounce to the left side
 */
@-webkit-keyframes bounceRight {
  0% {
    -webkit-transform: translate3d(0, -50%, 0);
            transform: translate3d(0, -50%, 0);
  }
  50% {
    -webkit-transform: translate3d(calc(100% + 30px), -50%, 0);
            transform: translate3d(calc(100% + 30px), -50%, 0);
  }
  100% {
    -webkit-transform: translate3d(100%, -50%, 0);
            transform: translate3d(100%, -50%, 0);
  }
}
@keyframes bounceRight {
  0% {
    -webkit-transform: translate3d(0, -50%, 0);
            transform: translate3d(0, -50%, 0);
  }
  50% {
    -webkit-transform: translate3d(calc(100% + 30px), -50%, 0);
            transform: translate3d(calc(100% + 30px), -50%, 0);
  }
  100% {
    -webkit-transform: translate3d(100%, -50%, 0);
            transform: translate3d(100%, -50%, 0);
  }
}
/**
 * Show Sign Up form
 */
@-webkit-keyframes showSignUp {
  100% {
    opacity: 1;
    visibility: visible;
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
  }
}
@keyframes showSignUp {
  100% {
    opacity: 1;
    visibility: visible;
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
  }
}
/**
 * Page background
 */
.user {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  width: 100%;
  height: 95vh;
  padding-top: 50px;
}
.user_options-container {
  position: relative;
  width: 80%;
}
.user_options-text {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 100%;
  background-color: rgba(255, 255, 255, 0.2);
  border: 2px solid #fff;
  border-radius: 3px;
}

/**
 * Registered and Unregistered user box and text
 */
.user_options-registered,
.user_options-unregistered {
  width: 50%;
  padding: 25px 100px 10px;
  color: #fff;
  font-weight: 300;
}

.user_options-registered{
  padding: 25px 10px;
}

.user_registered-title,
.user_unregistered-title {
  margin-bottom: 0px;
  font-size: 1.66rem;
  line-height: 1em;
}

.user_unregistered-text,
.user_registered-text {
  font-size: 0.83rem;
  line-height: 1.4em;
}

.user_registered-login,
.user_unregistered-signup {
  border: 2px solid #fff;
  padding: 10px 30px;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  line-height: 1.4em;
  font-family: poppins;
  font-size: 16px;
  font-weight: 600;
  letter-spacing: 2px;
  -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
  transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
  margin-bottom: 0;
}
.user_registered-login:hover,
.user_unregistered-signup:hover {
  border: none;
  color: #3a58f9;
  background-color: #fff;
}



.social ul{
  padding: 0;
  margin: 0;
  margin-bottom: 50px;
}

.social ul li {
    display: inline-block;
    list-style: none;
}

.social i  {
      font-size: 20px;
      text-align: left;
      padding: 4px;
      margin: 0;
      color: #fff;
      transition: all 0.3s;
}

.social i:hover {
      color: #3a58f9;
}

/**
 * Login and signup forms
 */
.user_options-forms {
  position: absolute;
  top: 50%;
  left: 100px;
  width: calc(43% - 35px);
  min-height: 620px;
  background-color: #fff;
  border-radius: 1em 14em ;
  -webkit-box-shadow: 2px 0 15px rgba(0, 0, 0, 0.25);
          box-shadow: 2px 0 15px rgba(0, 0, 0, 0.25);
  overflow: hidden;
  -webkit-transform: translate3d(100%, -50%, 0);
          transform: translate3d(100%, -50%, 0);
  -webkit-transition: -webkit-transform 0.4s ease-in-out;
  transition: -webkit-transform 0.4s ease-in-out;
  transition: transform 0.4s ease-in-out;
  transition: transform 0.4s ease-in-out, -webkit-transform 0.4s ease-in-out;
}
.user_options-forms .user_forms-login {
  -webkit-transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out;
  transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out;
}
.user_options-forms .forms_title {
  margin-top: -20px;
  margin-bottom: 10px;
  font-size: 28px;
  font-family: poppins;
  text-align: center;
  font-weight: 400;
  text-transform: uppercase;
  color: #3a58f9;
  letter-spacing: 2px;
}
.user_options-forms .forms_field:not(:last-of-type) {
  margin-bottom: 20px;
}
.user_options-forms .forms_field-input {
  width: 100%;
  border-bottom: 1px solid #ccc;
  padding: 6px 20px 6px 0;
  font-family: "Montserrat", sans-serif;
  font-size: 1rem;
  font-weight: 300;
  color: gray;
  letter-spacing: 0.1rem;
  -webkit-transition: border-color 0.2s ease-in-out;
  transition: border-color 0.2s ease-in-out;
}
.user_options-forms .forms_field-input:focus {
  border-color: gray;
}
.user_options-forms .forms_buttons {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  margin-top: 35px;
}
.user_options-forms .forms_buttons-forgot {
  font-family: "Montserrat", sans-serif;
  letter-spacing: 0.1rem;
  color: #ccc;
  text-decoration: underline;
  -webkit-transition: color 0.2s ease-in-out;
  transition: color 0.2s ease-in-out;
}
.user_options-forms .forms_buttons-forgot:hover {
  color: #b3b3b3;
}
.user_options-forms .forms_buttons-action {
  background-color: #e8716d;
  border-radius: 3px;
  padding: 10px 35px;
  font-size: 1rem;
  font-family: "Montserrat", sans-serif;
  font-weight: 300;
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 0.1rem;
  -webkit-transition: background-color 0.2s ease-in-out;
  transition: background-color 0.2s ease-in-out;
}
.user_options-forms .forms_buttons-action:hover {
  background-color: #e14641;
}
.user_options-forms .user_forms-signup,
.user_options-forms .user_forms-login {
  position: absolute;
  top: 70px;
  left: 40px;
  width: calc(100% - 80px);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out, -webkit-transform 0.5s ease-in-out;
  transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out, -webkit-transform 0.5s ease-in-out;
  transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out, transform 0.5s ease-in-out;
  transition: opacity 0.4s ease-in-out, visibility 0.4s ease-in-out, transform 0.5s ease-in-out, -webkit-transform 0.5s ease-in-out;
}
.user_options-forms .user_forms-signup {
  -webkit-transform: translate3d(120px, 0, 0);
          transform: translate3d(120px, 0, 0);
}
.user_options-forms .user_forms-signup .forms_buttons {
  -webkit-box-pack: end;
      -ms-flex-pack: end;
          justify-content: flex-end;
}
.user_options-forms .user_forms-login {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  opacity: 1;
  visibility: visible;
}

/**
 * Triggers
 */
.user_options-forms.bounceLeft {
  -webkit-animation: bounceLeft 1s forwards;
          animation: bounceLeft 1s forwards;
}
.user_options-forms.bounceLeft .user_forms-signup {
  -webkit-animation: showSignUp 1s forwards;
          animation: showSignUp 1s forwards;
}
.user_options-forms.bounceLeft .user_forms-login {
  opacity: 0;
  visibility: hidden;
  -webkit-transform: translate3d(-120px, 0, 0);
          transform: translate3d(-120px, 0, 0);
}
.user_options-forms.bounceRight {
  -webkit-animation: bounceRight 1s forwards;
          animation: bounceRight 1s forwards;
}

/**
 * Responsive 990px
 */
@media screen and (max-width: 990px) {
  .user_options-forms {
    min-height: 350px;
  }
  .user_options-forms .forms_buttons {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
  }
  .user_options-forms .user_forms-login .forms_buttons-action {
    margin-top: 30px;
  }
  .user_options-forms .user_forms-signup,
  .user_options-forms .user_forms-login {
    top: 40px;
  }

  .user_options-registered,
  .user_options-unregistered {
    padding: 50px 45px;
  }
}

.home{
  text-align: center;
  margin-left: 47%;
  padding-bottom: 2px;
  border-bottom: 2px solid #fff;
  color: #fff; 
  font-size: 15px;
  font-weight: bold;
  letter-spacing: 2px;
}



</style>
</body>
</html>