<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use App\Tasting;
use File;

class TastingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
        $this->middleware('auth:admin');
    }
    public function index()
    {
        $tasting = DB::table('tasting')
                        ->join('tasting_product', 'tasting.id', '=', 'tasting_product.tasting_id')
                        ->where('status',0)
                        ->paginate(10);
        return view('admin/tasting/index', ['tasting' => $tasting]);
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

    public function finish()
    {
        $tasting = DB::table('tasting')
                        ->join('tasting_product', 'tasting.id', '=', 'tasting_product.tasting_id')
                        ->where('status',1)
                        ->paginate(10);
        return view('admin/tasting/index', ['tasting' => $tasting]);
    }

    public function ajaxFinish()
    {
        $id = Input::get("id");
        $isExist = false;
        $tasting = DB::table('tasting')
                    ->select('*')
                    ->where('id', '=', $id)
                    ->get();
        if(!$tasting){
            return response()->json(['id' => $id, 'status' => '404']);
        }

        $update = DB::table('tasting')
            ->where('id', $id)
            ->update(['status' => 1]);
        if($update){
            $isExist = true;
        }

        return response()->json(['isExist' => $isExist, 'status' => '200']);
    }
}
