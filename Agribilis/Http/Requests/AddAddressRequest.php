<?php

namespace Agribilis\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddAddressRequest extends FormRequest
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
            'location' => 'required|string',
            'phone' => 'required|max:20',
            'postal_code' => 'required|max:5',
            'set_as_default' => 'required|boolean'
        ];
    }
}
