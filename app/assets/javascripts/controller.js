$(document).ready(function() {
    $('select').material_select();

    add_move()
    add_bond()
});

function add_move() {
    var num = 2
    $(".moves-button").on("click", function () {
      $(".moves-input").append("<input type=\"text\" name=\"moves[" + num + "][name]\" placeholder=\"Description Name\" class=\"moves-name\"><textarea name=\"moves[" + num + "][description]\" placeholder=\"Description of Move\" class=\"moves-description\"></textarea>");
      num++
    })
}

function add_bond() {
    var num = 2
    $(".bonds-button").on("click", function () {
      $(".bonds-input").append("<textarea name=\"bond[" + num + "][description]\" placeholder=\"Description of Bond\" class=\"bond-description col s12\"></textarea>");
      num++
    })
}
