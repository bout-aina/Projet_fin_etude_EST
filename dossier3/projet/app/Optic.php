<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Optic extends Model
{
       protected $fillable = [
        'leftSphere', 'leftCylindre','leftAxe','leftAdd','rightSphere',
        'rightCylindre','rightAxe','rightAdd'
    ];
}
