<?php
include('fpdf.php');


 include("connexion.php");
$id=$_GET['id'];

	$req="SELECT * FROM optics where idRDV='$id' order by idOptic DESC  limit 1";
	$sth = $dbh->query($req);
	$res = $sth->fetch(PDO::FETCH_ASSOC); 
	
	
         $ls=$res['leftSphere'];
         $lc=$res['leftCylindre'];
         $la=$res['leftAxe'];
         $ld=$res['leftAdd'];
         $rs=$res['rightSphere'];
         $rc=$res['rightCylindre'];
         $ra=$res['rightAxe'];
         $rd=$res['rightAdd'];

           
		 require("rendezVous.php");


$rdvs=new RendezVous();
$user=$rdvs->finduser($_GET['id'] );
$name=$user['name'];
$cin=$user['cin'];

$pdf = new FPDF( 'P', 'mm', array(190,150) );
$pdf->AddPage();
 $pdf->Rect(0,0,150,37,'D');
$pdf->Image('logo.png',55,5,35,25);
$pdf->SetFont('Times','',11);
$pdf->Text(5,12,'-Dr: Adil BENALI ');
$pdf->Text(5,18,'-Ophtamologie');
 $pdf->Text(5,24,'-Tel:+212 66144415');
 $pdf->Text(5,30,'-Email:ophtalmo@gmail.com');
 $pdf->Text(100,12,'-Ophtalmo Express');
 $pdf->Text(100,18,'-Adresse:12 Jabr Bnou Hayane');
 $pdf->Text(100,24,'Agadir Maroc 20000');
 $pdf->Text(100,30,'-Tel:+212 522 485032');
 $pdf->SetFont('Times','B',16);
 $pdf->SetTextColor(26,97,159);
$pdf->Text(48,50,'Ordonnance medicale');
$pdf->SetFont('Times','',12);
 $pdf->SetTextColor(0,0,0);
// hna ghatjibi date dial nhar m3a infos dial patients
$date=	date("d-m-Y ",strtotime('+16 hours'));
$pdf->Text(108,50,'Agadir, le '.$date.'');

 $pdf->Text(5,70,'-Nom et prenom : '.$name.'');
 $pdf->Text(5,76,'-Cin : '.$cin.'');
 //hna salaw infos
 $pdf->Rect(10,95,130,45,'D');
 $pdf->line(20,95,20,140);
 $pdf->line(50,95,50,140);
 $pdf->line(80,95,80,140);
 $pdf->line(110,95,110,140);
 $pdf->line(10,105,140,105);
 $pdf->line(10,122,140,122);
 $pdf->SetFont('Times','B',12);
 $pdf->SetTextColor(163,168,172);
 $pdf->Text(12,115,'OD');
 $pdf->Text(12,132,'OG');
 $pdf->Text(25,102,'SPHERE');
 $pdf->Text(53,102,'CYLINDRE');
 $pdf->Text(90,102,'AXE');
 $pdf->Text(120,102,'ADD');
//for database now
 $pdf->SetFont('Times','B',12);
 $pdf->SetTextColor(0,0,0);
 //you can replace all this text with ur variables in database babe
 $pdf->Text(25,115,$rs);
 $pdf->Text(25,132,$ls);
 $pdf->Text(53,115,$rc);
 $pdf->Text(53,132,$lc);
 $pdf->Text(90,115,$ra);
$pdf->Text(90,132,$la);
$pdf->Text(120,115,$rd);
 $pdf->Text(120,132,$ld);
// //end database
$pdf->SetFont('Times','',10);
 $pdf->SetTextColor(0,0,0);
 $pdf->Text(10,174,'12 Jabr Bnou Hayane Agadir Maroc 20000-TEL:+212 66144415 -FAX:+212 522 485032');
$pdf->Text(22,180,'WEB : www.ophtalmoexpress.com -Email : ophtalmo@gmail.com');
 $pdf->Text(15,186,'POUR PRENDRE UN RENDEZ-VOUS : ophtalmo express (Android,IOS)');

$pdf->Output();



?>