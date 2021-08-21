console.info("plp loaded.");

function logMapElements(value, key, map) {

  var table = $("#productTable");
    var row = $("<tr></tr>");

    var ref = $("<div></div>").append(value.ref);
    var td1 = $("<td style='text-align: center'></td>").append(ref);
    row.append(td1);

    var desc = $("<div></div>").append(value.description);
    var td2 = $("<td style='text-align: center'></td>").append(desc);
    row.append(td2);

    var pict = $("<div><img width='150px' src='image/"+value.picture+"'></div>");
    var td3 = $("<td style='text-align: center'></td>").append(pict);
    row.append(td3);

    var price = $("<div><b></b></div>").append(value.price);
    var td4 = $("<td style='text-align: center'></td>").append(price);
    row.append(td4);

    table.append(row);
}

$(document).ready(function () {

    let envir=location.hostname;
//    envir = envir.replaceAll("app-","").replaceAll(".cerberus-testing.org","").replaceAll("-test","");
    envir = envir.replace(/app-/g, '').replace(/.cerberus-testing.org/g, '').replace(/-test/g, '');

    if (location.hostname.replace(/.cerberus-testing.org/g, '').includes("-test")){
        env="-test";
    } else {
        env="";
    }
    $.ajax({url: "https://app-api" + env + ".cerberus-testing.org/data-" + envir + ".json",
        async: false,
        success: function (data) {
            console.info('success');
            console.info(data.content);
            data.content.forEach(logMapElements);

        }
    });


});
  
