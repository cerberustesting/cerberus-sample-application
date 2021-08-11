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

    var desc = $("<div></div>").append(value.picture);
    var td3 = $("<td style='text-align: center'></td>").append(desc);
    row.append(td3);

    var desc = $("<div><b></b></div>").append(value.price);
    var td4 = $("<td style='text-align: center'></td>").append(desc);
    row.append(td4);

    table.append(row);
}

$(document).ready(function () {

    $.ajax({url: "https://app-api.cerberus-testing.org/data-fr.json",
        async: false,
        success: function (data) {
            console.info('success');
            console.info(data.content);
            data.content.forEach(logMapElements);

        }
    });


});



