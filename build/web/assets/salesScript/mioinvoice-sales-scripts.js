/**
 * Functions that handle fetching the invoice items coming from the database
 * @type {{fetchItems: Function,
 *          updatePrice: Function,
 *          updateTotal: Function,
 *          addRow: Function,
 *          deleteRow: Function,
 *          roundNumber: Function,
 *          setPathValue: Function}}
 */
var mioInvoice = {
    /**
     * Fetch items from database using autocomplete method
     * @param $lookupInput - Input selector
     */
    fetchItems: function ($lookupInput) {

        // apply autocomplete method to newly created row
        $lookupInput.autocomplete({
            source: function (request, response) {
                $.getJSON("../sales/fetchrecipeItem.htm", {item: $lookupInput.val()},
                response);
            },
            minLength: 1,
            select: function (event, ui) {
                var $itemRow = $(this).closest('tr');
                // Modify this information to match the information coming from assets/ajax-services/fetch-inventory.php
                $itemRow.find('#itemId').val(ui.item.id); // Hidden input on form
                $itemRow.find('#itemCode').val(ui.item.itemCode);
                $itemRow.find('#itemDesc').val(ui.item.itemDesc);
                $itemRow.find('#itemName').val(ui.item.itemName);
                $itemRow.find('#uomCode').val($($itemRow.find('#uomCode')).html(""));

                var uoml = (ui.item.uoms).split(",");
                for (var i = 0; i < uoml.length; i++) {
                    if (uoml[i] != "") {

                        $itemRow.find('#uomCode').val($($itemRow.find('#uomCode')).append(new Option(uoml[i], uoml[i])));
                    }
                }
                // Give focus to the nitemPriceext input field to receive input from user
                $itemRow.find('#purchaseQty').focus();
                return false;
            }
        });

    },
    /**
     * Update price function
     *  @param $this - Row Object
     */
    updatePrice: function ($this) {
        var $itemRow = $($this).closest('tr');
        // Calculate the price of the row.  Remove any $ so the calculation doesn't break
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $itemRow.find('#itemtotalPrice').val("0.0");
        }
        else {
            var total = $itemRow.find('#portionQty').val() * $itemRow.find('#itemunitPrice').val();
            total = this.roundNumber(total);
            isNaN(total) ? $itemRow.find('#itemtotalPrice').val("N/A") : $itemRow.find('#itemtotalPrice').val(parseFloat(total).toFixed(3));
        }
        this.updateiteTotal();

    },
    updatereturnPrice: function ($this) {
        var $itemRow = $($this).closest('tr');
        // Calculate the price of the row.  Remove any $ so the calculation doesn't break
        var check = $itemRow.find('#comp');
        if ($(check).prop('checked') == true) {
            $itemRow.find('#returntotalPrice').val("0.0");
        }
        else {
            var port = $itemRow.find('#portionQty').val();
            var ret = $itemRow.find('#returnQty').val();
            var returned = $itemRow.find('#returnedQty').val();
            port=parseFloat(port);
            ret=parseFloat(ret)+parseFloat(returned);            
            isNaN(port) ? port = 0.0 : port = port;
            ret = parseFloat(ret);
            isNaN(ret) ? ret = 0.0 : ret = ret;
            if (ret <= port) {
                var total = ret * $itemRow.find('#itemunitPrice').val();
                total = this.roundNumber(total);
                isNaN(total) ? $itemRow.find('#returntotalPrice').val("N/A") : $itemRow.find('#returntotalPrice').val(parseFloat(total).toFixed(3));
            }
            else {
                alert("Invalid Quantity");
                $itemRow.find('#returnQty').val("");
                $itemRow.find('#returntotalPrice').val("");
                return false;
            }
        }
        this.updatereiteTotal();

    },
    updatereservicePrice: function ($this) {
        var $itemRow = $($this).closest('tr');
        // Calculate the price of the row.  Remove any $ so the calculation doesn't break
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $itemRow.find('#serviceretotalPrice').val("0.0");
        }
        else {
            var port1 = $itemRow.find('#serviceQty').val();
            var ret2 = $itemRow.find('#servicereQty').val();
            var returned1 = $itemRow.find('#sretQty').val();
            ret2=parseFloat(ret2)+parseFloat(returned1);
            port1 = parseFloat(port1);
            isNaN(port1) ? port1 = 0.0 : port1 = port1;
            ret2 = parseFloat(ret2);
            isNaN(ret2) ? ret2 = 0.0 : ret2 = ret2;
            if (port1 >= ret2) {
                var total = $itemRow.find('#servicereQty').val() * $itemRow.find('#serviceunitPrice').val();
                total = this.roundNumber(total);
                isNaN(total) ? $itemRow.find('#serviceretotalPrice').val("N/A") : $itemRow.find('#serviceretotalPrice').val(parseFloat(total).toFixed(3));
            }
            else {
                alert("Invalid Quantity");
                $itemRow.find('#servicereQty').val("");
                $itemRow.find('#serviceretotalPrice').val("");
                return false;
            }

        }
        this.updatereserTotal();
    },
    updateservicePrice: function ($this) {
        var $itemRow = $($this).closest('tr');
        // Calculate the price of the row.  Remove any $ so the calculation doesn't break
        var check1 = $itemRow.find('#Service');
        if ($(check1).prop('checked') == true) {
            $itemRow.find('#servicetotalPrice').val("0.0");
        }
        else {
            var total = $itemRow.find('#serviceQty').val() * $itemRow.find('#serviceunitPrice').val();
            total = this.roundNumber(total);
            isNaN(total) ? $itemRow.find('#servicetotalPrice').val("N/A") : $itemRow.find('#servicetotalPrice').val(parseFloat(total).toFixed(3));
        }
        this.updateserTotal();
    },
    /**
     * Handle the total calculation
     */
    updateiteTotal: function () {
        var total = 0;
        $('input#itemtotalPrice').each(function (i) {

            price = $(this).val();
            if (!isNaN(price))
                total += Number(price);
        });

        $('#totalitemAmount').html(this.roundNumber(total));
        $('#itmTot').val(this.roundNumber(total));
        this.updatebothTotal();
    },
    updatereiteTotal: function () {
        var item = 0;
        var total = 0;
        $('input#returntotalPrice').each(function (i) {
            item++;
            price1 = $(this).val();
            if (!isNaN(price1))
                total += Number(price1);
        });
        $('#noofreitems').val(item);
        var totalamt = this.roundNumber(total);
        $('#totalitemreAmount').html(parseFloat(totalamt).toFixed(3));
        $('#reitmTot').val(parseFloat(totalamt).toFixed(3));
        this.updaterebothTotal();
    },
    updateserTotal: function () {

        var totalS = 0;
        $('input#servicetotalPrice').each(function (i) {

            servicep = $(this).val();
            if (!isNaN(servicep))
                totalS += Number(servicep);
        });
        var serT = this.roundNumber(totalS);
        $('#totalserviceAmount').html(parseFloat(serT).toFixed(3));
        $('#serTot').val(parseFloat(serT).toFixed(3));
        this.updatebothTotal();
    },
    updatereserTotal: function () {
        var cnt = 0;
        var totalS = 0;
        $('input#serviceretotalPrice').each(function (i) {
            cnt++;
            servicep1 = $(this).val();
            if (!isNaN(servicep1))
                totalS += Number(servicep1);

        });
        var serT = this.roundNumber(totalS);
        $('#noofreService').val(cnt);
        $('#totalreserviceAmount').html(parseFloat(serT).toFixed(3));
        $('#reserTot').val(parseFloat(serT).toFixed(3));
        this.updaterebothTotal();
    },
    updatebothTotal: function () {
        var totalAll = 0;
        var se = 0.0;
        var it = 0.0;
        se = $('#serTot').val();
        it = $('#itmTot').val();
        se = parseFloat(se);
        isNaN(se) ? se = 0.0 : se = se;
        it = parseFloat(it);
        isNaN(it) ? it = 0.0 : it = it;
        var totalAll = se + it;
        var totallAmt = this.roundNumber(totalAll);
        isNaN(totalAll) ? $("#quottotAmount").val("N/A") : $("#quottotAmount").val(parseFloat(totallAmt).toFixed(3));
        this.quotgrandTotal();
        this.complementTot();
    },
    updaterebothTotal: function () {
        var totalAll = 0;
        var se = 0.0;
        var it = 0.0;
        se = $('#reserTot').val();
        it = $('#reitmTot').val();
        se = parseFloat(se);
        isNaN(se) ? se = 0.0 : se = se;
        it = parseFloat(it);
        isNaN(it) ? it = 0.0 : it = it;
        var totalAll = se + it;
        var totallAmt = this.roundNumber(totalAll);
        isNaN(totalAll) ? $("#totamtReturn").val("N/A") : $("#totamtReturn").val(parseFloat(totallAmt).toFixed(3));
        this.requotgrandTotal();
        this.complementTot();

    },
    quotgrandTotal: function () {
        var finalTot = 0;
        var quottotAmount = $('#quottotAmount').val();
        var quotDiscount = $('#quotDiscount').val();
        var finalTot = parseFloat(quottotAmount) - parseFloat(quottotAmount) * (quotDiscount / 100);
        var etype = $("#enquiryStatus").val();
        var finaltotAmt = this.roundNumber(finalTot);
        if ($.trim(etype) == "Internal") {
            isNaN(finalTot) ? $("#quotgrandAmount").val("N/A") : $("#quotgrandAmount").val(parseFloat(finaltotAmt).toFixed(3));
        }
        else {
            isNaN(finalTot) ? $("#quotgrandAmount").val("N/A") : $("#quotgrandAmount").val(parseFloat(finaltotAmt).toFixed(3));
        }
        var advancepayAmt = $('#advancepayAmt').val();
        if (advancepayAmt == "") {
            advancepayAmt = 0.0;
        } else {
            advancepayAmt = advancepayAmt;
        }
        var balance = parseFloat(finalTot) - parseFloat(advancepayAmt);
        var balAmt = this.roundNumber(balance);
        if (balAmt > 0) {
            isNaN(balance) ? $("#balanceAmt").val("N/A") : $("#balanceAmt").val(parseFloat(balAmt).toFixed(3));
        }
        else {
            isNaN(balance) ? $("#balanceAmt").val("N/A") : $("#balanceAmt").val("0.0");
        }
        var budval = 0;
        var bud = $('#totalBudget').val();
        isNaN(bud) ? bud = 0.0 : bud = bud;
        bud = parseFloat(bud);
        if (bud > 0) {
            var totalBD = ((finaltotAmt - bud) / bud) * 100;
            isNaN(totalBD) ? $("#budgetDev").val("N/A") : $("#budgetDev").val(parseFloat(totalBD).toFixed(3));
        }
        else {
            $("#budgetDev").val("N/A");
        }

    },
    requotgrandTotal: function () {
        var finalTot = 0;
        var quottotAmount = $('#totamtReturn').val();
        var quotDiscount = $('#quotDiscount').val();
        var ordertotCharge = $('#ordertotCharge').val();
        var totchargeReturn = $('#totchargeReturn').val();
        var quotgrandAmount = $("#quotgrandAmount").val();

        quottotAmount = parseFloat(quottotAmount);
        isNaN(quottotAmount) ? quottotAmount = 0.0 : quottotAmount = quottotAmount;
        quotDiscount = parseFloat(quotDiscount);
        isNaN(quotDiscount) ? quotDiscount = 0.0 : quotDiscount = quotDiscount;
        ordertotCharge = parseFloat(ordertotCharge);
        isNaN(ordertotCharge) ? ordertotCharge = 0.0 : ordertotCharge = ordertotCharge;
        totchargeReturn = parseFloat(totchargeReturn);
        isNaN(totchargeReturn) ? totchargeReturn = 0.0 : totchargeReturn = totchargeReturn;

        var finalTot = parseFloat(quottotAmount) - parseFloat(quottotAmount) * (quotDiscount / 100) - (ordertotCharge + totchargeReturn);
        var finalDiscount = parseFloat(quottotAmount) * (quotDiscount / 100);
        var etype = $("#enquiryStatus").val();
        var finaltotAmt = this.roundNumber(finalTot);
        if ($.trim(etype) == "Internal") {
            isNaN(finalTot) ? $("#ordergrandreAmt").val("N/A") : $("#ordergrandreAmt").val(parseFloat(finaltotAmt).toFixed(3));
        }
        else {
            isNaN(finalTot) ? $("#ordergrandreAmt").val("N/A") : $("#ordergrandreAmt").val(parseFloat(finaltotAmt).toFixed(3));
        }
        isNaN(finalDiscount) ? $("#orderreDiscount").val("N/A") : $("#orderreDiscount").val(parseFloat(finalDiscount).toFixed(3));
        var advancepayAmt = $('#advancepayAmt').val();
        advancepayAmt = parseFloat(advancepayAmt);
        isNaN(advancepayAmt) ? advancepayAmt = 0.0 : advancepayAmt = advancepayAmt;
        var balance = 0.0;
        if (parseFloat(advancepayAmt) <= 0) {
            balance = finaltotAmt - (parseFloat(totchargeReturn) + parseFloat(ordertotCharge));
            isNaN(balance) ? $("#balancereAmt").val("N/A") : $("#balancereAmt").val(parseFloat(balance).toFixed(3));
        }
        else {
            balance = quotgrandAmount - ((finalTot + advancepayAmt) - (parseFloat(totchargeReturn) + parseFloat(ordertotCharge)));
            if (balance > 0) {
                isNaN(balance) ? $("#balancereAmt").val("N/A") : $("#balancereAmt").val("0.000");
                isNaN(balance) ? $("#balanceAmt").val("N/A") : $("#balanceAmt").val(parseFloat(balance).toFixed(3));
            }
            else {
                isNaN(balance) ? $("#balancereAmt").val("N/A") : $("#balancereAmt").val(parseFloat(Math.abs(balance)).toFixed(3));
                isNaN(balance) ? $("#balanceAmt").val("N/A") : $("#balanceAmt").val("0.000");
            }
        }
//        
//        if (parseFloat(advancepayAmt) > parseFloat(quottotAmount)) {
//            balance = parseFloat(advancepayAmt) + parseFloat(totchargeReturn) - parseFloat(ordertotCharge);
//        }
//        else {
//
//            balance = parseFloat(advancepayAmt) - parseFloat(quottotAmount) - (parseFloat(totchargeReturn) + parseFloat(ordertotCharge));
//        }
//
//        var balAmt = this.roundNumber(balance);
//        if (balance > 0) {
//            isNaN(balance) ? $("#balancereAmt").val("N/A") : $("#balancereAmt").val(parseFloat(balAmt).toFixed(3));
//        }
//        else {
//            isNaN(balance) ? $("#balancereAmt").val("N/A") : $("#balancereAmt").val("0.0");
//        }
    },
    complementTot: function () {
        var ser = 0;
        var men = 0;
        var ser1 = 0;
        var men1 = 0;
        var flag = $("#serviceFlag").val();
        var flag1 = $("#menuFlag").val();
        if (flag != "NO") {
            $("input#Service").each(function () {
                if ($(this).is(':visible')) {
                    if ($(this).is(':enabled')) {
                        ser1++;
                        if ($(this).prop('checked') == true) {
                            ser++;
                        }
                    }
                }
            });
        }
        if (flag1 != "NO") {
            $("input#comp").each(function () {
                if ($(this).is(':visible')) {
                    if ($(this).is(':enabled')) {
                        men1++;
                        if ($(this).prop('checked') == true) {
                            men++;
                        }
                    }
                }
            });
        }
        var totComp = parseFloat(ser) + parseFloat(men);
        var totComp1 = parseFloat(ser1) + parseFloat(men1);
        $("#noofComplementary").val(totComp);
        $("#noofItems").val(totComp1);

    },
    /**
     * Add row to invoice to allow for additional items
     * @param lookupSelector
     */

    addRow: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable = $('#itemsTable');
        var $row = $(rowTemp);

        // Add row after the first row in table
        $('.item-row:last', $itemsTable).after($row);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow1: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable1 = $('#itemsTableCharges');
        var $row1 = $(rowTemp1);

        // Add row after the first row in table
        $('.item-rowcharge:last', $itemsTable1).after($row1);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow2: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable2 = $('#itemsTableDiscount');
        var $row2 = $(rowTemp2);

        // Add row after the first row in table
        $('.item-rowdiscount:last', $itemsTable2).after($row2);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow3: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable3 = $('#itemsTableDocuments');
        var $row3 = $(rowTemp3);

        // Add row after the first row in table
        $('.item-rowdocuments:last', $itemsTable3).after($row3);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow4: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable4 = $('#enquirytable');
        var $row4 = $(rowTemp4);

        // Add row after the first row in table
        $('.item-enquiry:last', $itemsTable4).after($row4);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRowX: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable4 = $('#enquirytable');
        var $row4 = $(rowTempX);

        // Add row after the first row in table
        $('.item-enquiry:last', $itemsTable4).after($row4);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow5: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#complementTable');
        var $row5 = $(rowTemp5);

        // Add row after the first row in table
        $('.item-complement:last', $itemsTable5).after($row5);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow6: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable6 = $('#serviceenquirytable');
        var $row6 = $(rowTemp6);

        // Add row after the first row in table
        $('.service-enquiry:last', $itemsTable6).after($row6);

