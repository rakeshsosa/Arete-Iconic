// Define variables
//var lookupSelector = ''; // The ID selector to use for the autocomplete function
//var lookupInput = $(lookupSelector);
//var lookupvalue=document.getElementById('').value;
//var itemQtyPriceSelectors = ''; // The ID's used for the Price and Qty binding for updating price
//var filePath;

/*
 First, set the path to fetch items from database
 Initialize the lookup for the first input on the page
 */
//mioInvoice.setPathValue('../bill/imInventory.htm?item='+lookupvalue);
//mioInvoice.fetchItems(lookupInput);

/*
 Create an Array to for adding row in table. You'll want to make sure you have the same number of columns
 You will also want to make sure that your inputs match what's in the html current row.
 Also, be sure you have the correct id's for each input.
 */

var p = 1;
var rowTemp6 = ['<tr class="item-rowDay" >' +
            '<td align="center" onclick=""><button type="button"  id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td><select class="form-control" id="workDate1" name="workDate">' +
            ' <option></option>' +
            '</select></td>' +
            '<td><input class="form-control" autocomplete="off" placeholder="Select Lead" readonly="" name="leadName" id="leadName" type="text" value="" onclick="selectLeaddetailsMM(this);"></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" maxlength="30" name="source" id="source" value=""/>' +
            '<td><input type="text"  class="form-control" autocomplete="off" maxlength="30" name="remarks" id="remarks" value=""/>' +
            '<td><input type="text"  class="form-control" autocomplete="off" placeholder=""  name="followUp" id="followUp"  value=""/>' +
            '<td><input type="text"  class="form-control" autocomplete="off" maxlength="30" name="workWith" id="workWith" value=""/>' +
            '</tr>'
//    onclick="selectFollowupMonthly(this);"onclick = "selectFollowupMonthly(this);"

].join('');

var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}


var p = 1;
var rowTemp7 = ['<tr class="item-LeadPro" >' +
            '<td align="center" onclick=""><button type="button" id="deleteLeadPro"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="width:200px;" class="form-control" readonly placeholder="Select Product" maxlength="100" autocomplete="off" name="productName" id="nameEnquiry" onclick="selectItem(this);" type="text" value="" >\n\
                <input style="width:200px;" id="codeEnquiry" name="codeEnquiry" type="hidden" value="">\n\
                <input style="width:200px;" id="uomEnquiry" name="uomEnquiry" type="hidden" value="">\n\
                <input style="width:200px;" id="itemunitPrice" name="itemunitPrice" type="hidden" value=""></td>' +
            '<td><input style="width:200px;text-align:center;" type="text"  class="form-control" autocomplete="off" name="expectedObv" id="expectedObv" maxlength="15" onkeypress="return isNumberKey(event);" value="0"/>' +
            '<td><select style="width:200px;"class="form-control" id="priority" name="pri">' +
            '<option value="" selected>Select your option</option>' +
            '<option>Low</option>' +
            '<option>Medium</option>' +
            '<option>High</option>' +
            '</select></td>' +
            '<td><input style="width:200px;" type="text"  class="form-control" autocomplete="off" name="remarks" maxlength="200" id="remarks" value=""/>' +
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
            '<td><input type="email"  class="form-control " autocomplete="off" name="email" id="email" maxlength="100" value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off"  maxlength="11" minlength="8" name="phone" id="phone" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);"  value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="comremarks" id="memremarks" value="" maxlength="50"></td>' +
            '</tr>'

].join('');

var p = 1;
var rowTempmt1 = ['<tr class="item-members1" >' +
            '<td align="center" onclick=""><button type="button" id="deleteMembers1"><i class="fa fa-trash fa-lg-o"></i></button></i></td>' +
            '<td><input class="form-control" autocomplete="off" name="enquirerCompany" maxlength="120" id="enquirerCompany" type="text" value="" onchange="uniqueCompany(this);">\n\
        </td>' +
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
            '<td><input type="email"  class="form-control " autocomplete="off" name="email" id="email" maxlength="100" value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off"  maxlength="11" minlength="8" name="phone" id="phone" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);"  value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="memremarks" id="memremarks" value="" maxlength="50"></td>' +
            '</tr>'

].join('');


var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}


var p = 1;
var rowTemp9 = ['<tr class="item-LeadPro1" >' +
            '<td align="center" onclick=""><button type="button" id="deleteLeadPro1"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="width:200px;" class="form-control" readonly maxlength="100" name="division" id="division" value="" >\n\
            <input class="form-control" readonly maxlength="100" name="leadCode" id="leadCode" value="" ></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="firstName" id="firstName" value="" >\n\
                 <input type="text"  class="form-control" autocomplete="off" name="lastName" id="lastName" value="" >\n\
                 <input type="text"  class="form-control" autocomplete="off" name="salutation" id="salutation" value="" ></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="leadStatus" id="leadStatus" value="" ></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="leadSource" id="leadSource" value="" ></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="address1" id="address1" value="" ></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="mobile" id="mobile" value="" ></td>' +
            '</tr>'

].join('');


