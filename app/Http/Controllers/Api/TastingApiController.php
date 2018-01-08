<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use App\Tasting;
use DateTime;
use Response;

class TastingApiController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(){
    }

    public function save()
    {
    	echo 1;die;
    	$data = [
    		'customer_id' => 1,
    		'customer_name' => 'customer name',
    		'customer_email' => 'customer email',
    		'customer_phone' => 'customer phone',
    		'customer_address' => 'customer address',
    		'customer_district' => 'customer district',
    		'customer_city' => 'customer city',
    		'customer_content' => 'customer content',
    		'status' => 0,
    		'time' => 'customer name',
    		'created_at' => new DateTime
    	];
    	DB::table('tasting')->insert($data);
    }
}
