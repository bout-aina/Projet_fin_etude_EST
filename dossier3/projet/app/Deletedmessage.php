<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deletedmessage extends Model
{
    
    protected $fillable = [
        'fullname', 'email', 'tel','message',
    ];

}
