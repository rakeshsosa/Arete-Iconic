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



var mioInvoiceX = {
    /**
     * Fetch items from database using autocomplete method
     * @param $lookupInput - Input selector
     */
    fetchItems: function ($lookupInput,$cat) {
        var itemName = '';
        var nameMenu=$('#nameMenu').val();
        $('tr.item-recipe').each(function () {
            var $itemRow = $(this).closest('tr');
            var iteName=$itemRow.find('#itemnameMenu').val();
            
            var recipeCategory=$itemRow.find('#recipeCategory').val();
            if(iteName!=""){
            itemName = itemName+"///"+iteName+"//"+recipeCategory ;
        }           
        });
        // apply autocomplete method to newly created row
        $lookupInput.autocomplete({
            source: function (request, response) {
                $.getJSON("../sales/fetchrecipeItem.htm", {item: $lookupInput.val(),category: $cat.val(),items: itemName,menu:nameMenu},
                response);
            },
            minLength: 1,
            select: function (event, ui) {
                var $itemRow = $(this).closest('tr');
                $itemRow.find('#itemnameMenu').empty();
                // Modify this information to match the information coming from assets/ajax-services/fetch-inventory.php
                $itemRow.find('#itemnameMenu').val(ui.item.itemnameMenu); // Hidden input on form
                $itemRow.find('#menuUom').val(ui.item.unit);
                $itemRow.find('#menuPrice').val(ui.item.price);
                $itemRow.find('#recipeFoodCost').val(ui.item.recipeFoodCost);
                $itemRow.find('#recipeFoodCostPercent').val(ui.item.recipeFoodCostPercent);
                $itemRow.find('#recipeGrossProfit').val(ui.item.recipeGrossProfit);
                $itemRow.find('#recipeGrossProfitPercent').val(ui.item.recipeGrossProfitPercent); 
                $itemRow.find('#menuItemQty').val(ui.item.qtyVal);
                // Give focus to the next input field to receive input from user
                $itemRow.find('#itemnameMenu').focus();
                mioInvoiceX.updatemenuPrice(this);
                return false;
            }
        });

    },
    /**
     * Update price function
     *  @param $this - Row Object
     */
    updatemenuPrice: function ($this) {
        var priceFinal = 0.0;
        var $itemRow = $($this).closest('tr');
        // Calculate the price of the row.  Remove any $ so the calculation doesn't break
        var total = $itemRow.find('#menuItemQty').val() * $itemRow.find('#menuPrice').val();
        total = mioInvoiceX.roundNumber(total);
        isNaN(total) ? $itemRow.find('#menuPriceT').val("N/A") : $itemRow.find('#menuPriceT').val(total);
        $("tr.item-recipe").each(function () {
            var $itemRow1 = $(this).closest('tr');
            var priceA = $itemRow1.find('#menuPriceT').val();
            priceFinal = parseFloat(priceFinal) + parseFloat(priceA);
            priceFinal = mioInvoiceX.roundNumber(priceFinal);
        }); 
        isNaN(priceFinal) ? $('#totalmenuAmount').val("N/A") : $('#totalmenuAmount').val(parseFloat(priceFinal));
        isNaN(priceFinal) ? $('#totAmt').html("N/A") : $('#totAmt').html(parseFloat(priceFinal));
    },
    /**
     * Handle the total calculation
     */
    updateTotal: function () {
        var priceFinal = 0.0;
        $("tr.item-recipe").each(function () {
            var $itemRow1 = $(this).closest('tr');
            var priceA = $itemRow1.find('#menuPriceT').val();
            priceFinal = parseFloat(priceFinal) + parseFloat(priceA);
            priceFinal = mioInvoiceX.roundNumber(priceFinal);
        }); 
        isNaN(priceFinal) ? $('#totalmenuAmount').val("N/A") : $('#totalmenuAmount').val(parseFloat(priceFinal));
        isNaN(priceFinal) ? $('#totAmt').html("N/A") : $('#totAmt').html(parseFloat(priceFinal));
    },
    /**
     * Add row to invoice to allow for additional items
     * @param lookupSelector
     */
    addRow: function (lookupSelector) {

//        $("select#batchno").each(function(){
//            var a='';
//            var $itemRow = $(this).closest('tr');
//            a=$itemRow.find('#batchno').val();
//            $itemRow.find('#batchno').children().remove();
//            $itemRow.find('#batchno').append('<option>'+a+'</option>');
//        });
        // Get the table object to use for adding a row at the end of the table
        var $itemsTable9 = $('#recipeTable');
        var $row9 = $(rowTemp9);

        // Add row after the first row in table
        $('.item-recipe:last', $itemsTable9).after($row9);

        // save reference to inputs within row
        var $itemCode = $row9.find(lookupSelector);
        var $itemCat = $row9.find("#recipeCategory");

        $itemCode.focus();
        mioInvoiceX.fetchItems($itemCode,$itemCat);

        // Update the invoice total on keyup when the user updates the item qty or price input
        // ** Note: This is for the newly created row
        $row9.find(menuSelectors).on('keyup', function () {
            // Locate the row we are working with
            var $itemRow = $(this).closest('tr');
            // Update the price.
            mioInvoiceX.updatemenuPrice($itemRow);
        });


    },
    selectDiscount: function ($this) {

        var second_td = $.trim($this.find('#itemDiscount').html());
        alert(second_td);
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
    deleteRow9: function (row) {

        var rowCount = $('#recipeTable tr').length;

        if (rowCount != 2) {
            $(row).parents('.item-recipe').remove();
            mioInvoiceX.updateTotal();
            if ($(".item-recipe").length < 2) //$("#deleteRow").hide();            
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
