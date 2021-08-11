console.info("app.js loaded.");

console.info("app.js loaded." + location.hostname);

$(document).ready(function () {

var host = location.hostname.replace('.cerberus-testing.org','');
$('#title').text(host);

$('#message').text("");


$("#enterButton").unbind("click").click(function () {
//console.info("clicked.");

    var checked = document.getElementById("acceptConsent").checked;
    if (checked){
        console.info("checked");
        location.href = "./plp.html";

    }else{
        $('#message').text("Please Accept the consent !!!");
        console.info("unchecked");
    }
});



});



