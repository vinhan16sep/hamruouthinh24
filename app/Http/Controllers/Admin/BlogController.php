<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Blog;
use App\BlogCategory;
use Response;
use File;

class BlogController extends Controller
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
        $blogs = DB::table('blog')
            ->select('*')
            ->where('is_deleted', '=', 0)
            ->paginate(10);
        $categories = $this->getCategory();
        return view('admin/blog/index', [
            'categories' => $categories,
            'blogs' => $blogs
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param int $type
     * @return \Illuminate\Http\Response
     */
    public function create(){
        $categories = $this->getCategory();
        return view('admin/blog/create', [
            'categories' => $categories
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $uniqueSlug = $this->buildUniqueSlug('blog', null, $request->slug);
        // Upload image
        $path = $request->file('image')->store('blogs');
        $keys = ['title', 'category_id', 'description', 'content'];
        $input = $this->createQueryInput($keys, $request);
        $input['type'] = 0;
        $input['image'] = $path;
        $input['slug'] = $uniqueSlug;
        // Not implement yet
        Blog::create($input);

        return redirect()->intended('admin/blog');
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
        $blog = Blog::find($id);
        $categories = $this->getCategory();
        // Redirect to product list if updating product wasn't existed
        if ($blog == null) {
            return redirect()->intended('admin/blog');
        }
        return view('admin/blog/edit', [
            'blog' => $blog,
            'categories' => $categories
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
        $blog = Blog::findOrFail($id);
        $this->validateInput($request);
        $uniqueSlug = $this->buildUniqueSlug('blog', $request->id, $request->slug);


        $keys = ['title', 'description', 'content'];
        $input = $this->createQueryInput($keys, $request);
        $input['slug'] = $uniqueSlug;

        // Upload image
        if($request->file('image')){
            $path = $request->file('image')->store('blogs');
            $input['image'] = $path;
        }

        Blog::where('id', $id)
            ->update($input);

        return redirect()->intended('admin/blog');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        $blog = Blog::findOrFail($id);
        Blog::where('id', $id)->update(['is_deleted' => 1]);
        return redirect()->intended('admin/blog');
    }

    public function search(Request $request){
        $blogs = $this->doSearchingQuery($request);
        $categories = $this->getCategory();

        return view('admin/blog/index', [
            'blogs' => $blogs,
            'categories' => $categories,
            'searchingVals' => $request
        ]);
    }

    public function getCategory(){
        $categories = BlogCategory::all();
        $arrayCategories = [];
        foreach($categories as $item){
            $arrayCategories[$item->id] = $item->title;
        }

        return $arrayCategories;
    }

    private function doSearchingQuery($constraints){
        $type = ($constraints['type'] == 'advise') ? 0 : 1;
        $query = DB::table('blog')
            ->select('*')
            ->where('type', '=', $type)
            ->where('title', 'like', '%' . $constraints['title'] . '%');

        return $query->paginate(10);
    }

    private function validateInput($request) {
        $this->validate($request, [
            'title' => 'required|max:60',
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
