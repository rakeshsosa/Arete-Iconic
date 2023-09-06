/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deleteRow(btndel) {
    if ($("tr").length <= 2) {
        alert('You cannot delete this row');
        return false;
    } else {
        $(btndel).closest("tr").remove();
        return true;
    }
}

function changeAction(val) {
    if (val != "blank") {
        for (var i = 1; i <= 50; i++) {
            document.getElementById(val + i).checked = true;
        }
    } else {
        for (var i = 1; i <= 50; i++) {
            document.getElementById("rev" + i).checked = false;
            document.getElementById("rej" + i).checked = false;
            document.getElementById("hold" + i).checked = false;
        }
    }
}
function changecAction(val) {
    if (val != "blank") {
        for (var i = 1; i <= 50; i++) {
            document.getElementById(val + i).checked = true;
        }
    } else {
        for (var i = 1; i <= 50; i++) {
            document.getElementById("rev1" + i).checked = false;
            document.getElementById("rej1" + i).checked = false;
            document.getElementById("hold1" + i).checked = false;
        }
    }
}

function check_digit(e, obj, intsize, deczize) {
    var keycode;

    if (window.event)
        keycode = window.event.keyCode;
    else if (e) {
        keycode = e.which;
    }
    else {
        return true;
    }

    var fieldval = (obj.value),
            dots = fieldval.split(".").length;

    if (keycode == 46) {
        return dots <= 1;
    }
    if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
        // back space, tab, delete, enter 
        return true;
    }
    if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
        return false;
    }
    if (fieldval == "0" && keycode == 48) {
        return false;
    }
    if (fieldval.indexOf(".") != -1) {
        if (keycode == 46) {
            return false;
        }
        var splitfield = fieldval.split(".");
        if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
            return false;
    } else if (fieldval.length >= intsize && keycode != 46) {
        return false;
    } else {
        return true;
    }
}

function isNumberKey1(evt) {
    debugger;
    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
        return false;
    return true;
}

function isNumberKey2(evt) {
    debugger;
    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
        return false;
    return true;
}

