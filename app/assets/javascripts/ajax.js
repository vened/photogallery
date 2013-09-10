$(document).ready(function () {

    $(".cube_action_1").on("click", function(){
        $(".container").removeClass("cube_3d_2");
        $(".container").addClass("cube_3d_1");
    });

    $(".cube_action_2").on("click", function(){
        $(".container").removeClass("cube_3d_1");
        $(".container").addClass("cube_3d_2");
    });

});