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
$pdf->Text(48,50,'Ordonnance medicale');
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(0,0,0);
$pdf->Text(90,60,'Fait a:Agadir  /le:15-01-2012');
$pdf->Text(5,70,'-Nom et prenom: rhezzoune oumaima');
$pdf->Text(5,76,'-Cin:JM85147');
$pdf->Rect(80,66,70,60,'D');
$pdf->SetFont('Times','U',12);
$pdf->SetTextColor(163,168,172);
$pdf->Text(85,75,'Vision du loin:');
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(0,0,0);
$pdf->Text(85,81,'-OD:+5.0(-1.00)20');
$pdf->Text(85,87,'-OG:+5.0(-1.00)50');
$pdf->SetFont('Times','U',12);
$pdf->SetTextColor(163,168,172);
$pdf->Text(85,95,'Vision de pres:');
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(0,0,0);
$pdf->Text(85,101,'-ADD:+2.00');
$pdf->SetFont('Times','B',12);
$pdf->SetTextColor(163,168,172);
$pdf->Text(5,140,'-Medicaments');
$pdf->SetFont('Times','',12);
$pdf->SetTextColor(0,0,0);
$pdf->Text(5,146,'-premier medicament');
$pdf->Text(5,152,'-premier medicament');
$pdf->Text(5,158,'-premier medicament');
$pdf->Text(5,164,'-premier medicament');
$pdf->Text(5,170,'-premier medicament');
$pdf->SetFont('Times','B',13);
$pdf->SetTextColor(186,208,228);
$pdf->Text(5,210,'Merci pour votre comfiance');
$pdf->SetFont('Times','U',12);
$pdf->SetTextColor(163,168,172);
$pdf->Text(110,190,'Signature');
$pdf->Output();




?>