// Define variables
//var lookupSelector = '#itemnameMenu'; // The ID selector to use for the autocomplete function
//var lookupInput = $(lookupSelector);
//var lookupvalue = document.getElementById('itemnameMenu').value;
var itemQtyPriceSelectors = '#itemunitPrice, #portionQty';
var servicePriceSelectors = '#serviceunitPrice, #serviceQty';// The ID's used for the Price and Qty binding for updating price
//var filePath;

/*
 First, set the path to fetch items from database
 Initialize the lookup for the first input on the page
 */
//mioInvoice.setPathValue('../sales/fetchrecipeItem.htm?item=' + lookupvalue);
//mioInvoice.fetchItems(lookupInput);

/*
 Create an Array to for adding row in table. You'll want to make sure you have the same number of columns
 You will also want to make sure that your inputs match what's in the html current row.
 Also, be sure you have the correct id's for each input.
 */

var i = 1;
var rowTemp = [
    '<tr class="item-row">',
    '<td align="center" onclick=""><i class="fa fa-trash fa-lg-o" id="deleteRow" style="font-size: 17px;"></i></td>' +
            '<td><input class="form-control" name="itemName" id="itemName" type="text" value=""/>' +
            '<input type="hidden" name="" value=""/>',
    '<input type="hidden" name="pks" value=""/>',
    '<input type="hidden" name="itemCode" value=""/></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="reqQty" id="reqQty" type="text" value="" ></td>' +
            '<td><input class="form-control" autocomplete="off" name="incoTerm" id="incoTerm" onkeypress="" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="complementary" id="complementary"  type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="ohCost" id="ohCost" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="fgCost" id="fgCost" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="totalfgCost" id="totfgCost" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 2);" name="discount" id="discount" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="fgcostKg" id="fgcostKg" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="margin" id="margin" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="sellingPrice" id="sellingPrice" type="text" value=""></td>' +
            '</tr>'

].join('');
var k = 1;
var rowTemp1 = ['<tr class="item-rowcharge">' +
            '<td align="center" onclick=""><i class="fa fa-trash fa-lg-o" id="deleteRowcharge" style="font-size: 17px;"></i></td>' +
            '<td><input type="text" required class="form-control" autocomplete="off" name="typeofCharges" id="typeofCharges" value=""/>' +
            '<td><input class="form-control" required autocomplete="off"  name="chargeCode" id="chargeCode" type="text" value="" ></td>' +
            '<td><input class="form-control" required autocomplete="off" name="chargeRate" id="chargeRate" onkeypress="" type="text" value=""></td>' +
            '</tr>'

].join('');
var l = 1;
var rowTemp2 = ['<tr class="item-rowdiscount">' +
            '<td align="center" onclick=""><i class="fa fa-trash fa-lg-o" id="deleteRowdiscount" style="font-size: 17px;"></i></td>' +
            '<td><input type="text" required class="form-control" autocomplete="off" name="typeofDiscount" id="typeofDiscount" value=""/> ' +
            '<td><input class="form-control" required autocomplete="off"  name="discountCode" id="discountCode" type="text" value="" ></td>' +
            '<td><input class="form-control" required autocomplete="off" name="discountRate" id="discountRate" onkeypress="" type="text" value=""></td>' +
            '</tr>'
].join('');
var m = 1;
var rowTemp3 = ['<tr class="item-rowdocuments">' +
            '<td align="center" onclick=""><button type="button" id="deleteRowdocument"><i class="fa fa-trash fa-lg-o"></i></button></td> ' +
            '<td><input class="input-file uniform_on"  id="attachmentReference" type="file" value="" name="attachmentReference" onchange="attachmentValidation(this);"></td>' +
            '</tr>'

].join('');

