<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddAddressRequest;
use App\Models\Address;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AddressController extends Controller
{
    public function __construct(){
        $this->middleware(['auth']);
    }
    
    public function index(){
        return view('buyer.address',[
            'addresses' => auth()->user()->addresses
        ]);
    }

    public function store(AddAddressRequest $request)
    {
        $validated = $request->validated();
        try {
            auth()->user()->addresses()->create($validated);
        } catch (\Throwable $th) {
            return back()->with('failed', 'Ayayay!');
        }
        return back()->with('status', 'New Address Added');
    }

    public function update(Request $request, Address $address){

        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'location' => 'required',
            'phone' => 'required',
            'postal_code' => 'required'
        ]);

        //400 -> Bad Request
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $address->update([
            'full_name' => $request->full_name,
            'location' => $request->location,
            'phone' => $request->phone,
            'postal_code' => $request->postal_code,
        ]);

        return response()->json($address, 204);

    }

    public function setAsDefault(Address $address){

        if(!$address->ownedBy(auth()->user())){
            return response(null, 409);
        }

        try {

            DB::beginTransaction();

            auth()->user()->addresses()->update([
                'set_as_default' => false
            ]);

            $address->update([
                'set_as_default' => true
            ]);

            DB::commit();
            return back();

        } catch (\Throwable $th) {
            DB::rollback();
            return back();
        }

    }

    public function destroy(Address $address){

        if(!$address->ownedBy(auth()->user())){
            return response(null, 409);
        }

        $address->delete();
        return back();

    }
    
}
