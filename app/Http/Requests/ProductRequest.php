<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Routing\Route;

class ProductRequest extends FormRequest
{
    private $action;
    function __construct(Route $route) {
        $this->action = $route;
    }
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
        $rules = [
            'image' => 'required',
            'name' => 'required|max:255',
            'slug' => 'required',
            'type_id' => 'required',
            'price' => 'required|numeric',
            'selling_price' => 'numeric',
        ];
        $action = $this->action->getActionMethod();
        if($action == 'update'){
            unset($rules['image']);
        }
        return $rules;
    }

    public function messages()
    {
        $messages = [
            'image.required' => 'Hình Ảnh không được trống',
            'name.required' => 'Tên sản phẩm không được trống',
            'slug.required'  => 'Slug không được trống',
            'type_id.required'  => 'Loại sản phẩm không được trống',
            'price.required'  => 'Đơn giá (VNĐ) không được trống',
            'selling_price.required'  => 'Đơn giá bán (VNĐ) không được trống',
        ];
        $action = $this->action->getActionMethod();
        if($action == 'update'){
            unset($messages['image.required']);
        }
        return $messages;
    }
}
