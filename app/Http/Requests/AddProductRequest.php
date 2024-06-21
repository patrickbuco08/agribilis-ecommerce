<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddProductRequest extends FormRequest
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
            'name'  =>  'required|string',
            'description' => 'required|string',
            'tags' => 'required',
            'unit' => 'required',
            'stock' => 'required|integer',
            'price' => 'required|integer',
            'order_limit' => 'required|integer',
            'delivery_min' => 'required|integer',
            'delivery_max' => 'required|integer',
            'files' => 'required',
            'files.*' => 'mimes:jpeg,png,jpg,gif',
            'category_id' => 'required|integer',
            'subcategory_id' => 'integer',
            'sub_subcategory_id' => 'integer'
        ];
    }
}
