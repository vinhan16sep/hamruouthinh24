<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use DateTime;
use Response;
use App\Blog;
use App\BlogComment;

class CommentApiController extends Controller
{
	/**
     * Create a new controller instance.
     *
     * @return void
     */
	public function __construct(){
    }

    public function checkBlogCommentExist()
    {
        $id = Input::get('id');

        $exist = DB::table('blog')
            ->select('*')
            ->where('id', '=', $id)
            ->where('is_deleted', '=', 0)
            ->limit(1)
            ->get();

        if(empty($exist)){
            return response()->json(['id' => $id, 'message' => 'not_found'], 404);
        }

        // if($exist[0]->quantity <= 0){
        //     return response()->json(['id' => $id, 'message' => 'out_of_stock'], 200);
        // }

        return response()->json(['id' => $id, 'result' => $exist[0], 'message' => 'success'], 200);
    }

    public function addCommentBlog(Request $request)
    {
    	$keys = ['blog_id','author','email', 'content'];
    	$input = $this->createQueryInput($keys, $request);
    	BlogComment::create($input);
    	return 'ok';
    }
    public function getBlogComment(Request $request)
    {
    	$id = $request->input('id');
    	$result = DB::table('blog_comment')
    			->where('blog_id', $id)
    			->where('is_deleted', '=', 0)
    			->where('is_approved', '=', 0)
    			->orderBy('id', 'desc')
    			// ->get();
    			->paginate(10);
    	return response()->json($result, 200);
    }
}
