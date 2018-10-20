<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\DB;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $commonMessage = [
        'isNotEmpty' => '%s %s không trống, không thể %s'
    ];

    protected function buildUniqueSlug($table, $id = 0, $slug){
        $allSlugs = $this->getRelatedSlugs($table, $slug, $id);
        if (! $allSlugs->contains('slug', $slug)){
            return $slug;
        }
        for ($i = 1; $i <= 10; $i++) {
            $newSlug = $slug.'-'.$i;
            if (! $allSlugs->contains('slug', $newSlug)) {
                return $newSlug;
            }
        }
        throw new \Exception('Can not create a unique slug');
    }

    protected function getRelatedSlugs($table, $slug, $id = 0)
    {
        return DB::table($table)->select('slug')->where('slug', 'like', $slug.'%')
        ->where('id', '<>', $id)
        ->get();
    }
    protected function createQueryInput($keys, $request,$slug='') {
        $queryInput = [];
        for($i = 0; $i < sizeof($keys); $i++) {
            $key = $keys[$i];
            $queryInput[$key] = $request[$key];
            if($slug == 've-chung-toi' && $key == 'description'){
                $queryInput[$key] = json_encode([$request[$key.'1'],$request[$key.'2'],$request[$key.'3']]);
            }
        }

        return $queryInput;
    }

    protected function countForCheckEmptyObject($object, $check,  $id){
        $count = DB::table($object)
            ->where($check, $id)
            ->where('is_deleted', 0)
            ->count();
        return $count;
    }
}