var p = 1;
var rowMetng = ['<tr class="item-meeting" >' +
            '<td align="center" onclick=""><button type="button  id="deleteMeeting"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td><input style="width:250px;" class="form-control validate[required]" autocomplete="off" name="MinDescription" maxlength="50" id="MinDescription" type="text" value="" >\n\
                 </td>' +
            '<td><input style="width:250px;" type="text"  class="form-control validate[required]" autocomplete="off" name="ActDescription" id="ActDescription" value="" maxlength="50"></td>' +
            '<td><input style="width:250px;" type="text"  class="form-control " autocomplete="off" name="Responsibilty" id="Responsibilty" maxlength="50" value=""></td>' +
            '<td><input style="width:250px;" class="form-control" readonly required autocomplete="off" onclick="selecttargetdates(this);" name="tergetDate" id="tergetDate" type="text" value=""></td>' +
            '</tr>'

].join('');


var addup;
try {
    addup = callcategoryconvert();
} catch (error) {
    addup;
}


var p = 1;
var rowTempConvert = ['<tr class="item-LeadProConvert" >' +
            '<td align="center" onclick=""><button type="button" id="deleteLeadProConvert"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input class="form-control validate[required]" readonly placeholder="Select Product" maxlength="100" autocomplete="off" name="productName" id="nameEnquiry" onclick="selectItem(this);" type="text" value="" >\n\
                <input id="codeEnquiry" name="codeEnquiry" type="hidden" value="">\n\
                <input id="uomEnquiry" name="uomEnquiry" type="hidden" value="">\n\
                <input id="itemunitPrice" name="itemunitPrice" type="hidden" value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="expectedObv" id="expectedObv" maxlength="15" onkeypress="return isNumberKey(event);" value="0"/>' +
            '<td><select class="form-control" id="priority" name="pri">' +
            '<option value="" selected>Select your option</option>' +
            '<option>Low</option>' +
            '<option>Medium</option>' +
            '<option>High</option>' +
            '</select></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="remarks" maxlength="200" id="remarks" value=""/>' +
            '</tr>'

].join('');


var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var z = 1;
var rowService = [
    '<tr class="service-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input class="form-control" style="width:200px;" readonly placeholder="Select Service Name" maxlength="100" autocomplete="off" name="nameService" id="nameService" onclick="selectService(this);" type="text" value="" >\n\
            <input style="width:200px;text-align:center;" class="form-control" readonly maxlength="100"  autocomplete="off" name="codeService" id="codeService"  onkeypress="" type="hidden" value="">\n\
            <input style="width:200px;text-align:center;" class="form-control" readonly autocomplete="off"  name="uomService" id="uomService" type="hidden" >\n\
            <input style="width:200px;text-align:center;" class="form-control" name="serviceunitPrice" readonly  id="serviceunitPrice" type="hidden" ></td>' +
            '<td><input type="text" style="width:200px;text-align:center;" class="form-control" autocomplete="off" name="expectedObv" id="expectedObv" maxlength="15" onkeypress="return isNumberKey(event);" value="0"/>' +
            '<td><select class="form-control" id="priority" name="pri" style="width:200px;">' +
            '<option value="" selected>Select your option</option>' +
            '<option>Low</option>' +
            '<option>Medium</option>' +
            '<option>High</option>' +
            '</select></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" name="remarks" maxlength="200" id="remarks" value="" style="width:200px;"/>' +
            '</tr>'


].join('');


var p = 1;
var rowSponsor = ['<tr class="sponsorClass" >' +
            '<td align="center" onclick=""><button type="button" id="deleteSponsor"><i class="fa fa-trash fa-lg-o"></i></button></i></td>' +
            '<td><input class="form-control" autocomplete="off" name="sponsorName" style="width:250px;" maxlength="50" id="sponsorName" type="text" value="">\n\
        </td>' +
            '<td><input class="form-control" readonly placeholder="Select Date" style="width:250px;" autocomplete="off" onclick="selectsponsordates(this);" name="sponsoredDate" id="sponsoredDate" type="text" value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" style="width:250px;"  maxlength="50" name="contribution" id="contribution" value=""></td>' +
            '<td><input type="text"  class="form-control" autocomplete="off" style="width:250px;" name="returnToContribution" id="returnToContribution" value="" maxlength="50"></td>' +
            '</tr>'

].join('');
/*
 We are overriding the autocomplete UI menu styles to create our own.
 You can add information from the returned json array as needed
 Just be sure that your array contains the correct value when returned
 You'll want to modify the ajax-services/fetch-inventory.php file for the returned values
 */
//$.ui.autocomplete.prototype._renderItem = function (ul, item) {
//      return $("<li></li>")
//        .data("item.autocomplete", item)
//
//        // This is the autocomplete list that is generated
//        .append("<a class='additionalInfo'>" + item.itemName + " - " +item.itemDesc+ " " +
//
//            // This is the hover box that is generated when you hover over an item in the list
//            "</a>")
//
//        .appendTo(ul);
//};