//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow7: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable7 = $('#quoteTable');
        var $row7 = $(rowTemp7);

        // Add row after the first row in table
        $('.item-quote:last', $itemsTable7).after($row7);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRowDi: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTableDi = $('#quoteTable');
        var $rowDi = $(rowTempDi);

        // Add row after the first row in table
        $('.item-quote:last', $itemsTableDi).after($rowDi);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRowY: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable7 = $('#quoteTable');
        var $row7 = $(rowTempY);

        // Add row after the first row in table
        $('.item-quote:last', $itemsTable7).after($row7);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow8: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable8 = $('#servicequoteTable');
        var $row8 = $(rowTemp8);

        // Add row after the first row in table
        $('.service-quote:last', $itemsTable8).after($row8);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRowSdi: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTableSdi = $('#servicequoteTable');
        var $rowSdi = $(rowTempSdi);

        // Add row after the first row in table
        $('.service-quote:last', $itemsTableSdi).after($rowSdi);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRowSY: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable8 = $('#servicequoteTable');
        var $row8 = $(rowTempSY);

        // Add row after the first row in table
        $('.service-quote:last', $itemsTable8).after($row8);

        // save reference to inputs within row
//        var $itemCode = $row.find(lookupSelector);

//        $itemCode.focus();
//        mioInvoice.fetchItems($itemCode);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
//        $row.find(itemQtyPriceSelectors).on('keyup', function () {
//            // Locate the row we are working with
//            var $itemRow = $(this).closest('tr');
//            // Update the price.
//            mioInvoice.updatePrice($itemRow);
//        });


    },
    addRow9: function () {
        var $itemsTable9 = $('#recipeTable');
        var $row9 = $(rowTemp9);
        $('.item-recipe:last', $itemsTable9).after($row9);
    },
    addRow10: function () {
        var $itemsTable10 = $('#orderTable');
        var $row10 = $(rowTemp10);
        $('.item-order:last', $itemsTable10).after($row10);
    },
    addRowOedi: function () {
        var $itemsTableOd = $('#orderTable');
        var $rowOd = $(rowTempOedi);
        $('.item-order:last', $itemsTableOd).after($rowOd);
    },
    addRowOdi: function () {
        var $itemsTable11 = $('#orderTable');
        var $row11 = $(rowTempOdi);
        $('.item-order:last', $itemsTable11).after($row11);
    },
    addRowSodi: function () {
        var $itemsTable12 = $('#serviceorderTable');
        var $row12 = $(rowTempSodi);
        $('.service-order:last', $itemsTable12).after($row12);
    },
    addRowShip: function () {
        var $itemsTable13 = $('#shipTable');
        var $row13 = $(rowTempShip);
        $('.item-ship:last', $itemsTable13).after($row13);
    },
    addRowShipDi: function () {
        var $itemsTable14 = $('#shipTable');
        var $row14 = $(rowTempShipDi);
        $('.item-ship:last', $itemsTable14).after($row14);
    },
    serviceShipDi: function () {
        var $itemsTable15 = $('#serviceshipTable');
        var $row15 = $(rowTempShipServiceDi);
        $('.service-ship:last', $itemsTable15).after($row15);
    },
    addserviceShip: function () {
        var $itemsTable16 = $('#serviceshipTable');
        var $row16 = $(rowTempShipService);
        $('.service-ship:last', $itemsTable16).after($row16);
    },
    selectDiscount: function ($this) {

        var second_td = $.trim($this.find('#itemDiscount').html());
        var $itemRow = $($this).closest('tr');
        alert($itemRow.find('#itemPrice').val());
        $itemRow.find('#itemPrice').val();
        alert(document.getElementById("tablerow").value);
        alert($itemRow.find('td:eq(1)').html());
        $itemRow.find('#itemDiscount').value = "0.1";
    },
    /**
     * Delete row if we have more than one row in table
     * @param row
     * @returns {boolean}
     */
    deleteRow: function (row) {
        var rowCount = $('#itemsTable tr').length;
        $("tr.item-row").each(function () {
            var $itemRow = $(this).closest('tr');
            var rowCount = ($(this).closest("tr")[0].rowIndex);
            $itemRow.attr('id', "row" + rowCount);
        });
        if (rowCount != 2) {
            $(row).parents('.item-row').remove();

            this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow1: function (row) {
        var rowCount = $('#itemsTableCharges tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-rowcharge').remove();
            $("tr.item-rowcharge").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });
            this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow2: function (row) {
        var rowCount = $('#itemsTableDiscount tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-rowdiscount').remove();
            if ($(".item-rowdiscount").length < 2) //$("#deleteRow").hide();           
                return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow3: function (row) {
        var rowCount = $('#itemsTableDocuments tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.item-rowdocuments').remove();
            $("tr.item-rowdocuments").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow4: function (row) {
        var rowCount = $('#enquirytable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.item-enquiry').remove();
            $("tr.item-enquiry").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow5: function (row) {
        var rowCount = $('#complementTable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.item-complement').remove();
            $("tr#complementTable").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateSalesTax();
            this.updateTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow6: function (row) {
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
    deleteRow7: function (row) {
        var rowCount = $('#quoteTable tr:visible').length;
        if (rowCount != 2) {
            $(row).parents('.item-quote').remove();
            $("tr.item-quote").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });
            this.updateiteTotal();
            this.updatereiteTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow8: function (row) {
        var rowCount = $('#servicequoteTable tr:visible').length;
        if (rowCount != 2) {
            $(row).parents('.service-quote').remove();
            $("tr.service-quote").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateserTotal();
            this.updatereserTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow9: function (row) {
        var rowCount = $('#orderTable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.item-order').remove();
            $("tr.item-order").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateiteTotal();
            this.updatereiteTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow10: function (row) {
        var rowCount = $('#serviceorderTable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.service-order').remove();
            $("tr.service-order").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });
            this.updateserTotal();
            this.updatereserTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow11: function (row) {
        var rowCount = $('#shipTable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.item-ship').remove();
            $("tr.item-ship").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateiteTotal();
            this.updatereiteTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    deleteRow12: function (row) {
        var rowCount = $('#serviceshipTable tr:visible').length;

        if (rowCount != 2) {
            $(row).parents('.service-ship').remove();
            $("tr.service-ship").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });

            this.updateserTotal();
            this.updatereserTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
    roundNumber: function (number) {
        var num2 = Math.floor(number * 1000) / 1000;
        var num3 = num2.toFixed(3);
        return num3;
    },
    setPathValue: function (path) {
        window.filePath = path;
    }

};
