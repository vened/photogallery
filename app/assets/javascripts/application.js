// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//
//
//
//= require jquery
//= require slimbox2
//= require jquery_ujs
//= require ajax

$(function () {
    var $wrapper = $('#wrapper');
    var $header = $('#header');
    var $footer = $('#footer');
    var $container = $('#container');
    var offsetTop = $wrapper.offset().top;

    function updateHtml() {
        var winHeight = $(window).height();
        var wrapperHeight = winHeight - offsetTop;

        $wrapper.css('min-height', wrapperHeight);
        $container.css('min-height', wrapperHeight - $footer.outerHeight(true));
    }

    $(window).on('resize', updateHtml);

    // init
    updateHtml();


    function initQuantity() {
        var $quantity = $('.quantity');
        var $plus = $('.plus', $quantity);
        var $minus = $('.minus', $quantity);
        var $input = $('input[type=text]', $quantity);

        function update() {
            var $this = $(this);
            var $input = $this.closest('.quantity').find('input[type=text]');
            var value = $input.val() * 1;
            var newvalue = value + ($this.hasClass('minus') ? -1 : 1);

            if (newvalue < 1) {
                newvalue = 1;
            }

            $input.val(newvalue);

            var form = $this.closest('.cart_update_quantity');
            form.submit();

            return false;
        }

        $input.on('change, keyup', function(){
            var $this = $(this);
            var form = $this.closest('.cart_update_quantity');
            form.submit();
        });

        $plus.on('click', update);
        $minus.on('click', update);
        $input.on('keyup', function (e) {
            if (this.value && this.value < 1) {
                this.value = 1;
            }
        });

        $input.on('blur', function (e) {
            if (!this.value) {
                this.value = 1;
            }
        })
    }
    
    function initSlimbox() {
		jQuery(function(){
			jQuery('.size-thumbnail').parent().add($('.shutterset_')).slimbox({
		        overlayOpacity: 0.6,
		        captionAnimationDuration: 1,
		        counterText: "Image {x} sur {y}",
		        closeKeys: [27, 70],
		        nextKeys: [39, 83]
			});
		});
    }

    initQuantity();
    initSlimbox();
});

$(document).ready(function () {
    var payment_details = $(".payment_details"),
        order_payment_method = $("#order_payment");

    payment_details.hide();

    if (order_payment_method.val() == 'Безналичный расчёт'){
        payment_details.show();
    }

    order_payment_method.on("change", function(){
        if ($(this).val() == 'Безналичный расчёт'){
            payment_details.show();
        }else{
            payment_details.hide();
        }
    });


});