var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var n = 1;
var rowTemp4 = [
    '<tr class="item-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash fa-lg-o"></i></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="width:210px;" class="form-control validate[required]" maxlength="100" placeholder="Select Menu" readonly required autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" readonly required autocomplete="off" name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><div><span style="text-align:center;" id="addEnquiryGetBtn" class="myButton17" tabindex="" onclick="selectMenu(this);"><i class="glyphicon glyphicon-copy"></i> Get Recipe</span></div></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox"><input class="form-control" autocomplete="off"  name="complementaryCode" id="complementaryCode" type="hidden" value="Yes"></td>' +
            '<td><input style="text-align:center;" id="itemunitPrice" readonly name="itemunitPrice" readonly  type="hidden" value=""><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input style="" class="form-control" autocomplete="off" name="remarksenqItem" id="remarksenqItem" type="text" value=""></td>' +
            '<td><input style="" class="form-control" readonly autocomplete="off" name="menueditStatus" id="menueditStatus" type="text" value="Default"></td>' +
            '</tr>'

].join('');
var addup;
try {
    addup = callcategory();
    addup2 = callcategory1();
} catch (error) {
    addup;
    addup2;
}
var n = 1;
var rowTempX = [
    '<tr class="item-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="width:210px;" class="form-control validate[required]" maxlength="100" required placeholder="Select menu" autocomplete="off" readonly name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" readonly name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" required readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control" autocomplete="off"  name="" id="comp" type="checkbox" value="Yes"><input class="form-control" autocomplete="off"  name="complementaryCode" id="complementaryCode" type="hidden" value="Yes"></td>' +
            '<td><input style="text-align:center;" id="itemunitPrice" readonly name="itemunitPrice" readonly  type="hidden" value=""><input style="" id="menuReference" name="menuReference" type="hidden" value=""/><input style="" class="form-control" autocomplete="off" name="remarksenqItem" id="remarksenqItem" type="text" value=""></td>' +
            '</tr>'

].join('');
var rowTempX1 = [
    '<tr class="item-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="width:210px;" class="form-control validate[required]" maxlength="100" autocomplete="off" name="utilityBill" id="utilityBill" onclick="selectItem(this);" type="text" value="" ></td>' +            
            '</tr>'

].join('');
var rowTempX2 = [
    '<tr class="item-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup2 + '</td>' +
            '<td><input style="width:210px;" class="form-control validate[required]" maxlength="100" autocomplete="off" name="comutilityBill" id="comutilityBill" onclick="selectItem(this);" type="text" value="" ></td>' +            
            '</tr>'

].join('');

