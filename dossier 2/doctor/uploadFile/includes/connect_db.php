<?php
try{
$db= new PDO('mysql:host=localhost;dbname=tuto','root','oumaima');
}catch(PDOException $e)
{
    die('Erreur :'.$e->getMessage());
}


?>