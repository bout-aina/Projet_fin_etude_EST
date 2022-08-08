<?php
require('fpdf.php');

echo ($_POST['name']);
echo $_POST['cin'];


$use=date("Y-m-d");

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
        $stmt = $dbh->query("SELECT * FROM `tickets`  LIMIT  1");
 $user = $stmt->fetch(); 
$d=$user['date'];
var_dump($d);
$use=date("Y-m-d");
var_dump($use);
 $n=$user['id'];
 
 if($d==$use){
     $n++;
     $sql = "UPDATE tickets SET id=$n";
     $stm= $dbh->prepare($sql);
     $stm->execute([$n]); 
     }
 else{
$n=1;
$d=date("Y-m-d");
$sql = "UPDATE tickets SET id=$n";
$stm= $dbh->prepare($sql);
$stm->execute([$n]); 

$sql1 = "UPDATE tickets SET date='$d'";
$stm1= $dbh->prepare($sql1);
$stm1->execute([$d]); 
    
 }
 echo$n;
 


 $pdf = new FPDF( 'L', 'mm', array(90,170) );
$pdf->AddPage();
$pdf->Rect(0,0,30,90,'F');
$pdf->SetFillColor(41, 0, 0);
$pdf->Image('logo.png',126,6,40,30);
$pdf->SetFont('Times','B',16);
$date=	date("Y-m-d H:i:s",strtotime('+16 hours'));
$pdf->Text(38,15,''.$date.'');
$pdf->SetFont('Arial','',13);
 $pdf->Text(40,44,'- Nom et prenom : '.$_POST['name'].'');
 $pdf->Text(40,51,'- CIN : '.$_POST['cin'].'');
$pdf->Text(40,58,'- Numero : '.$n.'');
$pdf->Image('img/spp.jpg',60,60,60,40);
$pdf->Output();
 
?>