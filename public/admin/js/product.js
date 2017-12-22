// Product management
window.onload = function(){
    // is_discount unchecked by default
    // so we need to disable 2 discount fields too
    // but enable in edit mode, and discount checkbox checked before
    if($('#is_discount').is(':checked')){
        $("#discount_percent").prop('disabled', false);
        $("#discount_price").prop('disabled', false);
    }else{
        $("#discount_percent").prop('disabled', true);
        $("#discount_price").prop('disabled', true);
    }

    // enable 2 discount fields when is_discount checked, disable again when is_discount uncheck
    $('#is_discount').change(function(){
        if($(this).is(':checked')){
            $("#discount_percent").prop('disabled', false);

            $("#discount_price").prop('disabled', false);
        }else{
            $("#discount_percent").val('');
            $("#discount_percent").prop('disabled', true);

            $("#discount_price").val('');
            $("#discount_price").prop('disabled', true);
        }
    });

    $('#trademark_id').change(function(){
        $('#category_id').html('');

        var url = window.location.origin;

        $.ajax({
            url: url + '/mmm/admin/category/fetchByTrademark/{trademark_id}',
            method: 'GET',
            data: {
                trademark_id: $('#trademark_id').val()
            },
            success: function(res){
                var categories = res.categories;
                $('#category_id').append('<option value="">Chọn danh mục</option>');
                $.each(categories, function(key, value){
                    $('#category_id').append('<option value="' + key + '">' + value + '</option>');
                });
                console.log(res.categories);
                res.categories
            },
            error: function(){
                alert('ERROR!');
            }
        })
    });


}
