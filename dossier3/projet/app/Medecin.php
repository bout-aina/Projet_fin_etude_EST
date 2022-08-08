<?php

namespace App;

use App\Message;

use Illuminate\Foundation\Auth\Medecin as Authenticatable;

use Illuminate\Notifications\Notifiable;


class Medecin extends Authenticatable
{
    use  Notifiable;


    protected $fillable = [
        'name', 'email', 'password',
    ];


   
}
