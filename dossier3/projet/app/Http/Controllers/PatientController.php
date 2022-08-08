<?php

 
namespace App\Http\Controllers;
 
use App\User;
use JWTAuth;
use Illuminate\Http\Request;
use App\Http\Resources\PatientResource;

class PatientController extends Controller
{

    /**
     * Handles Registration Request
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        
        $request->validate( [
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'cin' => 'required|min:6|unique:users',
            'mobile' => 'required|min:10',
        ]);

      
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'cin' => $request->cin,
            'mobile' => $request->mobile,
        ]);

        
        $token = $user->createToken('MySecret')->accessToken;
 
        return response()->json(['token' => $token], 200);
        
    }
    
    
 
    /**
     * Handles Login Request
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];
 
        if (auth()->attempt($credentials)) {
            $token = auth()->user()->createToken('MySecret')->accessToken;
            return response()->json(['token' => $token], 200);
        } else {
            return response()->json(['error' => 'UnAuthorised'], 401);
        }
       
    }
   
      
    public function logout()
    {
       auth()->user()->tokens->each(function($token)
    {
        $token->delete();
    });
    return response()->json('logout succesfully',200);
    }
 
    /**
     * Returns Authenticated User Details
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function details()
    {
       return response()->json(['user' => auth()->user()], 200);
    }
    //////////////////
    public function user()
    {
        
        //return auth()->user(); 
         return new PatientResource(auth()->user());
    }

    public function edit(Request $request, $id)
    {     
        
        $user = auth()->user(
      )->find($id);
 
        if (!$user) {
            return response()->json('sorry', 400);
        }
         
        $request->validate( [
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users',
            'cin' => 'required|min:4|unique:users',
            'mobile' => 'required|min:10',
        ]);

        $updated = $user->fill($request->all())->save();
 
        if ($updated)
            return response()->json('done'
            //     [
            //     'success' => true
            // ]
        );
        else
            return response()->json('sorry'
            //     [
            //     'success' => false,
            //     'message' => 'Product could not be updated'
            // ]
            , 500);
    }

    /* public function edit(Request $request,$id)
    {
        
           $user =  User::find($id);
           $user->name = $request['name'];
           $user->email = $request['email'];
           $user->mobile = $request['mobile'];
           $user->cin = $request['cin'];
          
           $user->save();


        return new PatientResource(User::find($id));
    } */
    
}




    /////////////////////////////////////////////////////

    