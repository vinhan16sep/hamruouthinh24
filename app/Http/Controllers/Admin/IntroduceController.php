<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Introduce;
use Response;
use Validator;
use Illuminate\Support\Facades\Cookie;

class IntroduceController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
        $this->middleware('auth:admin');
//        Cookie::queue('activeMenu', 'introduce', 45000);
    }

    public function introduce($type){
        $result = DB::table('introduce')
            ->select('*')
            ->where('slug', '=', $type)
            ->get();
        return view('admin/introduce/index', [
            'data' => $result[0]
        ]);
    }

    public function saveIntroduce(Request $request, $slug){

        $rules = [
            'content'=>'required',
            'description'=>'required',
                ];
     
        $messages = [
            'content.required'=>'Bạn chưa nhập nội dung',
            'description.required'=>'Bạn chưa nhập mô tả',
                    ];

        if($slug != 'dang-ky-thu-ruou'){
            unset($rules['description']);
            unset($messages['description.required']);
        }
        if($slug == 've-chung-toi'){
            $rules['description1'] = 'required';
            $rules['description2'] = 'required';
            $rules['description3'] = 'required';
            $messages['description1.required'] = 'Bạn vui lòng nhập trường này';
            $messages['description2.required'] = 'Bạn vui lòng nhập trường này';
            $messages['description3.required'] = 'Bạn vui lòng nhập trường này';
        }
        $Validator = Validator::make($request->all(),$rules,$messages);
        if($Validator->fails()){
            return redirect()->back()->withErrors($Validator);
        }
        else{
            $keys = ['content'];
            if($slug == 'dang-ky-thu-ruou' || $slug == 've-chung-toi'){
                $keys = ['content','description'];
            }
            $input = $this->createQueryInput($keys, $request, $slug);
            // Upload image
            if($request->file('image')){
                $path = $request->file('image')->store('introduce');
                $input['image'] = $path;
            }

            Introduce::where('slug', $slug)
                ->update($input);

            $item = $this->getBySlug($slug);
            return redirect()->back();
        }
    }

    public function getBySlug($slug){
        $query = DB::table('introduce')
            ->select('*')
            ->where('slug', '=', $slug);
        return $query->get();
    }
}
