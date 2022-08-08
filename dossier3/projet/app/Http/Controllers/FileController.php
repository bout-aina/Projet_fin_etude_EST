<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\File;
class FileController extends Controller
{
    
    public function index()
    {
        $files = auth()->user()->files;
 
        return response()->json(  $files );
    }
}
