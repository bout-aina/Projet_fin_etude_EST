<?php
require 'connexion.php';
$id=$_GET['id'];
 $req = $dbh->query("SELECT * FROM files where user_id='$id'");
 while($data=$req->fetch())
 {
    $id=$data['id'];
        
           echo ' 
		            
           <tr>
              
               <td style="max-width:300px">
                   <h6>'.$data['name'].'</h6>
                  
               </td>
          
               <td>
               <a href="'.$data['file_url'].'" class="btn btn-warning" style="background-color:#66d8f5;"><i class="fas fa-edit"></i></a> 
                  
               </td>
               <td>
               <form action="#" method="POST" >
               <button    type="submit" name="delete'.$id.'" value="" >            <i class="fas fa-trash"></i>
               </button>
                         </form>
              
           </tr>
           ';
           if (isset($_POST["delete$id"])){
            // <i class="fas fa-trash"></i>
            $req=$dbh->prepare("DELETE FROM files WHERE id='".$id."'");
        
            $req->execute();
          
      echo(" 
      <SCRIPT Language='JavaScript'>
      var txt;
      var r = confirm('suupression avec succes!');
      if (r == true) {
        
        javascript:location.reload(true);
      } else {
        javascript:location.reload(true);
      }
      
</SCRIPT>") ;
            
            }


 }
 echo '';
 
 ?>