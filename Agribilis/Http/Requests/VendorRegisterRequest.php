<?php

namespace Agribilis\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VendorRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'full_name'  =>  'required|string|max:255',
            'email'  =>  'required|string|email|max:255|unique:users',
            'password'  =>  'required|confirmed',
            'shop_name' => 'required|string',
            'description' => 'required|string',
            'location' => 'required|string',
            'phone' => 'required'
        ];
    }
}
