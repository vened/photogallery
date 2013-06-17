$(document).ready(function () {

    function cartUpdate(){
        var form = $('.cart_update_quantity'),
            cart = $('.btn-cart');
        form.on("submit", function(e){
            e.preventDefault();


            $.ajax($(this).attr('action'), {

                async: false,
                cache: false,
                data: $(this).serialize(),
                dataType: 'html',
                type: 'POST',

                success: function (data, textStatus, jqXHR) {
                    $.getJSON('/ajax/cart.json', function(data) {
                        cart.html(" В корзине " + data + " шт.");
                    });
                },

                error: function () {
                    alert('Ошибка запроса');
                }
            });

            return false;
        });

    }

    cartUpdate();


});