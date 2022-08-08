<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PatientResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
         // 
       $data['id'] = $this->id;
       $data['name'] = $this->name;
       $data['email'] = $this->email;
       $data['cin'] = $this->cin;
       $data['mobile'] = $this->mobile;
       $data['password'] = $this->password;
       $data['created_at'] = $this->created_at->format('l jS \\of F Y ');
       
       return $data;
    }
}
