<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Banner;
use App\Introduce;

class HomepageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $type = DB::table('type')
            ->select('*')
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        $kind = DB::table('kind')
            ->select('*')
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        $trademarks = DB::table('product_trademark')
            ->select('*')
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        // $categories = DB::table('product_category')
        //     ->select('*')
        //     ->where('is_active', '=', 1)
        //     ->where('is_deleted', '=', 0)
        //     ->get();

        $menuProduct = [
            'type' => $type ? $type : [],
            'kind' => $kind ? $kind : [],
            'trademarks' => $trademarks ? $trademarks : []
        ];
        $banner = Banner::find(1);
        $try_wine = Introduce::where('slug','dang-ky-thu-ruou')->first();
        $about = Introduce::where('slug','ve-chung-toi')->first();
        return view('homepage',['banner' => $banner,'try_wine' => $try_wine, 'about' => $about, 'menuProduct' => $menuProduct]);
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
        //
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
