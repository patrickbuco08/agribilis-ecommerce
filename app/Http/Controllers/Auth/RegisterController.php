<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\VendorRegisterRequest;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{

    public function __construct(){
        $this->middleware(['guest']);
    }

    public function index(){
        return view('buyer.auth.register');
    }

    public function store(RegisterRequest $request)
    {
        $validated = $request->safe();
        try {
            DB::beginTransaction();

            $user = User::create([
                'full_name' => $validated['full_name'],
                'email'     => $validated['email'],
                'password'  =>  Hash::make($validated['password']),
            ]);

            $user->role()->create([
                'role_id' => 3
            ]);
            DB::commit();
            auth()->attempt($request->only('email', 'password'), true);
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->with('error', 'Something went wrong');
        }
        return redirect()->route('home');
    }

    // vendor
    public function vendorIndex()
    {
        return view('vendor.auth.register');
    }

    public function vendorStore(VendorRegisterRequest $request)
    {
        $validated = $request->validated();
        $vendorInfo = $request->safe()->merge(['photo' => 'avatar1.jpg'])->only(['shop_name', 'description', 'location', 'phone', 'photo']);

        try {
            DB::beginTransaction();
            $vendor = User::create([
                'full_name' => $validated['full_name'],
                'email'     => $validated['email'],
                'password'  =>  Hash::make($validated['password']),
            ]);
            $vendor->info()->create($vendorInfo);
            $vendor->role()->create(['role_id' => 2]);
            DB::commit();
            auth()->attempt($request->safe()->only(['email', 'password']), true);
            event(new Registered($vendor));
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->with('error', 'something went wrong');
        }
        return redirect()->route('vendor.dashboard');
    }
}
