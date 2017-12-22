<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Trademark;
use Response;
use File;

class TrademarkController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
        $this->middleware('auth:admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $trademarks = $this->fetchAllTrademark();
        return view('admin/trademark/index', ['trademarks' => $trademarks]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        return view('admin/trademark/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $this->validateInput($request);

        // Upload image
        $path = $request->file('image')->store('trademarks');
        $keys = ['name', 'slug', 'is_active', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['image'] = $path;
        // Not implement yet
        Trademark::create($input);

        return redirect()->intended('admin/trademark');
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
    public function edit($id){
        $trademark = Trademark::find($id);
        // Redirect to trademark list if updating trademark wasn't existed
        if ($trademark == null || count($trademark) == 0) {
            return redirect()->intended('admin/trademark');
        }
        return view('admin/trademark/edit', [
            'trademark' => $trademark
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id){
        $trademark = Trademark::findOrFail($id);
        if(!$trademark){
            return redirect()->intended('admin/trademark');
        }

        $count = $this->countForCheckEmptyObject('product_category', 'trademark_id', $id);
        if($count > 0 && $request->is_active == 0){
            return view('admin/trademark/edit', ['trademark' => $trademark, 'error_message' => sprintf($this->commonMessage['isNotEmpty'], 'Thương hiệu', $trademark->name, 'bỏ dùng thương hiệu')]);
        }

        $this->validateInput($request);
        $uniqueSlug = $this->buildUniqueSlug('product_trademark', $request->id, $request->slug);
        $keys = ['name', 'slug', 'is_active', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['slug'] = $uniqueSlug;

        // Upload image
        if($request->file('image')){
            $path = $request->file('image')->store('trademarks');
            $input['image'] = $path;
        }

        Trademark::where('id', $id)
            ->update($input);

        return redirect()->intended('admin/trademark');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        $trademark = Trademark::findOrFail($id);
        if(!$trademark){
            return redirect()->intended('admin/trademark');
        }

        $count = $this->countForCheckEmptyObject('product_category', 'trademark_id', $id);
        if($count > 0){
            return view('admin/trademark/index', ['trademarks' => $this->fetchAllTrademark(), 'error_message' => sprintf($this->commonMessage['isNotEmpty'], 'Thương hiệu', $trademark->name, 'xoá')]);
        }

        Trademark::where('id', $id)->update(['is_deleted' => 1]);
        return redirect()->intended('admin/trademark');
    }

    /**
     * Search state from database base on some specific constraints
     *
     * @param  \Illuminate\Http\Request  $request
     *  @return \Illuminate\Http\Response
     */
    public function search(Request $request){
        $constraints = [
            'name' => $request['name']
        ];
        $trademarks = $this->doSearchingQuery($constraints);

        return view('admin/trademark/index', ['trademarks' => $trademarks, 'searchingVals' => $constraints]);
    }

    protected function fetchAllTrademark(){
        $trademarks = DB::table('product_trademark')
            ->select('*')
            ->where('is_deleted', '=', 0)
            ->paginate(10);
        return $trademarks;
    }

    private function doSearchingQuery($constraints){
        $query = DB::table('product_trademark')
            ->select('*');
        $fields = array_keys($constraints);
        $index = 0;
        foreach ($constraints as $constraint) {
            if ($constraint != null) {
                $query = $query->where($fields[$index], 'like', '%'.$constraint.'%');
            }

            $index++;
        }
        return $query->paginate(10);
    }

    private function validateInput($request) {
        $this->validate($request, [
            'name' => 'required|max:60',
//            'price' => 'required|max:60',
//            'middlename' => 'required|max:60',
//            'address' => 'required|max:120',
//            'city_id' => 'required',
//            'state_id' => 'required',
//            'country_id' => 'required',
//            'zip' => 'required|max:10',
//            'age' => 'required',
//            'birthdate' => 'required',
//            'date_hired' => 'required',
//            'department_id' => 'required',
//            'division_id' => 'required'
        ]);
    }
}