var p = 1;
var rowTemp5 = ['<tr class="item-complement">' +
            '<td align="center" onclick=""><i class="fa fa-trash fa-lg-o" id="deleteComplement" style="font-size: 17px;"></i></td>' +
            '<td><input style="text-align:center;"type="text"  class="form-control" autocomplete="off" name="compCode" id="compCode" value=""/>' +
            '<td><input  style="text-align:center;"class="form-control" autocomplete="off"  onkeypress="return check_digit(event, this, 10, 3);" name="compRate" id="compRate" type="text" value="" ></td>' +
            '</tr>'

].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var z = 1;
var rowTemp6 = [
    '<tr class="service-enquiry">' +
            '<td align="center" onclick=""><button type="button" id="deleteService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input style="" class="form-control validate[required] req" readonly placeholder="Select service" maxlength="100" required autocomplete="off" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required] req" readonly maxlength="100" required autocomplete="off" name="nameService" id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;"class="form-control validate[required,custom[notzero]] req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required] req" readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td> ' +
            '<td><input style="text-align:center;" class="form-control req"  autocomplete="off"  name="" id="Service" type="checkbox" ><input class="form-control req"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" name="serviceunitPrice" readonly  id="serviceunitPrice" type="hidden" ><input style="" class="form-control req" autocomplete="off" name="remarksenqService" id="remarksenqService" type="text" value=""></td>' +
            '</tr>'


].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var x = 1;
var rowTemp7 = [
    '<tr class="item-quote">' +
            '<td align="center" onclick=""><button type="button" id="deleteQuote"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="text-align:center;" name="pkquoteItem" type="hidden" value="-1" ><input style="text-align:center;" name="status" type="hidden" readonly value="" ><input style="" class="form-control validate[required]" readonly placeholder="Select menu" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" name="nameEnquiry" readonly id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><div><span style="text-align:center;" id="addEnquiryGetBtn" class="myButton17" tabindex="" onclick="selectMenu(this);"><i class="glyphicon glyphicon-copy"></i> Get Recipe</span></div></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox" value="Yes"><input class="form-control" autocomplete="off"  name="complementaryCode" id="complementaryCode" type="hidden" value="Yes"></td>' +
            '<td><input style="" class="form-control" autocomplete="off" name="remarksenqItem" id="remarksenqItem" readonly type="text" value=""></td>' +
            '<td><input style="t" id="menuReference" name="menuReference" type="hidden" value=""/><input class="form-control" autocomplete="off" name="itemquotRemarks" id="itemquotRemarks" type="text" value=""></td>' +
            '<td><input style="" class="form-control" readonly autocomplete="off" name="menueditStatus" id="menueditStatus" type="text" value="Default"></td>' +
            '</tr>'

].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var xD = 1;
var rowTempDi = [
    '<tr class="item-quote">' +
            '<td align="center" onclick=""><button type="button" id="deleteQuote"><i class="fa fa-trash fa-lg-o"></i></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="text-align:center;" name="pkquoteItem" type="hidden" value="-1" ><input style="width:210px;" class="form-control validate[required]" maxlength="100" placeholder="Select menu" required readonly autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required readonly autocomplete="off" name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><div><span style="text-align:center;" id="addEnquiryGetBtn" class="myButton17" tabindex="" onclick="selectquotMenu(this);"><i class="glyphicon glyphicon-copy"></i> Get Recipe</span></div></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox" value="="><input class="form-control" autocomplete="off"  name="complementaryCode" id="complementaryCode" type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" autocomplete="off" name="itemquotRemarks" id="itemquotRemarks" type="text" value=""></td>' +
            '<td><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input class="form-control" autocomplete="off" name="remarksenqItem" id="remarksenqItem" type="hidden" value="">' +
            '<input style="text-align:center;"class="form-control" readonly autocomplete="off" name="menueditStatus" id="menueditStatus" type="text" value="Default"></td>' +
            '</tr>'

].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var x1 = 1;
var rowTempY = [
    '<tr class="item-quote">' +
            '<td align="center" onclick=""><button type="button" id="deleteQuote"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="text-align:center;"  name="status" type="hidden" value="" ><input style="" class="form-control validate[required]" maxlength="100" placeholder="Select menu" readonly required autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" name="nameEnquiry" readonly id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox" value="Yes"><input class="form-control" autocomplete="off"  name="complementaryCode" id="complementaryCode" type="hidden" value="Yes"></td>' +
            '<td><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input class="form-control" autocomplete="off" name="itemquotRemarks" id="itemquotRemarks" type="text" value=""></td>' +
            '<input style="text-align:center;" class="form-control" autocomplete="off" name="remarksenqItem" id="remarksenqItem" type="hidden" value=""></td>' +
            '</tr>'

].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var y1 = 1;
var rowTemp8 = [
    '<tr class="service-quote">' +
            '<td align="center" onclick=""><button type="button" id="deletequoteService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input style="text-align:center;" name="pkquoteService" type="hidden" value="-1"><input name="statusService" type="hidden" value="" ><input class="form-control" maxlength="100" readonly placeholder="Select service" required autocomplete="off" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required] req" maxlength="100" required autocomplete="off" name="nameService" readonly id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required] req" readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required] req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="text" value=""></td>' +
            '<td><input style="" class="form-control" autocomplete="off" name="remarksenqService" readonly id="remarksenqService" type="text" value=""></td>' +
            '<td><input style="" class="form-control" autocomplete="off" name="servicequotRemarks" id="servicequotRemarks" type="text" value=""></td>' +
            '<td><input style="" class="form-control" autocomplete="off" name="" id="Service" type="checkbox" ><input class="form-control"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" value="Yes"></td>' +
            '</tr>'


].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var y12 = 1;
var rowTempSdi = [
    '<tr class="service-quote">' +
            '<td align="center" onclick=""><button type="button" id="deletequoteService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input style="text-align:center;" name="pkquoteService" type="hidden" value="-1"><input name="statusService" type="hidden" value="" ><input class="form-control validate[required] req" maxlength="100" readonly placeholder="Select service" required autocomplete="off" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required] req" maxlength="100" required autocomplete="off" name="nameService" readonly id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required] req"  readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;"class="form-control validate[required,custom[notzero]] req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value=""></td>' +
            '<td><input  style="text-align:center;"class="form-control validate[required] req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" readonly  autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="text" value=""></td>' +
            '<td><input style="" class="form-control req" autocomplete="off" name="servicequotRemarks" id="servicequotRemarks" type="text" value=""></td>' +
            '<td><input style="text-align:center;" name="remarksenqService" id="remarksenqService" class="req" type="hidden"><input class="form-control req"  autocomplete="off"  name="" id="Service" type="checkbox" ><input class="form-control"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" value="Yes"></td>' +
            '</tr>'


].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var y = 1;
var rowTempSY = [
    '<tr class="service-quote">' +
            '<td align="center" onclick=""><button type="button" id="deletequoteService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input style="" class="form-control req" maxlength="100" readonly placeholder="Select service" required autocomplete="off" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control req" maxlength="100" readonly required autocomplete="off" name="nameService" id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="" class="form-control req"  readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;" class="form-control req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="text" value=""></td>' +
            '<td><input style="" class="form-control" autocomplete="off" name="servicequotRemarks" id="servicequotRemarks" type="text" value="">' +
            '<input style="text-align:center;" class="form-control" autocomplete="off" name="remarksenqService" id="remarksenqService" type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="Service" type="checkbox" ><input class="form-control"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" value="Yes"></td>' +
            '</tr>'


].join('');

