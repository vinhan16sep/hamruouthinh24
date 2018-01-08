<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use App\Product;
use App\Trademark;
use App\Type;
use App\Kind;
use Response;
use File;
use Illuminate\Support\Facades\Cookie;

class ProductController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
        $this->middleware('auth:admin');
//        Cookie::forget('activeMenu');
//        Cookie::queue('activeMenu', 'product', 45000);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $products = DB::table('product')
            ->join('type', 'type.id', '=', 'product.type_id')
            ->join('kind', 'kind.id', '=', 'product.kind_id')
            ->join('product_trademark', 'product_trademark.id', '=', 'product.trademark_id')
            ->select('product.*', 'type.title as type_title', 'kind.title as kind_title', 'product_trademark.name as trademark_title')
            ->where('product.is_deleted', '=', 0)
            ->paginate(10);
        return view('admin/product/index', [
            'products' => $products
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        $type = DB::table('type')->get();
        return view('admin/product/create', [
            'trademarks' => $this->fetchAllTrademark(),
            'type' => $type
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $this->validateInput($request);
        $uniqueSlug = $this->buildUniqueSlug('product', $request->id, $request->slug);

        $path = base_path() . '/' . 'storage/app/products';
        $newFolderPath = $this->buildNewFolderPath($path, $uniqueSlug);
        File::makeDirectory($newFolderPath[1], 0777, true, true);

        // Upload image
        $path = $request->file('image')->store('products/' . $newFolderPath[0]);
        $keys = ['name','type_id', 'kind_id', 'trademark_id', 'is_special', 'is_new', 'capacity', 'material', 'year', 'producer', 'volume', 'origin', 'price', 'selling_price', 'content', 'is_discount', 'discount_percent', 'discount_price', 'is_gift', 'gift', 'description'];
        // $keys = ['name'];
        $input = $this->createQueryInput($keys, $request);
        $input['image'] = $path;
        $input['slug'] = $uniqueSlug;
        // print_r($input);die;

        // Not implement yet
        Product::create($input);

        return redirect()->intended('admin/product');
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
        $product = Product::find($id);
        $type = DB::table('type')->get();
        // Redirect to product list if updating product wasn't existed
        if ($product == null || count($product) == 0) {
            return redirect()->intended('admin/product');
        }
        return view('admin/product/edit', [
            'product' => $product,
            'trademarks' => $this->fetchAllTrademark(),
            'categories' => $this->fetchCategoryByTrademark($product->trademark_id),
            'type' => $type
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
        $product = Product::findOrFail($id);
        $this->validateInput($id, $request);
        $uniqueSlug = $this->buildUniqueSlug('product', $request->id, $request->slug);

        $path = base_path() . '/' . 'storage/app/products';
        if($request->slug != $product->slug){
            rename($path . '/' . $product->slug, $path . '/' . $uniqueSlug);
        }

        $keys = ['name','type_id', 'kind_id', 'trademark_id', 'is_special', 'is_new', 'capacity', 'material', 'year', 'producer', 'volume', 'origin', 'price', 'selling_price', 'content', 'is_discount', 'discount_percent', 'discount_price', 'is_gift', 'gift', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['slug'] = $uniqueSlug;

        // Upload image
        if($request->file('image')){
            $path = $request->file('image')->store('products/' . $uniqueSlug);
            $input['image'] = $path;
        }else{
            $oldImageString = explode('/', $product->image);
            $input['image'] = implode('/', [$oldImageString[0], $uniqueSlug, $oldImageString[2]]);
        }

        Product::where('id', $id)
            ->update($input);

        return redirect()->intended('admin/product');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        Product::where('id', $id)->update(['is_deleted' => 1]);
        return redirect()->intended('admin/product');
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
        $products = $this->doSearchingQuery($constraints);

        return view('admin/product/index', ['products' => $products, 'searchingVals' => $constraints]);
    }

    private function doSearchingQuery($constraints){
        $query = DB::table('product')
            ->where('product.is_deleted', '=', 0)
            ->join('type', 'type.id', '=', 'product.type_id')
            ->join('kind', 'kind.id', '=', 'product.kind_id')
            ->join('product_trademark', 'product_trademark.id', '=', 'product.trademark_id')
            ->select('product.*', 'type.title as type_title', 'kind.title as kind_title', 'product_trademark.name as trademark_title');
        $fields = array_keys($constraints);
        $index = 0;
        foreach ($constraints as $constraint) {
            if ($constraint != null) {
                $query = $query->where('product.'.$fields[$index], 'like', '%'.$constraint.'%');
            }

            $index++;
        }
        return $query->paginate(10);
    }

    private function validateInput($id, $request) {
        // echo 'required|unique:product, id, ' . $id . '|max:255';die;
        $this->validate($request, [
            'name' => 'required|max:255',
            'slug' => 'required|unique:product,slug, ' . $id . '|max:255',
            'trademark_id' => 'required',
            'price' => 'required|numeric',
            'selling_price' => 'numeric',
            'discount_percent' => 'numeric',
            'discount_price' => 'numeric'
        ]);
    }

    function buildNewFolderPath($path, $fileName){
        $newPath = $path . '/' . $fileName;
        $newName = $fileName;
        $counter = 1;
        while (file_exists($newPath)) {
            $newName = $fileName . '-' . $counter;
            $newPath = $path . '/' . $newName;
            $counter++;
        }

        return array($newName, $newPath);
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

    function fetchCategoryByTrademark($id){
        $categories = DB::table('product_category')
            ->select('*')
            ->where('trademark_id', '=', $id)
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();

        $arrayCategory = [];
        foreach($categories as $item){
            $arrayCategory[$item->id] = $item->name;
        }

        return $arrayCategory;
    }

    function fetchByType(){
        $type_id = Input::get('type_id');
        $kind = DB::table('kind')
            ->select('*')
            ->where('type_id', $type_id)
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();
        if(!$kind){
            return response()->json(['kind_id' => $kind_id, 'status' => '404']);
        }

        $arrayKind = [];
        foreach($kind as $item){
            $arrayKind[$item->id] = $item->title;
        }

        return response()->json(['kinds' => $arrayKind, 'status' => '200']);
    }

    function fetchByKind(){
        $kind_id = Input::get('kind_id');
        $trademark = DB::table('product_trademark')
            ->select('*')
            ->where('kind_id', $kind_id)
            ->where('is_active', '=', 1)
            ->where('is_deleted', '=', 0)
            ->get();
        if(!$trademark){
            return response()->json(['trademark_id' => $trademark_id, 'status' => '404']);
        }

        $arrayTrademark = [];
        foreach($trademark as $item){
            $arrayTrademark[$item->id] = $item->name;
        }

        return response()->json(['trademarks' => $arrayTrademark, 'status' => '200']);
    }
}
