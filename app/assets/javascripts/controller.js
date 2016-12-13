$(document).ready(function() {
    $('select').material_select();

    addMove()
    addBond()
});

function addMove() {
    var num = $(".moves-input").children().size() + 1;
    $(".moves-button").on("click", function () {
      $(".moves-input").append("<input type=\"text\" name=\"moves[" + num + "][name]\" placeholder=\"Description Name\" class=\"moves-name\"><textarea name=\"moves[" + num + "][description]\" placeholder=\"Description of Move\" class=\"moves-description form-control\"></textarea>");
      num++
    })
}

function addBond() {
    var num = $(".bonds-input").children().size() + 1;
    $(".bonds-button").on("click", function () {
      if ($(".bond-description").last().val() != "") {
        $(".bonds-input").append("<textarea name=\"bonds[" + num + "][description]\" placeholder=\"Description of Bond\" class=\"bond-description form-control\"></textarea>");
      }
      num++
    })
}
