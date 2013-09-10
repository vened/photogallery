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
//= require jquery_ujs
//= require underscore
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
            var $form = $this.closest('.cart_update_quantity');
            var $input = $this.closest('.quantity').find('input[type=text]');
            var value = $input.val() * 1;
            var min = $input.data('min');
            var newvalue = value + ($this.hasClass('minus') ? -1 : 1);

            if (newvalue < min) {
            	return;
            }

            $input.val(newvalue);
            $form.trigger('submit');

            return false;
        }

        $plus.on('click', update);
        $minus.on('click', update);
        $input.on('keyup change', _.debounce(function (e) {
        	var $this = $(this);
        	var $form = $this.closest('.cart_update_quantity');
            $form.trigger('submit');
        }, 300));

        $input.on('blur', function (e) {
        	var $this = $(this);
        	var $form = $this.closest('.cart_update_quantity');
        	var min = $this.data('min');

            if (!$this.val() || $this.val() < min) {
                $this.val(min);
            }
            
            $form.trigger('submit');
        })
    }
    
    function initSlimbox() {
		jQuery(function(){
			jQuery('.size-thumbnail').parent().add($('.shutterset_')).add('.album-photos a').slimbox({
		        overlayOpacity: 0.8,
		        captionAnimationDuration: 1,
		        counterText: "{x} / {y}",
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