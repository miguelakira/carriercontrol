$(document).ready(function() {
    var heights = $(".well").map(function() {
        return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);

    $(".well").height(maxHeight);

    var panelHeights = $(".panel").map(function() {
        return $(this).height();
    }).get(),

    maxPanelHeight = Math.max.apply(null, panelHeights);

    $(".panel").height(maxPanelHeight);
});
