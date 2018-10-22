<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ContactRequest extends FormRequest
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
            'company' => 'required',
            'address' => 'required',
            'numberphone' => 'required',
            'email' => 'required|email',
            'website' => 'required',
            'map' => 'required',
        ];
    }

    public function messages()
    {
        $messages = [
            'company.required' => 'Tên công ty không được trống',
            'address.required' => 'Địa chỉ không được trống',
            'numberphone.required'  => 'Số điện thoại không được trống',
            'email.required'  => 'Email không được trống',
            'email.email'  => 'Định dang email không đúng',
            'website.required'  => 'Url website không được trống',
            'map.required'  => 'Google map không được trống'
        ];
        return $messages;
    }
}
