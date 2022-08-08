<?php
$user = 'root';
$pass = '';
$dsn = 'mysql:host=127.0.0.1;dbname=paty12';
try {
$dbh = new PDO($dsn, $user, $pass);

}
catch (PDOException $e) {
print "Erreur ! : " . $e->getMessage() ."<br/>";
die();
}
?>