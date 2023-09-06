/*
 Here's where we start adding rows to the invoice
 Add row to list and allow user to use autocomplete to find items.
 */

$("#addRow").on('click', function (e) {
    inventory.addRow6();
    e.preventDefault();
});

$(document).on('click', '#deleteRow', function () {
    inventory.deleteRow(this);
});

var z = 1;
var rowTemp = [
    '<tr class="pointer">',
    '<td align="center" onclick=""><button type="button" id="deleteRow"><i class="fa fa-trash-o"></i></button></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="batchNo" id="batchNo" type="text" value="" ></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="expDate" id="expDate" type="text" value="" ></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemCode" id="itemCode" type="text" value="" ></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="purchaseType" id="purchaseType" type="text" value="" ></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="oQty" id="oQty"  type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="receiptQty" id="receiptQty" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="recQty" id="recQty" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="uom" id="uom" type="text" value=""></td>' +
            '</tr>'

].join('');