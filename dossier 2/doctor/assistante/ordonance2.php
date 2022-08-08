<?php
require('fpdf.php');
$pdf = new FPDF( 'P', 'mm', array(220,150) );
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
//$pdf->Text(48,50,'Ordonnance medicale');
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(0,0,0);
// hna again date dial lyoma m3a infos
$pdf->Text(90,50,'Agadir, le 15-01-2012');
$pdf->Text(5,70,'-Nom et prenom : rhezzoune oumaima');
$pdf->Text(5,76,'-Cin : JM85147');
$pdf->SetFont('Times','B',14);
$pdf->SetTextColor(186,208,228);
$pdf->Text(60,90,'Prescription');
$pdf->SetFont('Times','',11);
$pdf->SetTextColor(0,0,0);
// hna dalchi li ktb medcin
$pdf->Text(20,96,'-med 1 : dolipran');

$pdf->SetFont('Times','',10);
$pdf->SetTextColor(0,0,0);
$pdf->Text(10,204,'12 Jabr Bnou Hayane Agadir Maroc 20000-TEL:+212 66144415 -FAX:+212 522 485032');
$pdf->Text(22,210,'WEB : www.ophtalmoexpress.com -Email : ophtalmo@gmail.com');
$pdf->Text(15,216,'POUR PRENDRE UN RENDEZ-VOUS : ophtalmo express (Android,IOS)');

$pdf->Output();



?>