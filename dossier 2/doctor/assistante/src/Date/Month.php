<?php
class Month{

/***
 * 
 * 
 * @throws Exception
 */

    public function __construct(int $month, int $year){
if($month<1 || $month>12){

    throw new Exception (message'le $month non valide');
}
if($year<1970 ){

    throw new Exception (message"le $year non valide");
}
        
    }
}


?>