var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var q = 1;
var rowTemp10 = [
    '<tr class="item-order">' +
            '<td align="center" onclick=""><button type="button" id="deleteOrder"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" readonly required autocomplete="off" onclick="selectdates1(this);" name="requiredenquiryDate" id="requiredenquiryDate" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemorderfreeQty" id="itemorderfreeQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="complementaryCode" id="comp" type="checkbox">' +
            '<input style="text-align:center;" class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemordertotalWeight" id="itemordertotalWeight" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemorderRate" id="itemorderRate" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;"class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 2, 2);" name="itemorderDiscount" id="itemorderDiscount" type="text" value=""></td>' +
            '<td><input style="text-align:center;"class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemordertotAmt" id="itemordertotAmt" type="text" value=""></td>' +
            '<td><input style="text-align:center;"class="form-control" autocomplete="off" name="itemorderRemarks" id="itemorderRemarks" type="text" value=""></td>' +
            '</tr>'


].join('');

var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var qy = 1;
var rowTemp10Y = [
    '<tr class="item-order">' +
            '<td align="center" onclick=""><button type="button" id="deleteOrder"><i class="fa fa-trash fa-lg-o></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry" onclick="select-en(this);" type="text" value="" ></td>' +
            '<td><input class="form-control validate[required]" maxlength="100" required autocomplete="off" name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input class="form-control validate[required]" readonly required autocomplete="off" onclick="selectdates1(this);" name="requiredenquiryDate" id="requiredenquiryDate" type="text" value=""></td>' +
            '<td><input class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemorderfreeQty" id="itemorderfreeQty" type="text" value=""></td>' +
            '<td><input class="form-control"  autocomplete="off"  name="complementaryCode" id="comp" type="checkbox">' +
            '<input class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemordertotalWeight" id="itemordertotalWeight" type="text" value=""></td>' +
            '<td><input class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemorderRate" id="itemorderRate" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 2, 2);" name="itemorderDiscount" id="itemorderDiscount" type="text" value=""></td>' +
            '<td><input class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemordertotAmt" id="itemordertotAmt" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" name="itemorderRemarks" id="itemorderRemarks" type="text" value=""></td>' +
            '</tr>'


].join('');

