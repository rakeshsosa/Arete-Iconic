/**
 * Functions that handle fetching the invoice items coming from the database
 * @type {{fetchItems: Function,
 *          updatePrice: Function,
 *          updateTotal: Function,
 *          addRow: Function,
 *          deleteRow: Function,
 *          roundNumber: Function,
 *          setPathValue: Function}};
 */

var mioInvoice = {
    /**
     * Add row to invoice to allow for additional items
     * @param lookupSelector
     */


    addRow6: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#DayTable');
        var $row5 = $(rowTemp6);

        // Add row after the first row in table
        $('.item-rowDay:last', $itemsTable5).after($row5);

    },
    addRow7: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#LeadProtable');
        var $row5 = $(rowTemp7);

        // Add row after the first row in table
        $('.item-LeadPro:last', $itemsTable5).after($row5);

    },
    addRow8: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#membertable');
        var $row5 = $(rowTempmt);

        // Add row after the first row in table
        $('.item-members:last', $itemsTable5).after($row5);

    },
    addRow81: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#membertable1');
        var $row5 = $(rowTempmt1);

        // Add row after the first row in table
        $('.item-members1:last', $itemsTable5).after($row5);

    },
    addMetng: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#meetingtable');
        var $row5 = $(rowMetng);

        // Add row after the first row in table
        $('.item-meeting:last', $itemsTable5).after($row5);

    },
    addConvert: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#LeadProtableConvert');
        var $row5 = $(rowTempConvert);

        // Add row after the first row in table
        $('.item-LeadProConvert:last', $itemsTable5).after($row5);

    },
    addService: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable6 = $('#serviceenquirytable');
        var $row6 = $(rowService);

        // Add row after the first row in table
        $('.service-enquiry:last', $itemsTable6).after($row6);

    },
    addSponsor: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable6 = $('#sponsortable');
        var $row6 = $(rowSponsor);

        // Add row after the first row in table
        $('.sponsorClass:last', $itemsTable6).after($row6);

    },
    /**
     * Delete row if we have more than one row in table
     * @param row
     * @returns {boolean}
     */


    deleteRow6: function (row) {
        var rowCount = $('#DayTable tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-rowDay').remove();
            if ($(".item-rowDay").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow7: function (row) {
        var rowCount = $('#LeadProtable tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-LeadPro').remove();
            if ($(".item-LeadPro").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow8: function (row) {
        var rowCount = $('#membertable tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-members').remove();
            if ($(".item-members").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow81: function (row) {
        var rowCount = $('#membertable1 tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-members1').remove();
            if ($(".item-members1").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow9: function (row, a) {
        var rowCount = $('#LeadProtable1 tr').length;
        var rowCountConvert = $('#LeadProtableConvert tr').length;
        $("tr.item-LeadProConvert").each(function () {
            var $itemRow = $(this).closest('tr');
            var b = $itemRow.find('#leadCode').val();
            if (a === b) {
                if (rowCountConvert != 2) {
                    $(row).parents('.item-LeadProConvert').remove();
                    if ($(".item-LeadProConvert").length < 2) //$("#deleteRow").hide();
                        return true;


                } else {
//            alert('You cannot delete this row');
                    return false;
                }
                $(this).closest('tr').remove();
            }

        });

        if (rowCount != 2) {
            $(row).parents('.item-LeadPro1').remove();
            if ($(".item-LeadPro1").length < 2) //$("#deleteRow").hide();
                return true;


        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deltMeetng: function (row) {
        var rowCount = $('#meetingtable tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-meeting').remove();
            if ($(".item-meeting").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deltConvert: function (row) {
        var rowCount = $('#LeadProtableConvert tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-LeadProConvert').remove();
            if ($(".item-LeadProConvert").length < 2) //$("#deleteRow").hide();
                this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteService: function (row) {
        var rowCount = $('#serviceenquirytable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.service-enquiry').remove();
            $("tr.service-enquiry").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });
            if ($(".service-enquiry").length < 2) //$("#deleteRow").hide();           
                return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteSponsor: function (row) {
        var rowCount = $('#sponsortable tr').length;

        if (rowCount != 2) {
            $(row).parents('.sponsorClass').remove();
            if ($(".sponsorClass").length < 2) //$("#deleteRow").hide();
                return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    /**
     * Function cleans up the number passed and returns the cleaned up value
     * @param number
     * @param decimals
     * @returns {*}
     */
//    roundNumber: function (number, decimals) {
//        var newString;// The new rounded number
//        decimals = Number(decimals);
//        if (decimals < 1) {
//            newString = (Math.round(number)).toString();
//        } else {
//            var numString = number.toString();
//            if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
//                numString += ".";// give it one at the end
//            }
//            var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
//            var d1 = Number(numString.substring(cutoff, cutoff + 1));// The value of the last decimal place that we'll end up with
//            var d2 = Number(numString.substring(cutoff + 1, cutoff + 2));// The next decimal, after the last one we want
//            if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
//                if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
//                    while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
//                        if (d1 != ".") {
//                            cutoff -= 1;
//                            d1 = Number(numString.substring(cutoff, cutoff + 1));
//                        } else {
//                            cutoff -= 1;
//                        }
//                    }
//                }
//                d1 += 1;
//            }
//            if (d1 == 10) {
//                numString = numString.substring(0, numString.lastIndexOf("."));
//                var roundedNum = Number(numString) + 1;
//                newString = roundedNum.toString() + '.';
//            } else {
//                newString = numString.substring(0, cutoff) + d1.toString();
//            }
//        }
//        if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
//            newString += ".";
//        }
//        var decs = (newString.substring(newString.lastIndexOf(".") + 1)).length;
//        for (var i = 0; i < decimals - decs; i++) newString += "0";
//        //var newNumber = Number(newString);// make it a number if you like
//        return newString; // Output the result to the form field (change for your purposes)
//    },
    roundNumber: function (number) {
        //If it's not already a String
        var num2 = Math.floor(number * 1000) / 1000;
        return num2;
    },
    setPathValue: function (path) {
        window.filePath = path
    }

};
