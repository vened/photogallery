$(function () {


    var body = $("body"),
        container = $('.container'),
        photo = $('.js-open-photo'),
        openLayer = $('.js-open-lyer'),
        overlay = $('.overlay'),
        overlayBg = $('.overlay_bg'),
        layer = $('.js-layer'),
        layerClose = $('.layer-close', layer),
        layerIn = $('.js-layer_in', layer);


    var photos = photo.map(function () {
        return this.href;
    }).get();

    function AppendPhoto(src, i) {
        layerIn.html("<img src='" + src + "'/>");
    }


    function actionElementAtributes(i, p) {
        var next = $('.js-next', layer),
            prev = $('.js-prev', layer);

        if (i > 0) {
            prev.data('index', i - 1);
        } else {
            prev.data('index', p - 1);
        }
        if (i == (p - 1)) {
            next.data('index', 0);
        } else {
            next.data('index', i + 1);
        }
    }

    photo.on('click', function (e) {
        e.preventDefault();
        var index = $(this).data('index');
        actionElementAtributes(index, photos.length);
        AppendPhoto(photos[index], index);
    });


    container.find('.content').height(body.height());

//    window.onresize = resize;

//    function resize() {
//        container.find('.content').height(body.height());
//        overlay.height($('body').height());
//        layer.height($('body').height() - 40);
//    }

    openLayer.on('click', function () {
        overlay.height($('body').height());
        layer.height($('body').height() - 40);
        overlay.show();
    });

    overlayBg.on('click', function () {
        overlay.hide();
    });

    layerClose.on('click', function () {
        overlay.hide();
    });

    $(this).keydown(function (eventObject) {
        if (eventObject.which == 27)
            overlay.hide();
        if (eventObject.which == 39)
            $('.js-next').trigger('click');
        if (eventObject.which == 37)
            $('.js-prev').trigger('click');
    });

});