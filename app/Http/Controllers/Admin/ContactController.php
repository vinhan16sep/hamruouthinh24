<?php

namespace App\Http\Controllers\admin;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Response;
use Illuminate\Support\Facades\Cookie;
use App\Contact;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct(){
        $this->middleware('auth:admin');
    }
    public function index()
    {
        $contact = Contact::find(1);
        return view('admin/contact/view', ['contact' => $contact]);
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
        if($id == 1){
            $contact = Contact::find(1);
            if ($contact == null) {
                return redirect()->intended('admin/contact/detail');
            }
            return view('admin/contact/edit', ['contact' => $contact]);
        }else{
            return redirect()->intended('admin/contact/detail');
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $keys = ['company','address','numberphone','email','website','map'];
        $input = $this->createQueryInput($keys, $request);
        Contact::where('id', 1)
            ->update($input);
        $contact = Contact::find(1);
        return view('admin/contact/edit', [
            'contact' => $contact
        ]);
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
