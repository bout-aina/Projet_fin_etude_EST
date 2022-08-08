<?php
 require('connexion.php');
 /******************************** la table contact*************************8*/ 
 
 $dateM=date("Y-m");
 $datemm=date('Y');
 $d=$datemm.'-01';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $mois= $result1->fetchColumn(); 
 // le nombre des message ce jour
 $d=$datemm.'-02';

 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m2= $result1->fetchColumn(); 
 $d=$datemm.'-03';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m3= $result1->fetchColumn(); 
  $d=$datemm.'-04';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m4= $result1->fetchColumn();
   $d=$datemm.'-05';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m5= $result1->fetchColumn(); 
  $d=$datemm.'-06';

 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m6= $result1->fetchColumn(); 

 $d=$datemm.'-07';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m7= $result1->fetchColumn(); 
 $d=$datemm.'-08';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m8= $result1->fetchColumn(); 
 $d=$datemm.'-09';

 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m9= $result1->fetchColumn(); 
 $d=$datemm.'-10';

 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m10= $result1->fetchColumn();  $d=$datemm.'-11';

 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m11= $result1->fetchColumn(); 
 $d=$datemm.'-12';
 
 $sql1="SELECT count(*) FROM `rendezvouses` where   SUBSTR(start, 1, 7) like '$d'";
 $result1 = $dbh->prepare($sql1); 
 $result1->execute(); 
 $m12= $result1->fetchColumn(); 
$dataPoints = array(

    array("label"=> "janvier", "y"=> $mois),
    array("label"=> "février", "y"=>$m2),
    array("label"=> "mars", "y"=> $m3),
    array("label"=> "avril", "y"=> $m4),
    array("label"=> "mai ", "y"=> $m5),
    array("label"=> "juin", "y"=> $m6),
    array("label"=> "juillet", "y"=> $m7),
    array("label"=> "août", "y"=> $m8),
    array("label"=> "septembre", "y"=> $m9),
    array("label"=> "octobre", "y"=> $m10),
    array("label"=> "novembre", "y"=> $m11),
    array("label"=> "décembre", "y"=> $m12)
);
    
?>
<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {
 
var chart = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    theme: "light2", // "light1", "light2", "dark1", "dark2"
    title: {
        text: "                                        "
    },
    axisY: {
        title: "Patients",
        includeZero: false
    },
    data: [{
        type: "column",
        dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
    }]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>