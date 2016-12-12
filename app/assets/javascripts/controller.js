$(document).ready(function() {
    $('select').material_select();

    add_move()
});

function add_move() {
    var num = 2
    $(".moves-button").on("click", function () {
      $(".moves-input").append("<input type=\"text\" name=\"moves[" + num + "][name]\" placeholder=\"Description Name\" class=\"moves-name\"><input type=\"text-area\" name=\"moves[" + num + "][description]\" placeholder=\"Description of Move\" class=\"moves-description\">");
      num++
    })
}
