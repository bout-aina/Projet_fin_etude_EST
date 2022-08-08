<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--styles -->
<link rel="stylesheet" href="csss/jquery.fancybox.css">
	<link rel="stylesheet" href="csss/font-awesome.css">
	<link rel="stylesheet" href="csss/jquery.owl.carousel.css">
	<link rel="stylesheet" href="csss/main.css">
	<link rel="stylesheet" href="csss/animate.css">
	<!--styles -->
<!------ Include the above in your HEAD tag ---------->

<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
    </head>

<body>
<button class ="save-button" type="submit"   name="savedItems" value="savedItems"><a href="http://localhost/doctor/uploadFile/ajoutfile.php?id=<?= $_GET['id'];?>" > Ajouter un fichier</a></button>
</br>
<button class ="save-button" type="submit"   name="savedItems" value="savedItems"><a href="http://localhost/doctor/dossierMedical.php" >  tous les dossiers</a></button>

    <div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">
		        <thead>
		        <tr class="thead-dark">
		           
		            <th>Titre</th>
		            <th>Afficher</th>
                    <th>Supprimer</th>
		        </tr>
		    </thead>
		        <tbody>
		            
		          <?php include("affichsupp.php"); ?>
		            
		         
		        </tbody>
		    </table>
	</div>
	</div>
	
</body>
</html>