<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use App\Category;
use App\Trademark;
use Response;
use File;

class CategoryController extends Controller
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
        $categories = DB::table('product_category')
            ->select('*')
            ->where('is_deleted', '=', 0)
            ->paginate(10);
        return view('admin/category/index', ['categories' => $categories, 'trademarks' => $this->fetchAllTrademark()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        return view('admin/category/create',['trademarks' => $this->fetchAllTrademark()]);
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
        $path = $request->file('image')->store('categories');
        $keys = ['name', 'slug', 'trademark_id', 'is_active', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['image'] = $path;
        // Not implement yet
        Category::create($input);

        return redirect()->intended('admin/category');
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
        $category = Category::find($id);
        // Redirect to trademark list if updating trademark wasn't existed
        if ($category == null || count($category) == 0) {
            return redirect()->intended('admin/category');
        }
        return view('admin/category/edit', [
            'category' => $category,
            'trademarks' => $this->fetchAllTrademark()
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
        $category = Category::findOrFail($id);
        if(!$category){
            return redirect()->intended('admin/category');
        }
        $this->validateInput($request);
        $uniqueSlug = $this->buildUniqueSlug('product_category', $request->id, $request->slug);
        $keys = ['name', 'slug', 'trademark_id', 'is_active', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['slug'] = $uniqueSlug;

        // Upload image
        if($request->file('image')){
            $path = $request->file('image')->store('categories');
            $input['image'] = $path;
        }

        Category::where('id', $id)
            ->update($input);

        return redirect()->intended('admin/category');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        $category = Category::findOrFail($id);
        if(!$category){
            return redirect()->intended('admin/category');
        }
        Category::where('id', $id)->update(['is_deleted' => 1]);
        return redirect()->intended('admin/category');
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
        $categories = $this->doSearchingQuery($constraints);

        return view('admin/category/index', ['categories' => $categories, 'searchingVals' => $constraints, 'trademarks' => $this->fetchAllTrademark()]);
    }

    private function doSearchingQuery($constraints){
        $query = DB::table('product_category')
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

    function fetchAllTrademark(){
        $trademarks = DB::table('product_trademark')
            ->select('*')
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        $arrayTrademark = [];
        foreach($trademarks as $item){
            $arrayTrademark[$item->id] = $item->name;
        }

        return $arrayTrademark;
    }

    function fetchByTrademark(){
        $trademark_id = Input::get("trademark_id");
        $categories = DB::table('product_category')
            ->select('*')
            ->where('trademark_id', '=', $trademark_id)
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        if(!$categories){
            return response()->json(['trademark_id' => $trademark_id, 'status' => '404']);
        }

        $arrayCategory = [];
        foreach($categories as $item){
            $arrayCategory[$item->id] = $item->name;
        }

        return response()->json(['categories' => $arrayCategory, 'status' => '200']);
    }
}
