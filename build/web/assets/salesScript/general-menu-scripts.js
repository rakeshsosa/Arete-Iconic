// Define variables
var lookupSelector = '#itemnameMenu'; // The ID selector to use for the autocomplete function
var lookupInput = $(lookupSelector);
var lookupvalue = document.getElementById('itemnameMenu').value;
var lookupvalue1 = document.getElementById('recipeCategory').value;
var lookcategoryS = '#recipeCategory';
var cat = $(cat);
var filePath;
var menuSelectors = '#menuItemQty, #menuPrice';

/*
 First, set the path to fetch items from database
 Initialize the lookup for the first input on the page
 */
mioInvoiceX.setPathValue('../sales/fetchrecipeItem.htm?category=' + lookupvalue1 + '&item=' + lookupvalue);
mioInvoiceX.fetchItems(lookupInput, cat);


/*
 Create an Array to for adding row in table. You'll want to make sure you have the same number of columns
 You will also want to make sure that your inputs match what's in the html current row.
 Also, be sure you have the correct id's for each input.
 */


var catadd;
try {
    catadd = recipecategory();
} catch (error) {
    catadd;
}
var rowTemp9 = [
    '<tr class="item-recipe">' +
            '<td onclick=""><button type="button" id="deleteRecipe"><i class="fa fa-trash-o"></i></button></td>' +
            '<td>' + catadd + '</td>' +
            '<td><input name="sn" type="hidden" value="-1"><input name="sn1" type="hidden" value="-1"><input class="form-control ui-autocomplete-input validate[required]" maxlength="100" required name="itemnameMenu" id="itemnameMenu"  onkeypress="" type="text" value="">' +
            '<input class="form-control right validate[required,custom[notzero]]"  autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="menuItemQty" id="menuItemQty" type="hidden" value="">' +
            '<td><input class="form-control validate[required]" readonly required autocomplete="off" name="menuUom" id="menuUom" type="text" value=""></td>' +
            '<td><input class="form-control validate[required]" readonly onkeypress="return check_digit(event, this, 10, 3);" autocomplete="off" name="menuPrice" id="menuPrice" type="hidden" value="">' +
            '<input style="text-align:right;" class="form-control validate[required]" readonly autocomplete="off" name="menuPriceT" id="menuPriceT" type="text" value="">' +
            '<input class="form-control" readonly autocomplete="off" name="recipeFoodCost" id="recipeFoodCost" type="hidden" value="">' +
            '<input class="form-control" readonly autocomplete="off" name="recipeFoodCostPercent" id="recipeFoodCostPercent" type="hidden" value="">' +
            '<input class="form-control" readonly autocomplete="off" name="recipeGrossProfit" id="recipeGrossProfit" type="hidden" value="">' +
            '<input class="form-control" readonly autocomplete="off" name="recipeGrossProfitPercent" id="recipeGrossProfitPercent" type="hidden" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" name="remarksMenu" id="remarksMenu" type="text" value=""></td>' +
            '</tr>'
].join('');
/*
 We are overriding the autocomplete UI menu styles to create our own.
 You can add information from the returned json array as needed
 Just be sure that your array contains the correct value when returned
 You'll want to modify the ajax-services/fetch-inventory.php file for the returned values
 */
$.ui.autocomplete.prototype._renderItem = function (ul, item) {
    return $("<li></li>")
            .data("item.autocomplete", item)

            // This is the autocomplete list that is generated
            .append("<a class='additionalInfo'>" + item.itemnameMenu + "</a>").appendTo(ul);
};

$(document).on('keyup', menuSelectors, function () {
    mioInvoiceX.updatemenuPrice(this);
});
$("#addRecipeBtn").on('click', function (e) {

    mioInvoiceX.addRow(lookupSelector);
    e.preventDefault();

});
$(document).on('click', '#deleteRecipe', function () {
    var act1 = $("#actionref").val();
    if (act1 == 'view') {
        $(this).prop('disabled', true);
        return false;
    }
    else {
        mioInvoiceX.deleteRow9(this);
    }
});

/*
 Here's where we start adding rows to the invoice
 Add row to list and allow user to use autocomplete to find items.
 */
/*
 Update invoice total when item Qty or Price inputs have been updated
 */
/*
 Update invoice total when invoice tax input has changed
 */
