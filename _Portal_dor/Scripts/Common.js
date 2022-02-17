function ShowBusca() {
    if (document.getElementById("search").style.display != "none") {
        document.getElementById("search").style.display = "none";
        document.getElementById("search").style.visibility = "hiddem";
        document.getElementById("btnSearch").style.display = "none";
        document.getElementById("btnSearch").style.visibility = "hiddem";
    }
    else {
        $("#cssmenu>ul").removeClass("open");
        document.getElementById("search").style.display = "block";
        document.getElementById("search").style.visibility = "visible";
        document.getElementById("btnSearch").style.display = "block";
        document.getElementById("btnSearch").style.visibility = "visible";
    }
}

$(document).ready(function () {
    $('h2.accordion').click(function () {
        $(this).next().slideToggle("slow");
    });
});