var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var qx = 1;
var rowTempOdi = [
    '<tr class="item-order">' +
            '<td align="center" onclick=""><button type="button" id="deleteOrder"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required placeholder="Select menu" autocomplete="off" readonly name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" readonly name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input style="text-align:center;" class="form-control validate[required]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox">' +
            '<input class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" name="itemorderRemarks" maxlength="100" id="itemorderRemarks" type="text" value=""></td>' +
            '</tr>'


].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var qx13 = 1;
var rowTempOedi = [
    '<tr class="item-order">' +
            '<td align="center" onclick=""><button type="button" id="deleteOrder"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required placeholder="Select menu" autocomplete="off" readonly name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" readonly name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><div><span id="addEnquiryGetBtn" class="myButton17" tabindex="" onclick="selectorderdiMenu(this);"><i class="glyphicon glyphicon-copy"></i> Get Recipe</span></div></td>' +
            '<td><input style="text-align:center;"class="form-control validate[required,custom[notzero]]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text"></td>' +
            '<td><input style="text-align:center;" class="form-control" readonly autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;"id="menuReference" name="menuReference" type="hidden" value=""/><input style="text-align:center;" class="form-control" readonly autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox">' +
            '<input class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" name="itemorderRemarks" id="itemorderRemarks" type="text" value=""></td>' +
            '<td><input class="form-control" readonly autocomplete="off" name="menueditStatus" id="menueditStatus" type="text" value="Default"></td>' +
            '</tr>'

].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var qx1 = 1;
var rowTempShipDi = [
    '<tr class="item-ship">' +
            '<td align="center" onclick=""><button type="button" id="deleteShip"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required placeholder="Select menu" autocomplete="off" readonly name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style=""  class="form-control validate[required]" maxlength="100" required autocomplete="off" readonly name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input style="" class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text">' +
            '<input style="text-align:center;" class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="hidden" value="">' +
            '<input style="text-align:center;" class="form-control" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox">' +
            '<input class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" name="itemshipRemarks" maxlength="100" id="itemshipRemarks" type="text" value=""></td>' +
            '</tr>'


].join('');
var addup;
try {
    addup = callcategory();
} catch (error) {
    addup;
}
var qx6 = 1;
var rowTempShip = [
    '<tr class="item-ship">' +
            '<td align="center" onclick=""><button type="button" id="deleteShip"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addup + '</td>' +
            '<td><input style="" name="pkshipItem1" id="diorderItem" type="hidden" value="-1" ><input class="form-control validate[required]" maxlength="100" required placeholder="Select menu" autocomplete="off" readonly name="codeEnquiry" id="codeEnquiry" onclick="selectItem(this);" type="text" value="" ></td>' +
            '<td><input style="" class="form-control validate[required]" maxlength="100" required autocomplete="off" readonly name="nameEnquiry" id="nameEnquiry"  onkeypress="" type="text" value=""></td>' +
            '<td><div><span id="addEnquiryGetBtn" class="myButton17" tabindex="" onclick="selectorderdiMenu(this);"><i class="glyphicon glyphicon-copy"></i> Get Recipe</span></div></td>' +
            '<td><input style="text-align:center;" id="menuReference" name="menuReference" type="hidden" value=""/><input style="text-align:center;" class="form-control validate[required,custom[notzero]]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="portionQty" id="portionQty" type="text" value=""></td>' +
            '<td><input style="" class="form-control validate[required]" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="text">' +
            '<input style="text-align:center;" class="form-control validate[required]" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemunitPrice" readonly  id="itemunitPrice" type="hidden" value="">' +
            '<input style="text-align:center;" class="form-control" required autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="itemtotalPrice" readonly  id="itemtotalPrice" type="hidden" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control"  autocomplete="off"  name="" id="comp" type="checkbox">' +
            '<input class="form-control"  autocomplete="off"  name="complementaryCode" id="complementaryCode"  type="hidden" value=""></td>' +
            '<td><input style="" class="form-control" autocomplete="off" readonly name="itemorderRemarks" id="itemorderRemarks" type="text" value=""></td>' +
            '<td><input class="form-control" autocomplete="off" maxlength="100" name="itemshipRemarks" id="itemshipRemarks" type="text" value=""></td>' +
            '<td><input class="form-control" readonly autocomplete="off" name="menueditStatus" id="menueditStatus" type="text" value="Default"></td>' +
            '<td><input class="form-control" readonly autocomplete="off" name="storeLocation" id="storeLocation" type="text" value=""></td>' +
            '</tr>'

].join('');

