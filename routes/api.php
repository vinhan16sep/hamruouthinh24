<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'], function(){
    Route::resource('product', 'ProductController');
});

Route::prefix('v1')->group(function() {
    Route::group(array('namespace' => 'Api'), function() {
        /**
         * Introduce API
         */
        Route::resource('introduce', 'IntroduceApiController');
        Route::get('introduce', 'IntroduceApiController@fetchAllIntroduce')->name('introduce.fetchAllIntroduce');
        /**
         * Product API
         */
        Route::resource('product', 'ProductApiController');
        Route::get('product', 'ProductApiController@index')->name('product.index');
        Route::get('products', 'ProductApiController@fetchAllProduct')->name('product.fetchAllProduct');
        Route::get('discount_product', 'ProductApiController@fetchDiscountProduct')->name('product.fetchDiscountProduct');
        Route::get('menu_product', 'ProductApiController@fetchMenuProduct')->name('product.fetchMenuProduct');
        Route::get('target_products', 'ProductApiController@fetchTargetProducts')->name('product.fetchTargetProducts');
        Route::get('detail_product', 'ProductApiController@detail')->name('product.detail');
        Route::get('search', 'ProductApiController@search')->name('product.search');
        Route::get('target_search', 'ProductApiController@targetSearch')->name('product.targetSearch');

        /**
         * Blog API
         */
        Route::resource('blog', 'BlogApiController');
        Route::get('advises', 'BlogApiController@fetchAllAdvises')->name('blog.fetchAllAdvises');
        Route::get('latest_advises', 'BlogApiController@fetchLatestAdvises')->name('blog.fetchLatestAdvises');
        Route::get('news', 'BlogApiController@fetchAllNews')->name('blog.fetchAllNews');
        Route::get('category', 'BlogApiController@fetchCategoryByType')->name('blog.fetchCategoryByType');
        Route::get('blog_category', 'BlogApiController@fetchBlogByCategory')->name('blog.fetchCafetchBlogByCategorytegoryByType');
        Route::get('detail', 'BlogApiController@detail')->name('blog.detail');

        /**
         * Cart API
         */
        Route::resource('cart', 'CartApiController');
        Route::get('check_product_exist', 'CartApiController@checkProductExist')->name('cart.checkProductExist');
        Route::get('get_stored_cart_products', 'CartApiController@getStoredCartProducts')->name('cart.getStoredCartProducts');
        Route::get('checkout', 'CartApiController@checkout')->name('cart.checkout');
        Route::get('auto_fill_personal_info', 'CartApiController@fetchLoggedInfo')->name('cart.fetchLoggedInfo');

        /**
         * Tasting API
         */
        Route::resource('tasting', 'TastingApiController');
        Route::get('check_tasting_exist', 'TastingApiController@checkTastingExist')->name('tasting.check_tasting_exist');
        Route::get('checkout_tasting', 'TastingApiController@checkout')->name('tasting.checkout_tasting');

        /**
         * Customer API
         */
        Route::resource('customer', 'CustomerApiController');
        Route::get('customer_info', 'CustomerApiController@fetchCustomerInfo')->name('customer.fetchCustomerInfo');
        Route::get('customer_not_complete', 'CustomerApiController@fetchNotCompleteOrder')->name('customer.fetchNotCompleteOrder');
        Route::get('customer_complete', 'CustomerApiController@fetchCompleteOrder')->name('customer.fetchCompleteOrder');
        Route::get('update_info', 'CustomerApiController@updateInfo')->name('customer.updateInfo');

        //origin routes
        Route::resource('origin', 'OriginApiController');
        Route::get('origin', 'OriginApiController@index')->name('origin.index');
    });
});