$(document).ready(function () {

    function cartUpdate() {
        var form = $('.cart_update_quantity'),
            cart = $('.btn-cart');
        form.on("submit", function (e) {
            e.preventDefault();


            $.ajax($(this).attr('action'), {

                async: false,
                cache: false,
                data: $(this).serialize(),
                dataType: 'html',
                type: 'POST',

                success: function (data, textStatus, jqXHR) {
                    $.getJSON('/ajax/cart.json', function (data) {
                        cart.html(" В корзине " + data + " шт.");
                    });
                },

                error: function () {
                    alert('Ошибка запроса');
                }
            });


            //begin обновление цены товара
            var countProduct = $(this).find(".calc").val(),
                priceDoseTotalB = $(this).closest("tr"),
                priceDose = priceDoseTotalB.find(".price-dose-js").html(),
                priceDoseTotal = priceDoseTotalB.find("+ tr .price-dose-total-js"),
                priceTotal = $(".price-total-js");

            priceDoseTotal.html(countProduct * priceDose);

            var priceAll = 0
            $(".price-dose-total-js").each(function( index ) {
                priceAll = priceAll + parseInt($(this).text())
                console.log(priceAll);
            });
            priceTotal.html(priceAll + " руб.");
            //end обновление цены товара


            return false;
        });

    }

    cartUpdate();


});