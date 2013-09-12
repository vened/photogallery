$(function () {


    var photo = $('.js-open-photo'),
        layer = $('.js-layer'),
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


});