var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var yx = 1;
var rowTempSodi = [
    '<tr class="service-order">' +
            '<td align="center" onclick=""><button type="button" id="deleteOrderService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required placeholder="Select Service" autocomplete="off" readonly palceholder="Select Service" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required autocomplete="off" readonly name="nameService" id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input class="form-control validate[required] req" readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]] req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="text" value=""></td>' +
            '<td><input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="text" value=""></td>' +
            '<td><input class="form-control req"  autocomplete="off"  name="" id="Service" type="checkbox" >' +
            '<input class="form-control req"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" ></td>' +
            '<td><input class="form-control req" autocomplete="off" name="serviceorderRemarks" id="serviceorderRemarks" type="text" value=""></td>' +
            '</tr> '



].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var yxz1 = 1;
var rowTempShipServiceDi = [
    '<tr class="service-ship">' +
            '<td align="center" onclick=""><button type="button" id="deleteShipService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required placeholder="Select Service" autocomplete="off" readonly palceholder="Select Service" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required autocomplete="off" readonly name="nameService" id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input class="form-control validate[required] req" readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]] req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value="">' +
            '<input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="hidden" value="">' +
            '<input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="hidden" value=""></td>' +
            '<td><input class="form-control req"  autocomplete="off"  name="" id="Service" type="checkbox" >' +
            '<input class="form-control req"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" ></td>' +
            '<td><input class="form-control req" autocomplete="off" maxlength="100" name="serviceshipRemarks" id="serviceshipRemarks" type="text" value=""></td>' +
            '</tr> '



].join('');
var addservice;
try {
    addservice = callservice();
} catch (error) {
    addservice;
}
var kah = 1;
var rowTempShipService = [
    '<tr class="service-ship">' +
            '<td align="center" onclick=""><button type="button" id="deleteShipService"><i class="fa fa-trash fa-lg-o"></i></button></td>' +
            '<td>' + addservice + '</td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required placeholder="Select Service" autocomplete="off" readonly palceholder="Select Service" name="codeService" id="codeService" onclick="selectService(this);" type="text" value="" ></td>' +
            '<td><input class="form-control validate[required] req" maxlength="100" required autocomplete="off" readonly name="nameService" id="nameService"  onkeypress="" type="text" value=""></td>' +
            '<td><input class="form-control validate[required] req" readonly autocomplete="off"  name="uomService" id="uomService" type="text" ></td>' +
            '<td><input style="text-align:center;" class="form-control validate[required,custom[notzero]] req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 1);" name="serviceQty" id="serviceQty" type="text" value="">' +
            '<input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="serviceunitPrice" readonly  id="serviceunitPrice" type="hidden" value="">' +
            '<input style="text-align:center;" class="form-control req" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" name="servicetotalPrice" readonly  id="servicetotalPrice" type="hidden" value=""></td>' +
            '<td><input class="form-control req"  autocomplete="off"  name="" id="Service" type="checkbox" >' +
            '<input class="form-control req"  autocomplete="off"  name="complementaryService" id="complementaryService" type="hidden" ></td>' +
            '<td><input class="form-control req" readonly autocomplete="off" name="serviceorderRemarks" id="serviceorderRemarks" type="text" value=""></td>' +
            '<td><input class="form-control req" autocomplete="off" maxlength="30" name="serviceshipRemarks" id="serviceshipRemarks" type="text" value=""></td>' +
            '<td><input class="form-control" maxlength="100" autocomplete="off" name="storeLocationS" maxlength="100" id="storeLocationS" type="text" value=""></td>' +
            '</tr> '



].join('');

/*
 We are overriding the autocomplete UI menu styles to create our own.
 You can add information from the returned json array as needed
 Just be sure that your array contains the correct value when returned
 You'll want to modify the ajax-services/fetch-inventory.php file for the returned values
 */
