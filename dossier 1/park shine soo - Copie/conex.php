<?php
$user = 'root';
$pass = '';
$dsn = 'paty12';
try {
$con=@mysqli_connect("localhost",$user,$pass,$dsn);
}
catch (exception $e) {
print "Erreur ! : " . $e->getMessage() ."<br/>";
die();
}
?>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               