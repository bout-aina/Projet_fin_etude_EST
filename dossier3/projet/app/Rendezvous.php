<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rendezvous extends Model
{
    protected $fillable = [
        'description','start','end'
    ];
}