/*
 Here's where we start adding rows to the invoice
 Add row to list and allow user to use autocomplete to find items.
 */


$("#addRowDay").on('click', function (e) {
    mioInvoice.addRow6();
    checkdate();
    e.preventDefault();
});

$("#addLeadProBtn").on('click', function (e) {
    mioInvoice.addRow7();
    e.preventDefault();
});

$("#addMembers").on('click', function (e) {
    mioInvoice.addRow8();
    e.preventDefault();
});

$("#addMembers1").on('click', function (e) {
    mioInvoice.addRow81();
    e.preventDefault();
});


$("#addMeeting").on('click', function (e) {
    mioInvoice.addMetng();
    e.preventDefault();
});

$("#addLeadProBtnconvert").on('click', function (e) {
    mioInvoice.addConvert();
    e.preventDefault();
});

$("#addServiceBtn").on('click', function (e) {
    mioInvoice.addService();
    e.preventDefault();
});
$("#addSponsorBtn").on('click', function (e) {
    mioInvoice.addSponsor();
    e.preventDefault();
});
/*
 Remove row when clicked
 */

$(document).on('click', '#deleteDay', function () {
    mioInvoice.deleteRow6(this);
});


$(document).on('click', '#deleteLeadPro', function () {
    mioInvoice.deleteRow7(this);
});

$(document).on('click', '#deleteMembers', function () {
    mioInvoice.deleteRow8(this);
});

$(document).on('click', '#deleteMembers1', function () {
    mioInvoice.deleteRow81(this);
});
$(document).on('click', '#deleteMembersedit', function () {
    alert("You cannot delete this row !\nAs Lead is already created");
    return false;
    mioInvoice.deleteRowedit(this);
});

$(document).on('click', '#deleteLeadPro1', function () {
    var $itemRow = $(this).closest('tr');
    var a = $itemRow.find("#leadCode").val();
    mioInvoice.deleteRow9(this, a);
});


$(document).on('click', '#deleteMeeting', function () {
    mioInvoice.deltMeetng(this);
});

$(document).on('click', '#deleteLeadProConvert', function () {
    mioInvoice.deltConvert(this);
});

$(document).on('click', '#deleteService', function () {
    mioInvoice.deleteService(this);
});
$(document).on('click', '#deleteSponsor', function () {
    mioInvoice.deleteSponsor(this);
});
//$('#saveInvoiceBtn').on('click', function (e) {
//
//    $(window).unbind("beforeunload");
//
//
//    /*  Use this to save the post data to the database using ajax */
//
////    var postData = $("#invoiceForm").serialize();
////
////    alert(postData);
////
////    $.post("ajax-services/post-data.php", { data: postData })
////        .done(function (data) {
////            alert("Post Data: " + data);
////        });
////
////    e.preventDefault();
//
//});

/*
 We don't want the user to leave the page if they have started working with it so we set the
 onbeforeload method
 */
$('body').on("focus", lookupSelector, function () {
    $(window).bind('beforeunload', function () {
        return "You haven't saved your data.  Are you sure you want to leave this page without saving first?";
    });
});
/*
 Helpers
 */

var deleteConfirm = function (msg) {
    var a = confirm(msg);
    if (a) {
        return true;
    } else {
        return false;
    }
};
// Show loader when PDF is being generated.
$(document).on("click", '#genPDFbtn', function () {
    $("#loader").show();
});
/*
 Destroy the modal content ** WE NEED THIS ** This prevents the modal from having the same information
 loaded when opening it when separate information.
 */
$(document.body).on('hidden.bs.modal', function () {
    $('#myModal').removeData('bs.modal')
});
/*
 
 Allow for inline editing
 
 */

/*
 This saves the values to the hidden input for the inout we are modifying.
 */
$(document).on("keyup", 'input.editbox', function () {
// Get the value for the selected input on every key up
    var thisValue = $(this, 'input').val();
    var selectedName = $(this, 'input').attr('id');
    $("input[name=" + selectedName + "]").val(thisValue);
});
function divClicked() {
    var divHtml = $(this).html();
    var selectName = $(this).attr("id");
    var editableText = $('<input id="' + selectName + '" class="form-control input-sm editbox" type="text">');
    editableText.val(divHtml);
    $(this).replaceWith(editableText);
    editableText.focus();
    // setup the blur event for this new input area
    editableText.blur(function () {
        var html = $(this).val();
        var viewableText = $('<div class="edit" id="' + selectName + '">');
        viewableText.html(html);
        $(this).replaceWith(viewableText);
        // setup the click event for this new div
        viewableText.click(divClicked);
    });
}

$(document).ready(function () {
    $(document).on('input[type=text]').bind("cut copy paste", function (e) {
        e.preventDefault();
    });

});
