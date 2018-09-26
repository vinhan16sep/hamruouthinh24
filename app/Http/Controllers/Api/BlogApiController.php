<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use App\Blog;
use App\BlogCategory;
use Response;

class BlogApiController extends Controller
{
    public function __construct(){
        //
    }

    public function fetchAllBlogs(){
        $slug = Input::get('slug');
        $category = BlogCategory::where('slug', $slug)->first();
        
        $result = DB::table('blog')
            ->select('*')
            ->where(['is_deleted' => 0, 'category_id' => $category->id])
            ->get();
        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }

    /**
     * Fetch 4 latest advises
     */
    public function fetchLatestBlog(){
        $result = DB::table('blog')
            ->select('*')
            ->where('is_deleted', '=', 0)
            ->orderBy('id', 'desc')
            ->limit(4)
            ->get();

        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }

    public function detail(){
        $slug = Input::get('slug');

        $result = DB::table('blog')
            ->select('*')
            ->where('slug', '=', $slug)
            ->where('is_deleted', '=', 0)
            ->get();

        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }

    public function fetchCategoryByType(){
        $type = Input::get('type');

        $result = DB::table('blog_category')
            ->select('*')
            ->where('type', '=', $type)
            ->where('is_deleted', '=', 0)
            ->get();

        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }

    public function fetchBlogByCategory(){
        $category = Input::get('category');

        $result = DB::table('blog')
            ->select('blog.*')
            ->join('blog_category', 'blog.category_id', '=', 'blog_category.id')
            ->where('blog_category.slug', '=', $category)
            ->where('blog.is_deleted', '=', 0)
            ->get();
        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }

    public function fetchAllCategory(){
        $result = BlogCategory::all();
        if(!$result){
            return response()->json('No item found', 404);
        }
        return response()->json($result, 200);
    }
    
}