

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="UTF-8"></script>
<!-- Fonte -->
<link href="https://fonts.googleapis.com/css?family=Lato|Merriweather+Sans|Montserrat|Noto+Sans|Raleway&display=swap" rel="stylesheet">

<body>
    <form action="#" method="POST" class="login-form">
        <h1>Modifier Mot De Passe</h1>

        <div class="txtb">
            <input type="email" name="email">
            <span data-placeholder="Adresse email"></span>
        </div>

        <div class="txtb">
            <input type="password" name="password">
            <span data-placeholder="Nouveau Mot de passe"></span>
        </div>
        

        <input type="submit" name="pass" class="logbtn" value="Modifier">

        

    </form> 

    <script type="text/javascript">
        $(".txtb input").on("focus", function(){
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur", function(){
            $(this).addClass("focus");
            if($(this).val() == "")
            $(this).removeClass("focus");
        });        
    </script>

</body>
<style>
  * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        font-family: 'Montserrat', sans-serif;
        box-sizing: border-box;
    }

    body {
        min-height: 100vh;
        background-image: linear-gradient(120deg, #3498db, #8e44ad);
    }

    .login-form {
        width: 360px;
        background: #f1f1f1;
        height: 580px;
        padding: 80px 40px;
        border-radius: 10px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }

    .login-form h1 {
        text-align: center;
        margin-bottom: 60px;
    }

    .txtb {
        border-bottom: 2px solid #adadad;
        position: relative;
        margin: 30px 0;
    }

    .txtb input {
        font-size: 15px;
        color: #333;
        border: none;
        width: 100%;
        outline: none;
        background: none;
        padding: 0 5px;
        height: 40px;
    }

    .txtb span::before{
        content: attr(data-placeholder);
        position: absolute;
        top: 50%;
        left: 5px;
        color: #adadad;
        transform: translateY(-50%);
        z-index: -1;
        transition: .5s;
    }

    .txtb span::after{
        content: '';
        position: absolute;
        width: 0%;
        height: 2px;
        left: 0;
        bottom: -2px;
        background: linear-gradient(120deg, #3498db, #8e44ad);
        transition: .5s;
    }

    .focus + span::before{
        top: -5px;
    }
    .focus + span::after{
        width: 100%;
    }

    .logbtn{
        display: block;
        width: 100%;
        height: 40px;
        border: none;
        background: linear-gradient(120deg,#3498db, #8e44ad, #3498db );
        background-size: 200%;
        color: #fff;
        outline: none;
        cursor: pointer;
        transition: .5s;
    }

    .logbtn:hover{
        background-position: right;
    }

    .bottom-text{
        margin-top: 50px;
        text-align: center;
        font-size: 13px;
    }
    
    .bottom-text a:hover{
        text-decoration: none;
    }
</style>
<?php
if(isset($_POST['pass']))
{
    if(!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['password2']))
    {
           if($_POST['password'] == $_POST['password2'])
           {
           
           }else{
            echo "<div class='alert alert-danger'>
            les deux mot de passe doit etre identiques
          </div>";
           }

        }else {
        echo "<div class='alert alert-danger'>
        veuillez remplir tous les champs
      </div>";
    }
}


?>