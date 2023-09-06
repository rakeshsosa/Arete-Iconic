 
 var inventory = {
 addRow6: function () {
        
        // Get the table object to use for adding a row at the end of the table
        var $itemsTable = $('#itemsTable1');
        var $row = $(rowTemp);
        
        // Add row after the first row in table
        $('.pointer:last', $itemsTable).after($row);

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
      deleteRow: function (row) {      
        var rowCount = $('#itemsTable1 tr').length;
       $("tr.item-row").each(function () {
            var $itemRow = $(this).closest('tr');
            var rowCount = ($(this).closest("tr")[0].rowIndex);
            $itemRow.attr('id', "row" + rowCount);
        });
        if (rowCount != 2) {
            $(row).parents('.item-row').remove();
//            if ($(".item-row").length < 2)
            //$("#deleteRow").hide();
                calTotal();
            return true;
        } else {
            alert('You cannot delete this row');
            return false;
        }

    }
}