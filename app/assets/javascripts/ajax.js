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
                priceDoseTotal = priceDoseTotalB.find(".price-dose-total-js");

            priceDoseTotal.html(countProduct * priceDose);
            //end обновление цены товара

            return false;
        });

    }

    cartUpdate();


    function AddProductToCart() {
        var cart = $('.btn-cart'),
            forms = $(".product-info form.button_to"),
            addButton = $(".product-info form.button_to .cart-add"),
            miniCart = $('.mini_cart');
        addButton.on('click', function (e) {
            e.preventDefault();
            var form = $(this).closest("form");
            form.submit();
        });
        forms.on("ajax:error", function (data, status, xhr) {
            alert("При попытке добавить товар в корзину произошла ошибка, попробуйте ещё раз")
        });
        forms.on("ajax:success", function (data, status, xhr) {
            $.getJSON('/ajax/cart.json', function (data) {
                cart.html(" В корзине " + data + " шт.");
            });
            $.get('/ajax/mini_cart', function (data){
                miniCart.html(data);
            });
        });
    };

    AddProductToCart();


});