<?php
require('connexion.php');
class RendezVous {


public function getRDV(\DateTime $start,\DateTime $end):array{
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
    $dateS=$start->format('Y-m-d');

    $dateE=$end->format('Y-m-d');
$sql="SELECT * FROM `rendezvouses` where SUBSTR(start, 1, 10) between'{$dateS}' and '{$dateE}'";
$sth= $dbh->query($sql);
    $res = $sth->fetchAll(PDO::FETCH_ASSOC); 
  
    return $res; 
    
	

}


public function getRDVbyDay(\DateTime $start,\DateTime $end):array{
   $rdvs=$this->getRDV($start,$end);
   $days=[];
foreach($rdvs as $rdv){
    $date=substr($rdv['start'], 0,10);
    
//    var_dump(substr('2020-04-11 12:00:00.000Z', 0, 10)); 
   
    // $rdv['start'];
    if(!isset($days[$date])){
        $days[$date]=[$rdv];
    } else {
        $days[$date][]=$rdv;
    }
 }
// var_dump($days);

return $days;


 
}
public function find(int $id ): array{
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
        $stmt = $dbh->query("SELECT * FROM `rendezvouses` where idRendezVous='$id' LIMIT  1");
 $user = $stmt->fetch();return $user;
}
public function finduser(int $id ): array{
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

    
        $stm = $dbh->prepare("SELECT user_id  FROM `rendezvouses` WHERE idRendezVous='$id' limit 1");
$stm->execute([$id]); 
$user = $stm->fetch();

$idU= $user['user_id'];
         $stmt = $dbh->query("SELECT * FROM `users` where id='$idU' LIMIT  1");
         $userrdv = $stmt->fetch();return $userrdv;
}
}

?>