//$.ui.autocomplete.prototype._renderItem = function (ul, item) {
//    return $("<li></li>")
//            .data("item.autocomplete", item)
//
//            // This is the autocomplete list that is generated
//            .append("<a class='additionalInfo'>" + item.itemName + " - " + item.itemDesc + " " +
//                    // This is the hover box that is generated when you hover over an item in the list
//                    "</a>")
//
//            .appendTo(ul);
//};

/*
 Here's where we start adding rows to the invoice
 Add row to list and allow user to use autocomplete to find items.
 */

$("#addRowBtn").on('click', function (e) {
    mioInvoice.addRow();
    e.preventDefault();
});
$("#addRowBtncharge").on('click', function (e) {
    mioInvoice.addRow1();
    e.preventDefault();
});
$("#addRowBtndiscount").on('click', function (e) {
    mioInvoice.addRow2();
    e.preventDefault();
});
$("#addRowBtndocument").on('click', function (e) {
    mioInvoice.addRow3();
    e.preventDefault();
});
$("#addEnquiryBtn").on('click', function (e) {
    mioInvoice.addRow4();
    e.preventDefault();
});
$("#addEnquiryBtnX").on('click', function (e) {
    mioInvoice.addRowX();
    e.preventDefault();
});
$("#addEnquiryBtnX1").on('click', function (e) {
    mioInvoice.addRowX8();
    e.preventDefault();
});
$("#addEnquiryBtnX2").on('click', function (e) {
    mioInvoice.addRowX9();
    e.preventDefault();
});
$("#addRowComplement").on('click', function (e) {
    mioInvoice.addRow5();
    e.preventDefault();
});
$("#addServiceBtn").on('click', function (e) {
    mioInvoice.addRow6();
    e.preventDefault();
});
$("#addQuoteBtnY").on('click', function (e) {
    mioInvoice.addRowY();
    e.preventDefault();
});
$("#addQuoteBtn").on('click', function (e) {
    mioInvoice.addRow7();
    e.preventDefault();
});
$("#addQuoteBtnDirect").on('click', function (e) {
    mioInvoice.addRowDi();
    e.preventDefault();
});
$("#addQuoteServiceBtn").on('click', function (e) {
    mioInvoice.addRow8();
    e.preventDefault();
});
$("#addQuoteServiceBtnDi").on('click', function (e) {
    mioInvoice.addRowSdi();
    e.preventDefault();
});
$("#addQuoteServiceBtnY").on('click', function (e) {
    mioInvoice.addRowSY();
    e.preventDefault();
});
$("#addOrderBtn").on('click', function (e) {
    mioInvoice.addRow10();
    e.preventDefault();
});
$("#addOrderBtnEd").on('click', function (e) {
    mioInvoice.addRowOedi();
    e.preventDefault();
});

$("#addOrderBtnDi").on('click', function (e) {
    mioInvoice.addRowOdi();
    e.preventDefault();
});
$("#addOrderServiceBtnDi").on('click', function (e) {
    mioInvoice.addRowSodi();
    e.preventDefault();
});
$("#addShipRowDi").on('click', function (e) {
    mioInvoice.addRowShipDi();
    e.preventDefault();
});
$("#addShipRow").on('click', function (e) {
    mioInvoice.addRowShip();
    e.preventDefault();
});
$("#addserviceShipDi").on('click', function (e) {
    mioInvoice.serviceShipDi();
    e.preventDefault();
});
$("#addserviceShip").on('click', function (e) {
    mioInvoice.addserviceShip();
    e.preventDefault();
});

/*
 Update invoice total when item Qty or Price inputs have been updated
 */
