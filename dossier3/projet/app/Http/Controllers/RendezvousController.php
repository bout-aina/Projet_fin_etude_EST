<?php

namespace App\Http\Controllers;

use App\Rendezvous;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RendezvousController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    
    public function store(Request $request)
    {
        $this->validate($request, [
            'description' => 'required|min:10',
           
        ]);
 
        $rdv = new Rendezvous();
        $rdv->description = $request->description;
        $rdv->start = $request->start;
        $rdv->end = $request->end;
       
        if (auth()->user()->rendezvouses()->save($rdv))
            return response()->json('done'
            //     [
            //     'success' => true,
            //     'data' => $product->toArray()
            // ]
        );
        else
            return response()->json('sorry'
            //     [
            //     'success' => false,
            //     'message' => 'Product could not be added'
            // ]
            , 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Rendezvous  $rendezvous
     * @return \Illuminate\Http\Response
     */
    public function getdaterdv(Request $request,$dat)
    {
         $users = DB::table('rendezvouses')
         ->where("start","=",$dat)
                     ->count();
                     
                
                     
        if($users<=10)
        {
            return response()->json('done'
            //     [
            //     'success' => true,
            //     'data' => $product->toArray()
            // ]
        );

        }
        else if($users>10)
        { return response()->json('sorry'
        //     [
        //     'success' => true,
        //     'data' => $product->toArray()
        // ]
    );

        }
       
                
    
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Rendezvous  $rendezvous
     * @return \Illuminate\Http\Response
     */
    public function edit(Rendezvous $rendezvous)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Rendezvous  $rendezvous
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rendezvous $rendezvous)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Rendezvous  $rendezvous
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rendezvous $rendezvous)
    {
        //
    }
}