function isNumberKey(evt) {
    debugger;
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
        return false;
    }
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function isNumberKeyPhone(evt) {
    debugger;
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function isNumberKeyfalse(evt) {
    return false;
}
function  getItemSubCat($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    $itemRow.attr('id', "sno" + rowCount);
    var rowid1 = "sno" + rowCount;
    var itemCat = $($itemRow).find("#itemCat").val();


    $.ajax
            ({
                type: "POST",
                url: '../itemmaster/getItemSubCat.htm',
                data: {
                    itemCat: itemCat
                },
                success: function (data) {
                    //alert(data);
                    displayitmSubCat(data, $itemRow);
                    //$('#itemsubCat').val(data);
                }
            });

}
function displayitmSubCat(data, $itemRow)
{
    if (data != null) {

        var itemV = $($itemRow).find("#itemsubCat");
        //.find('#${row} #itemId')
        $(itemV).html("");

        var nameArray = data.split(",");
        var toAppend = '';

        toAppend += '<option value="">Select an Option</option>';
        for (var i = 0; i < nameArray.length - 1; i++) {
            if (nameArray != null) {
                toAppend += '<option>' + nameArray[i] + '</option>';
            }
        }
        $(itemV).append(toAppend);

    }
    else {
        alert("error");
    }

}
function radioCheck1() {

    if ($("#billtable :radio").is(":checked") && $("#comtable :radio").is(":checked")) {
        var x = '';
        //var len=$(":radio").is(":checked").length;

        var table1 = document.getElementById("billtable");
        var table2 = document.getElementById("comtable");
        var tlen = table1.rows.length;
        var clen = table2.rows.length;
        var len = $('#billtable :radio:checked').length;
        var ten = $('#comtable :radio:checked').length;
        if (tlen != len) {
            alert("Please select the radio button2");
            return false;
        }
        else if (clen != ten)
        {
            alert("Please select the radio button3");
            return false;
        }
        else {
            $("#retailBill").submit();
        }
    }
    else {
        alert("Please select the radio button1");
        return false;
    }
}
function radioCheck(val) {
    $("#statusForm").val(val);
    $("#retailBill").submit();
}


function selectdates($this) {
    var $itemRow = $($this).closest('tr');
    var row_index = $($this).closest("tr")[0].rowIndex;
    $this.id = 'requiredenquiryDate' + row_index;
    NewCssCal('requiredenquiryDate' + row_index, 'ddMMMyyyy', '', '', '', '', 'future');
}
function selectdates1($this) {
    var $itemRow = $($this).closest('tr');
    var row_index = $($this).closest("tr")[0].rowIndex;
    $this.id = 'requiredserviceDate' + row_index;
    NewCssCal('requiredserviceDate' + row_index, 'ddMMMyyyy', '', '', '', '', 'future');
}
function enqviewMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var enqNo = $("#enqNo").val();
    var quoteNo = $("#salesquoteNo").val();
    var pkItem = $itemRow.find('#pkItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var MenuItem = $itemRow.find('#nameEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&action=view&ono=-1&sn1=-1&sn=" + pkItem + "&rowid=" + rowid1 + "&enqNo=" + enqNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var enqNo = $("#enqNo").val();
    var quoteNo = $("#salesquoteNo").val();
    var pkItem = $itemRow.find('#pkItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var MenuItem = $itemRow.find('#nameEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=-1&sn1=-1&sn=" + pkItem + "&rowid=" + rowid1 + "&enqNo=" + enqNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectquotMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var enqNo = $("#enqNo").val();
    var quoteNo = $("#salesquoteNo").val();
    var pkItem = $itemRow.find('#dipkItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var MenuItem = $itemRow.find('#nameEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=-1&sn1=" + pkItem + "&sn=-1&rowid=" + rowid1 + "&enqNo=" + enqNo + "&quoteNo=" + quoteNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectviewMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var quoteNo = $("#salesquoteNo").val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var MenuItem = $itemRow.find('#nameEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=-1&action=view&rowid=" + rowid1 + "&quoteNo=" + quoteNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectorderMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var orderNo = $("#salesorderNo").val();
    var pkItem = $itemRow.find('#diorderItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=" + pkItem + "&sn1=-1&sn=-1&rowid=" + rowid1 + "&orderNo=" + orderNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectorderdiMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var orderNo = $("#salesorderNo").val();
    var pkItem = $itemRow.find('#diorderItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=" + pkItem + "&sn1=-1&sn=-1&rowid=" + rowid1 + "&orderNo=" + orderNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectshipMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var ssNo = $("#ssNo").val();
    var pkItem = $itemRow.find('#diorderItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?menuref=" + menuref + "&ono=" + pkItem + "&sn1=-1&sn=-1&rowid=" + rowid1 + "&orderNo=" + ssNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectshipviewMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var ssNo = $("#ssNo").val();
    var pkItem = $itemRow.find('#diorderItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?action=view&menuref=" + menuref + "&ono=" + pkItem + "&sn1=-1&sn=-1&rowid=" + rowid1 + "&orderNo=" + ssNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function selectorderviewMenu($this) {
    var $itemRow = $($this).closest('tr');
    var rowCount = ($($this).closest("tr")[0].rowIndex);
    var orderNo = $("#salesorderNo").val();
    var pkItem = $itemRow.find('#diorderItem').val();
    var MenuName = $itemRow.find('#codeEnquiry').val();
    var stat = $itemRow.find('#menueditStatus').val();
    var menuref = $itemRow.find('#menuReference').val();
    $itemRow.attr('id', "row" + rowCount);
    var rowid1 = "row" + rowCount;
    myWindow = window.open("../sales/SalesMenuList.htm?action=view&menuref=" + menuref + "&ono=" + pkItem + "&sn1=-1&sn=-1&rowid=" + rowid1 + "&orderNo=" + orderNo + "&nameMenu=" + MenuName + "&stat=" + stat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}


function checkvalue() {
    $("tr.item-enquiry").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid = $itemRow.find('#complementaryCode');
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $(checkid).val('TRUE');
        } else {
            $(checkid).val('FALSE');

        }

    });
    $("tr.service-enquiry").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid1 = $itemRow.find('#complementaryService');
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $(checkid1).val('TRUE');
        } else {
            $(checkid1).val('FALSE');

        }
    });
    $("tr.item-quote").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid = $itemRow.find('#complementaryCode');
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $(checkid).val('TRUE');
        } else {
            $(checkid).val('FALSE');

        }
    });
    $("tr.service-quote").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid1 = $itemRow.find('#complementaryService');
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $(checkid1).val('TRUE');
        } else {
            $(checkid1).val('FALSE');

        }
    });
    $("tr.item-order").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid = $itemRow.find('#complementaryCode');
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $(checkid).val('TRUE');
        } else {
            $(checkid).val('FALSE');

        }
    });
    $("tr.service-order").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid1 = $itemRow.find('#complementaryService');
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $(checkid1).val('TRUE');
        } else {
            $(checkid1).val('FALSE');

        }
    });
    $("tr.item-ship").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid = $itemRow.find('#complementaryCode');
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $(checkid).val('TRUE');
        } else {
            $(checkid).val('FALSE');

        }
    });
    $("tr.service-ship").each(function () {
        var $itemRow = $(this).closest('tr');
        var checkid1 = $itemRow.find('#complementaryService');
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $(checkid1).val('TRUE');
        } else {
            $(checkid1).val('FALSE');

        }
    });



    if ($("#intern").prop('checked') == true) {
        $("#internalEmp").val('YES');
    } else {
        $("#internalEmp").val('NO');

    }
}
function generateNumber() {

    var timestamp = (Date.now().toString(36) + Math.random().toString(36).substr(2, 5)).toUpperCase();
    var ref = $("#menuReference").val();
    if (ref == "" || ref == null) {
        $("#menuReference").val(timestamp);
    }
}

