
var m = 1;
var rowTempAttach = ['<tr class="item-rowdocuments">' +
            '<td align="center" onclick=""><button type="button" id="deleteRowdocument"><i class="fa fa-trash fa-lg-o"></i></button></td> ' +
            '<td><input class="input-file uniform_on"  id="attachmentReference" type="file" value="" name="attachmentReference" onchange="attachmentValidation(this);"></td>' +
            '</tr>'

].join('');


var p = 1;
var rowTempmt = ['<tr class="item-members" >' +
            '<td align="center" onclick=""><button type="button" id="deleteMembers"><i class="fa fa-trash fa-lg-o"></i></button></i></td>' +
            '<td><input class="form-control" autocomplete="off" name="enquirerCompany" maxlength="120" id="enquirerCompany" type="text" value="" onchange="uniqueCompany(this);">\n\
              <input type="hidden" name="SNO" value="">                    </td>' +
            '<td><select class="form-control" id="enquirerIndustry" name="enquirerIndustry">' +
            '<option value="" selected>Select your option</option>' +
            '<option>Construction</option>' +
            '<option>Hospital</option>' +
            '<option>Hotels</option>' +
            '<option>Oil and Gas</option>' +
            '<option>Camps</option>' +
            '<option>Airways</option>' +
            '<option>Others</option>' +
            '</select></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="companyDetails" id="companyDetails" value="" maxlength="200"></td>' +
            '<td><input type="email"  class="form-control " autocomplete="off" name="email" id="email" maxlength="100" value="" onchange="emailValidate(this);"></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off"  maxlength="11" minlength="8" name="phone" id="phone" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);"  value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="comremarks" id="memremarks" value="" maxlength="50"></td>' +
            '</tr>'

].join('');


/*
 Here's where we start adding rows to the invoice
 Add row to list and allow user to use autocomplete to find items.
 */


$("#addRowBtndocument").on('click', function (e) {
    mioInvoice.addRowattach();
    e.preventDefault();
});

$("#addMembers").on('click', function (e) {
    mioInvoice.addRow8();
    e.preventDefault();
});

$(document).on('click', '#deleteRowdocument', function () {
    mioInvoice.deleteRow3(this);
});


$(document).on('click', '#deleteMembers', function () {

    mioInvoice.deleteRow8(this);
});

/*
 Remove row when clicked
 */

