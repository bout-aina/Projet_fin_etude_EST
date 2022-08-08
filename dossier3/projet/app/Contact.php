<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    protected $fillable = [
        'fullname', 'email', 'telephone','date','message','save','likes',
    ];
}
