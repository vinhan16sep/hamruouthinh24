$(document).ready(function() {
    'use strict';

    $('.nav_product_hover').mouseenter(function(){
        $('.nav_expand').css('display' , 'block');
    });
    $('.nav_product_hover').mouseout(function() {
        $('.nav_expand').css('display' , 'none');
    })

});