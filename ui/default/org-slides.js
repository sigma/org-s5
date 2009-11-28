function formatSlideTitle(i) {
    var a = $('<h1 />').append($('<span />').append($(this).contents()));
    $(this).replaceWith(a);
}

function interpretTags() {
    $("span.tag").each(function(){
                           alert($(this));
                       });
}

$(document).ready(function () {
                      $("div.outline-2").addClass("slide");
                      $("div.slide h2").each(formatSlideTitle);
                      interpretTags();
                  });
