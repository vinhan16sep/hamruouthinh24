<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use App\Http\Requests\BlogCategoryRequest;
use App\BlogCategory;
use Response;
use File;

class BlogCategoryController extends Controller
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
        $categories = DB::table('blog_category')
            ->where('is_deleted', 0)
            ->select('*')
            ->paginate(10);
        return view('admin/blog-category/index', ['categories' => $categories]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        return view('admin/blog-category/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BlogCategoryRequest $request){
        $uniqueSlug = $this->buildUniqueSlug('blog_category', null, $request->slug);

        // Upload image
        $path = $request->file('image')->store('blogCategories');
        $keys = ['title', 'type', 'is_active', 'description'];
        $input = $this->createQueryInput($keys, $request);
        $input['image'] = $path;
        $input['slug'] = $uniqueSlug;
        // Not implement yet
        BlogCategory::create($input);

        return redirect()->intended('admin/blog-category');
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
        if(!is_numeric($id)){
            return redirect()->intended('admin/blog-category');
        }
        $blogCategory = DB::table('blog_category')
                            ->select('*')
                            ->where(['is_deleted' => 0, 'id' => $id])
                            ->first();
        return view('admin/blog-category/edit', ['blogCategory' => $blogCategory]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(BlogCategoryRequest $request, $id)
    {
        $blogCategory = BlogCategory::findOrFail($id);
        $uniqueSlug = $this->buildUniqueSlug('blog_category', $request->id, $request->slug);

        $keys = ['title', 'description', 'is_active'];
        $input = $this->createQueryInput($keys, $request);
        $input['slug'] = $uniqueSlug;
        if($blogCategory->slug == 'phan-thuong'){
            unset($input['title']);
            unset($input['slug']);
        }

        // Upload image
        if($request->file('image')){
            $path = $request->file('image')->store('blogCategories');
            $input['image'] = $path;
        }

        BlogCategory::where('id', $id)
            ->update($input);

        return redirect()->intended('admin/blog-category');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = BlogCategory::findOrFail($id);
        if($blog['slug'] == 'phan-thuong'){
            return redirect()->back();
        }
        BlogCategory::where('id', $id)->update(['is_deleted' => 1]);
        return redirect()->intended('admin/blog-category');
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
}