$(document).on('keyup', itemQtyPriceSelectors, function () {
    mioInvoice.updatePrice(this);
});
$(document).on('click', '#comp', function () {
    mioInvoice.updatePrice(this);
});
$(document).on('click', '#Service', function () {
    mioInvoice.updateservicePrice(this);
});
$(document).on('keyup', servicePriceSelectors, function () {
    mioInvoice.updateservicePrice(this);
});
$(document).on('keyup', '#quotDiscount', function () {
    mioInvoice.updatebothTotal(this);
});
$(document).on('keyup', '#orderreDiscount', function () {
    mioInvoice.updaterebothTotal(this);
});
$(document).on('keyup', '#totalBudget', function () {
    mioInvoice.updatebothTotal(this);
});
$(document).on('keyup', '#advancepayAmt', function () {
    mioInvoice.updaterebothTotal(this);
    mioInvoice.updatebothTotal(this);
    mioInvoice.updateservicePrice(this);
    mioInvoice.updatereservicePrice(this);
});
$(document).on('keyup', '#returnQty', function () {
    mioInvoice.updatePrice(this);
    mioInvoice.updatereturnPrice(this);
});
$(document).on('keyup', '#servicereQty', function () {
    mioInvoice.updateservicePrice(this);
    mioInvoice.updatereservicePrice(this);
});
$(document).on('keyup', '#ordertotCharge', function () {
    mioInvoice.updatePrice(this);
    mioInvoice.updaterebothTotal(this);
    mioInvoice.updateservicePrice(this);
    mioInvoice.updatereservicePrice(this);
});
$(document).on('keyup', '#totchargeReturn', function () {
    mioInvoice.updatePrice(this);
    mioInvoice.updaterebothTotal(this);
    mioInvoice.updateservicePrice(this);
    mioInvoice.updatereservicePrice(this);
});


//$("input#itemDiscount").on('change', function () {
//    mioInvoice.updatePrice(this);
//});

/*
 Update invoice total when invoice tax input has changed
 */
//$("input#PandH").on('keyup', function () {
//    mioInvoice.updateTotal();
//});
//$("select#PandHSelect").on('change', function () {
//    mioInvoice.updateTotal();
//});
//$("input#freight").on('keyup', function () {
//    mioInvoice.updateTotal();
//});
//$("select#freightSelect").on('change', function () {
//    mioInvoice.updateTotal();
//});
//$("input#insurance").on('keyup', function () {
//    mioInvoice.updateTotal();
//});
//$("select#insuranceSelect").on('change', function () {
//    mioInvoice.updateTotal();
//});
//$("input#octroi").on('keyup', function () {
//    mioInvoice.updateTotal();
//});
//$("select#octroiSelect").on('change', function () {
//    mioInvoice.updateTotal();
//});
//$("input#charges").on('keyup', function () {
//    mioInvoice.updateTotal();
//});


/*
 Remove row when clicked
 */
$(document).on('click', '#deleteRow', function () {
    mioInvoice.deleteRow(this);
});
$(document).on('click', '#deleteRowcharge', function () {
    mioInvoice.deleteRow1(this);
});
$(document).on('click', '#deleteRowdiscount', function () {
    mioInvoice.deleteRow2(this);
});
$(document).on('click', '#deleteRowdocument', function () {
    mioInvoice.deleteRow3(this);
});
/*$(document).on('click', '#deleteEnquiry', function () {
    mioInvoice.deleteRow4(this);
});*/
$(document).on('click', '#deleteComplement', function () {
    mioInvoice.deleteRow5(this);
});
$(document).on('click', '#deleteService', function () {
    mioInvoice.deleteRow6(this);
});
$(document).on('click', '#deleteQuote', function () {
    mioInvoice.deleteRow7(this);
});
$(document).on('click', '#deletequoteService', function () {
    mioInvoice.deleteRow8(this);
});
$(document).on('click', '#deleteOrder', function () {
    mioInvoice.deleteRow9(this);
});
$(document).on('click', '#deleteOrderService', function () {
    mioInvoice.deleteRow10(this);
});
$(document).on('click', '#deleteShip', function () {
    mioInvoice.deleteRow11(this);
});
$(document).on('click', '#deleteShipService', function () {
    mioInvoice.deleteRow12(this);
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
//$('body').on("focus", lookupSelector, function () {
//    $(window).bind('beforeunload', function () {
//        return "You haven't saved your data.  Are you sure you want to leave this page without saving first?";
//    });
//});
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

