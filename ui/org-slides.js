function formatSlideTitle(i) {
    var a = $('<h1 />').append($('<span />').append($(this).contents()));
    $(this).replaceWith(a);
}

const tagTranslator = {
    "Incremental": "incremental",
    "ShowFirst": "show-first",
};

function interpretTags() {
    $("h1 span.tag span").each(function(){
                                   $(this).parent().parent().parent()
                                       .siblings().children("ul")
                                       .addClass(tagTranslator[$(this).text()]);
                               });
    $("li span.tag span").each(function(){
                                   $(this).parent()
                                       .siblings("ul")
                                       .addClass(tagTranslator[$(this).text()]);
                               });
    $("span.tag").remove();
}

function rewriteExternalLinks() {
    $("a").each(function(){
                    if ($(this).attr("href").match("^http://"))
                        $(this).attr("rel", "external");
                });
}

$(document).ready(function () {
                      $("div.outline-2").addClass("slide");
                      $("div.slide h2").each(formatSlideTitle);
                      interpretTags();
                      rewriteExternalLinks();
                  });
