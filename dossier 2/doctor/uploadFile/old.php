<?php
//var_dump($_FILES);
require 'includes/connect_db.php';
if(!empty($_FILES))
{
    $file_name=$_FILES['fichier']['name'];
    $file_extension=strrchr($file_name,".");
    $file_tmp_name=$_FILES['fichier']['tmp_name'];
    $file_dest='files/'.$file_name;
    
    $extensions_autorisees = array('.pdf','.PDF');
    if(in_array($file_extension,$extensions_autorisees))
   {
          if(move_uploaded_file($file_tmp_name,$file_dest))
          {
              $req=$db->prepare('INSERT INTO files(name,file_url) values (?,?)');
              $req->execute(array($file_name,$file_dest));
             echo 'fichier envoyé avec succés';
          }else {
              echo 'une erreur est survenue loers de l envoid du fichiers';
          }
   }   else{
       echo 'seuls les fchoers PDF sont autorisées';
   } 
}

?>


<!doctype html>
<html>
<head>
<title>Upload de fchier</title>
<meta charset=="UTF-8" />
</head>
<body>
<h1>upload un fichier pdf<h1>
<form method="POST" enctype="multipart/form-data">
<input type="file" name="fichier" />
<input type="submit" value="envoyer" />
</form>
<h1> fichiers pdf enregistrées</h1>
<?php
$req = $db->query('SELECT name,file_url FROM files');
while($data=$req->fetch())
{
    echo $data['name'].' : '.'<a href="'.$data['file_url'].'"> telechergé'.$data['name'].'</a><br>';
}
?>
</body>
</html>