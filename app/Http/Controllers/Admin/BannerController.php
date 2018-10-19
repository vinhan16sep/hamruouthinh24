<?php

namespace App\Http\Controllers\admin;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Response;
use File;
use Illuminate\Support\Facades\Cookie;
use App\Banner;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct(){
        $this->middleware('auth:admin');
    }
    public function index()
    {
        $banner = Banner::find(1);
        return view('admin/banner/view', ['banner' => $banner]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if($id == 1){
            $banner = Banner::find(1);
            if ($banner == null) {
                return redirect()->intended('admin/banner/detail');
            }
            return view('admin/banner/edit', ['banner' => $banner]);
        }else{
            return redirect()->intended('admin/banner/detail');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $banner = Banner::find(1);
        $input = array();
        if($request->file('image')){
            foreach ($request->file('image') as $key => $file) {
                $fileName[] = $file->hashName();
                $file->store('banner');
            }
            $image = (empty(json_decode($banner['image']))) ? array() : json_decode($banner['image']);
            $image_json = json_encode(array_merge($image,$fileName));
            $input['image'] = $image_json;
        }
        if($request->file('image_left')){
            $path = $request->file('image_left')->store('banner');
            $input['image_left'] = str_replace('banner/', '', $path);

        }
        if($request->file('image_right')){
            $path = $request->file('image_right')->store('banner');
            $input['image_right'] = str_replace('banner/', '', $path);

        }
        if (!empty($input)) {
            Banner::where('id', 1)->update($input);
        }
        $banner = Banner::find(1);
        return view('admin/banner/edit', [
            'banner' => $banner
        ]);
    }
    function remove_img($name_img){
        $image_path = base_path()."/storage/app/banner/".$name_img;
        if(file_exists($image_path)) {
            unlink($image_path);
        }
    }
    public function delete_banner(Request $request){
        $image = $request->image;
        $id = 1;
        $path = base_path() . '/storage/app/banner/';
        $banner = Banner::findOrFail($id);


        $upload = [];
        $upload = json_decode($banner->image);
        $key = array_search($image, $upload);
        unset($upload[$key]);
        $newUpload = [];
        foreach ($upload as $key => $value) {
            $newUpload[] = $value;
        }
        
        $image_json = json_encode($newUpload);
        $result = DB::table('banner')
            ->where('id', $id)
            ->update(['image' => $image_json]);
        if($result){
            $this->remove_img($image);
            $success = true;
        }
        return response()->json(['image_json' => $image_json, 'status' => '200']); 
        
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
