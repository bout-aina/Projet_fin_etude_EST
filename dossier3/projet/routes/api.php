<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/login1', 'PatientController@login');
Route::post('/register1', 'PatientController@register');
Route::post('create', 'PasswordResetController@create');
Route::get('find/{token}', 'PasswordResetController@find');  
Route::post('/reset', 'PasswordResetController@reset');

Route::middleware('auth:api')->group(function () {
    Route::get('/detail','PatientController@details');
    Route::get('/user','PatientController@user');
    Route::put('edituser/{id}','PatientController@edit');
    Route::get('/messages', 'MessageController@index');
   Route::post('/rendezvous', 'RendezvousController@store');
   Route::get('/countrdv/{dat}','RendezvousController@getdaterdv');
   
   Route::get('/file','FileController@index');
     
    
  
});

    

