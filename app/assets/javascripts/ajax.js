$(document).ready(function () {

    function cartUpdate() {
        var form = $('.cart_update_quantity'),
            cart = $('.btn-cart'),
            priceTotal = $(".price-total-js"),
            getOrder = $(".js-cart-getorder");
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
                    $.getJSON('/ajax/cart_price.json', function (data) {
                        priceTotal.html(data + " руб.");
                        if (data >= 2500) {
                            getOrder.html("<a class='cart-order' href='/order/new'>Оформить заказ</a>");
                        } else {
                            getOrder.html("&nbsp;&nbsp;<b>Оформление заказа не возможно, минимальная сумма заказа 2500 руб.</b>");
                        }
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
                priceDoseTotal = priceDoseTotalB.find("+ tr .price-dose-total-js");

            priceDoseTotal.html(countProduct * priceDose);
            //end обновление цены товара

            return false;
        });

    }

    cartUpdate();


});