<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Routing\Route;

class TrademarkRequest extends FormRequest
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
            'type_id' => 'required',
            'kind_id' => 'required',
            'name' => 'required',
            'slug' => 'required',
            'description' => 'required'
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
            'type_id.required' => 'Loại sản phẩm không được trống',
            'kind_id.required' => 'Dòng sản phẩm không được trống',
            'name.required' => 'Tên thương hiệu không được trống',
            'slug.required'  => 'Slug không được trống',
            'description.required'  => 'Giới thiệu ngắn không được trống'
        ];
        $action = $this->action->getActionMethod();
        if($action == 'update'){
            unset($messages['image.required']);
        }
        return $messages;
    }
}