var GenRandom = {
    Stored: [],
    Job: function () {
        var newId = Date.now().toString().substr(6); // or use any method that you want to achieve this string
        alert(newId);
        if (!this.Check(newId)) {
            this.Stored.push(newId);
            return newId;
        }

        return this.Job();
    },
    Check: function (id) {
        for (var i = 0; i < this.Stored.length; i++) {
            if (this.Stored[i] == id)
                return true;
        }
        return false;
    }

};

$("#enquiryStatus").change(function () {
    mioInvoice.updatebothTotal();
    var thisval = $(this).val();
    if (thisval == "") {
        $("#employeeDiv").hide();
        $("#employeeDiv :input").prop('required', null);
        $("#leadDiv").hide();
        $("#leadDiv :input").prop('required', null);

    }
    if (thisval == 'Internal') {

        $("#leadDiv").hide();
        $("#leadDiv :input").prop('required', null);
        $("#employeeDiv").show();
        $("#leadDiv :input").val("");
        $("#custType").html("<option>Internal Employee</option>");
        $("#contactDetails").val("");
        $('#quotDiscount').val("20.00");


    }
    if (thisval == 'General') {
        $("#employeeDiv").hide();
        $("#employeeDiv :input").prop('required', null);
        $("#leadDiv").show();
        $("#custType").html("<option value='' selected>Select an option</option><option value='Government'>Government</option><option value='Private'>Private</option>");
        $("#employeeDiv :input").val("");
        $("#contactDetails").val("");
        $('#quotDiscount').val("0.00");
    }
});
$(document).on('click', '#shipcheck', function () {
    if ($(this).prop('checked') == true) {
        $("#shiptoAddress").val($("#billtoAddress").val());
    }
    else {
        $("#shiptoAddress").val("");
    }
});
$("#orderType").change(function () {
    var thval = $(this).val();
    if (thval == "Scheduled" || thval == "Contract") {
        $("#contractDiv").show();
    }
    else {
        $("#contractDiv").hide();
    }
});

//$(document).on('click', '#leadName', function () {
//    selectLead();
//});
$(document).on('change', '#personType', function () {
    $("#leadName").val("");
    $("#custType").html("<option value='' selected>Select an option</option><option value='VIP'>VIP</option><option value='VVIP'>VVIP</option><option value='Regular'>Regular</option><option value='Walk-In'>Walk-In</option>");
    $("#contactDetails").val("");
    $("#billtoAddress").val("");
    $("#shiptoAddress").val("");
});
function selectLead()
{
    var pType = $("#personType").val();
    if (pType) {

        myWindow = window.open("../sales/leadcodeFetch.htm?pType=" + pType, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }
    else {
        alert("Select contact type");
    }
}
function selectemployee(mask)
{


    myWindow = window.open("../sales/selectEmployeeDetails.htm?divisionDD=" + z + "&mask=" + mask, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

}



$('#vehicleNo').keyup(function () {
    this.value = this.value.toUpperCase();
});

function dateconvert(input) {
    var date = input.split("-");
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    for (var j = 0; j < months.length; j++) {
        if (date[1] == months[j]) {
            date[1] = months.indexOf(months[j]) + 1;
        }
    }
    if (date[1] < 10) {
        date[1] = '0' + date[1];
    }
    var formattedDate = date[2] + "-" + date[1] + "-" + date[0];
    return formattedDate;
}

function todayDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }

    today = dd + '-' + mm + '-' + yyyy;
    return today;

}
$(document).ready(function () {

    $(document).on('input[type=text]').bind('cut copy paste', function (e) {
        e.preventDefault(); //disable cut,copy,paste
    });

});

// menu and service hide

