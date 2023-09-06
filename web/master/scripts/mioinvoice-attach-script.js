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

    addRowattach: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable3 = $('#itemsTableDocuments');
        var $row3 = $(rowTempAttach);

        $('.item-rowdocuments:last', $itemsTable3).after($row3);

    },
    addRow8: function () {

        // Get the table object to use for adding a row at the end of the table
        var $itemsTable5 = $('#membertable');
        var $row5 = $(rowTempmt);

        // Add row after the first row in table
        $('.item-members:last', $itemsTable5).after($row5);

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
    deleteRow8: function (row) {
        var rowCount = $('#membertable tr:visible').length;
        if (rowCount != 2) {
            $(row).parents('.item-members').remove();
            $("tr.item-members").each(function () {
                var $itemRow = $(this).closest('tr');
                var rowCount = ($(this).closest("tr")[0].rowIndex);
                $itemRow.attr('id', "row" + rowCount);
            });


        } else {
            alert('You cannot delete this row');
            return false;
        }

    },
};
