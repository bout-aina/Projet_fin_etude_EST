<?php
$user = 'root';
$pass = '';
$dsn = 'laravel';
try {
$con=@mysqli_connect("localhost",$user,$pass,$dsn);
}
catch (exception $e) {
print "Erreur ! : " . $e->getMessage() ."<br/>";
die();
}
?>