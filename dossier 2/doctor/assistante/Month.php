<?php
class Month{
    public   $days=['lundi','mardi','mercredi','jeudi','vendredi','samedi','dimanche'];
    private $months=['janvier','février','mars','avril','mai','juin','juillet','août','septembre','octobre','novembre','décembre'];
public $month;
public  $year;


/***
 * 
 * 
 * @throws Exception
 */

    public function __construct( $month=null, $year=null){
        if ($month===null){
$this->month= intval (date('m'));
        } 
        else $this->month=$month;
        if($year===null){
            $this->year=intval (date('Y'));

        }
        else 
        $this->year=$year;



        
    }
    public function toString(): String{

 return ($this->months[$this->month-1].' '.$this->year);

    }
  
  
    public function getStartingDay ():\DateTime{
        return  new \DateTime ("{$this->year}-{$this->month}-01");
    }
       public function getWeeks() :int{
        $start=$this->getStartingDay();
$end =( clone $start)->modify('+1 month -1 day');
$weeks=intval($end->format('W'))-intval($start->format('W'))+1;
if ($weeks<0){
    $weeks=intval($end->format('W'));
}
  return $weeks;
    }
   public function withinMonth (\DateTime $date ): bool{
        return $this->getStartingDay()->format('Y-m')=== $date->format('Y-m');
        }
 
         public function nextMonth(): Month{
            $month=$this->month+1;
            $year=$this->year;
            if ($month>12){
                $month=1;
                $year+=1;
            }
            return new Month($month,$year);



        }
        public function previousMonth(): Month{
            $month=$this->month-1;
            $year=$this->year;
            if ($month<1){
                $month=12;
                $year-=1;
            }
            return new Month($month,$year);


        } 
    
    }



?>