function menuShow() {
    $("#menuDiv").show();
    mioInvoice.updatebothTotal();
    $("#menuFlag").val("YES");
    $("#m_butt_id").hide();
    $("#menuDiv :input").prop('disabled', false);
}
function serviceShow() {
    $("#s_butt_id").hide();
    $("#serviceMenu").show();
    $("#serviceFlag").val("YES");
    mioInvoice.updatebothTotal();
    $(".req").prop('disabled', false);
}
function menuHide() {

    var flag = $("#serviceFlag").val();
    if (flag != "NO") {
        $("#menuDiv").hide();
        $("#m_butt_id").show();
        menuHeadHide();
        $("#menuFlag").val("NO");
        $("#menuDiv :input").prop('disabled', true);
        $('#itmTot').val("0.0");
        $('#noofreitems').val("0");
        mioInvoice.updatebothTotal();

    }
    else {
        alert("You cannot proceed without service or menu");
    }
}
function serviceHide() {
    var flag = $("#menuFlag").val();
    if (flag != "NO") {
        $("#s_butt_id").show();
        $("#serviceMenu").hide();
        $('#noofreService').val("0");
        $("#serviceFlag").val("NO");
        $("#serviceMenu :input").prop('required', null);
        $('#totalserviceAmount').html("0.0");
        $('#serTot').val("0.0");
        mioInvoice.updatebothTotal();
        $(".req1").prop('disabled', true);
        serviceHeadHide();
    }
    else {
        alert("You cannot proceed without menu and services");
    }
}
function menuHeadShow() {
    $("#menuHead").show();
    $("#menuHead :input").prop('disabled', false);
    mioInvoice.updatebothTotal();
}
function menuHeadHide() {
    $("#menuHead").hide();
    $("#menuHead :input").prop('disabled', true);
    mioInvoice.updatebothTotal();
}
function serviceHeadShow() {
    $("#serviceHead").show();
    $(".req1").prop('disabled', false);
    mioInvoice.updatebothTotal();
}
function serviceHeadHide() {
    $("#serviceHead").hide();
    $(".req1").prop('required', false);
    $(".req1").prop('disabled', true);
    mioInvoice.updatebothTotal();
}

