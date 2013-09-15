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
//= require tn3/js/tn3lite
//
//var tn1 = $('.mygallery').tn3({
//    skinDir:"/skins",
//    responsive:"width",
//    width: 960,
//    height:425,
//    mouseWheel: false,
//    image:{
//        crop:true,
//        transitions:[{
//            type:"fade"
//        }]
//    },
//    touch: {
//        skin: "tn3",
//        fsMode: "/tn3_touch_fullscreen.html"
//    },
//    external:[{
//        origin:"xml",
//        url:"/wp-content/themes/tn3_black/examples/example2.xml"
//    }],
//    content:[{
//        plugin: "mediaelement",
//        options: {
//            features: ['current','progress','duration','fullscreen'],
//            useFullScreen: true
//        }
//    }]
//});

$(document).ready(function () {
    //Thumbnailer.config.shaderOpacity = 1;
    var tn1 = $('.mygallery').tn3({
        skinDir: "skins",
        responsive:"height",
//        width: 960,
//        height: 450,
        mouseWheel: true,
        imageClick: "fullscreen",
        image: {
            maxZoom: 1.5,
            crop: true,
            clickEvent: "dblclick",
            transitions: [
                {
                    type: "blinds"
                },
                {
                    type: "grid"
                },
                {
                    type: "grid",
                    duration: 460,
                    easing: "easeInQuad",
                    gridX: 10,
                    gridY: 20,
                    // flat, diagonal, circle, random
                    sort: "random",
                    sortReverse: false,
                    diagonalStart: "bl",
                    // fade, scale
                    method: "scale",
                    partDuration: 1360,
                    partEasing: "easeOutSine",
                    partDirection: "left"
                }
            ]
        }
    });
});