$(document).on('change', '#categoryEnq', function () {
    var $itemRow = $(this).closest('tr');
    $itemRow.find('#codeEnquiry').val("");
    $itemRow.find('#codeEnquiry').prop('placeholder', 'Select Menu');
    $itemRow.find('#nameEnquiry').val("");
    $itemRow.find('#portionQty').val("");
    $itemRow.find('#uomEnquiry').val("");

});
$(document).on('change', '#categoryService', function () {
    var $itemRow = $(this).closest('tr');
    $itemRow.find('#codeService').val("");
    $itemRow.find('#codeEnquiry').prop('placeholder', 'Select Service');
    $itemRow.find('#nameService').val("");
    $itemRow.find('#uomService').val("");
    $itemRow.find('#serviceQty').val("");
});
function selectContInfo()
{
    var personType = $("#personType").val();
    var leadName = $("#leadCode").val();
    if (personType != "" && leadName != "") {
        myWindow = window.open("../sales/contactInfo.htm?personType=" + personType + "&comp=" + leadName, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }
    else {
        alert("Select enquiry type as General,contact type and name");
    }

}

function selectMenuCostAnalysis()
{
    var salesquoteNo = $("#salesquoteNo").val();

    myWindow = window.open("../sales/SalesMenuCostAnalysis.htm?salesquoteno=" + salesquoteNo, "PopWindow3", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");


}
$(document).on('click', '#campCheck', function () {

    var $itemRow = $(this).closest('tr');
    if ($(this).prop('checked') == true) {
        campCalculation($itemRow);
    }
    else {
        $itemRow.find('#checkValue').val("");
        $itemRow.find('#checkValue1').val("");
        campCalculation($itemRow);
    }
});
function campCalculation($itemRow) {

    //expense part
    var amountTot = 0;
    var camps = $itemRow.find('#campService').val();
    var catValue1 = $('#catValue1').val();
    var amtCamp = $('#amtCamp').val();
    var names = [];
    names.push(catValue1);
    $('tr#campIterate').each(function () {
        var $itemRow1 = $(this).closest('tr');
        if ($($itemRow1.find("#campCheck")).prop('checked') == true) {
            $itemRow.find('#checkValue').val(camps);
            var catValue = $itemRow1.find('#catValue').val();
            var amtValue = $itemRow1.find('#amtValue').val();
            amountTot = parseFloat(amountTot) + parseFloat(amtValue);
            names.push(catValue);
        }
    });
    var uniqueNames = [];
    $.each(names, function (i, el) {
        if ($.inArray(el, uniqueNames) === -1)
            uniqueNames.push(el);
    });
    $("#totValue").val(uniqueNames);
    var valTot = parseFloat(amountTot) + parseFloat(amtCamp);
    $("#totAmount").val(parseFloat(valTot).toFixed(3));
    //deduction part

    var amountTot1 = 0;
    var camps1 = $itemRow.find('#dedCategory').val();
    var dedVal2 = $itemRow.find('#dedValue1').val();
    var dedVal3 = $itemRow.find('#dedValue').val();
    if (dedVal2 == "" || dedVal3 == "") {
        $itemRow.find("#campCheck").prop('checked', false);
        return false;
    }
    var names1 = [];
    $('tr#dedCat').each(function () {
        var $itemRow2 = $(this).closest('tr');
        if ($($itemRow2.find("#campCheck")).prop('checked') == true) {
            $itemRow.find('#checkValue1').val(camps1 + "///" + dedVal3 + "///" + dedVal2.toUpperCase() + "///" + "Ded");
            var dedValue1 = $itemRow2.find('#dedValue1').val();
            var dedValue = $itemRow2.find('#dedValue').val();
            amountTot1 = parseFloat(amountTot1) + parseFloat(dedValue);
            names1.push(dedValue1.toUpperCase());
        }
    });

    var uniqueNames1 = [];
    $.each(names1, function (i, el) {
        if ($.inArray(el, uniqueNames1) === -1)
            uniqueNames1.push(el);
    });
    $("#dedValueX").val(uniqueNames1);
    $("#dedAmountX").val(amountTot1);

    var totAmount = $("#totAmount").val();
    var dedAmountX = $("#dedAmountX").val();
    var totCampValu = parseFloat(totAmount) - parseFloat(dedAmountX);
    $("#totCampVal").val(totCampValu.toFixed(3));
}

function campCalculation1() {

    //expense part
    var amountTot = 0;
    var catValue1 = $('#catValue1').val();
    var amtCamp = $('#amtCamp').val();
    var names = [];
    names.push(catValue1);
    $('tr#campIterate').each(function () {
        var $itemRow1 = $(this).closest('tr');
        if ($($itemRow1.find("#campCheck")).prop('checked') == true) {
            var catValue = $itemRow1.find('#catValue').val();
            var amtValue = $itemRow1.find('#amtValue').val();
            amountTot = parseFloat(amountTot) + parseFloat(amtValue);
            names.push(catValue);
        }
    });
    var uniqueNames = [];
    $.each(names, function (i, el) {
        if ($.inArray(el, uniqueNames) === -1)
            uniqueNames.push(el);
    });
    $("#totValue").val(uniqueNames);
    $("#totAmount").val(parseFloat(amountTot) + parseFloat(amtCamp));

    var totAmount = $("#totAmount").val();
    var dedAmountX = $("#dedAmountX").val();
    $("#totCampVal").val(parseFloat(totAmount));
}

$(document).on('keyup', '#dedValue1', function () {
    var $this = $(this);
    var finVal = $(this).val().toUpperCase();
    $("input#campService").each(function () {
        var thisVal = $(this).val().split("///");
        if (thisVal[3] == "Add") {
            if (finVal == thisVal[2]) {
                alert("The category letter already selected");
                $($this).val("");
            }
        }

    });
});
$(document).on('keyup', '#salespersonName', function () {
    var finVal = $(this).val();
    $("#salespersonId").val(finVal);

});


function getTxnMenu(type, txnNumber, txnType) {
    var myWindow = null;
    myWindow = window.open("../sales/SalesTxnHistoryPop.htm?type=" + type + "&txnNum=" + txnNumber + "&txnType=" + txnType, "PopWindow1", "width=1200, height=300, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function getQuotTxnMenu(type, txnNumber, txnType) {
    var myWindow = null;
    myWindow = window.open("../sales/SalesQuotTxnHistoryPop.htm?type=" + type + "&txnNum=" + txnNumber + "&txnType=" + txnType, "PopWindow1", "width=1200, height=300, menubar=no,location=no,target=_blank,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

function orderOtherDiv() {
    var orderT = $("#orderType").val();
    if (orderT == "Others") {
        $("#orderotherDiv").show();
    }
    else {
        $("#orderotherDiv").hide();
        $("#orderOthers").val("");
    }
}
function eventOtherDiv() {
    var orderT1 = $("#eventType").val();
    if (orderT1 == "Others") {
        $("#eventotherDiv").show();
    }
    else {
        $("#eventotherDiv").hide();
        $("#eventOthers").val("");
    }
}

            