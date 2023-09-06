function serviceaddRow(e) {
    e.preventDefault();

    var tableRef = document.getElementById("servicemyTable").getElementsByTagName("tbody")[0];
    var x = tableRef.insertRow(tableRef.rows.length);

    var rowlen = tableRef.rows.length;
    var servlist = callcategoryservice();

    x.innerHTML = `<tr class="item-row item-row-1 with-tax" id='myRow'>
                                           <td class="item-row-actions">
                                              <div class="confirm-delete-button"><button title="Remove Item" onClick="serviceremoveRow(event)"
                                                 class="btn btn-light border"><i class="fas fa-times"></i></button>
                                              </div>
                                            <input type="hidden" class="form-control" id="sno" name="sno"
                                              value="" >
                                           </td>

                                            <td>
                                               <input type="text" class="form-control text-center" autocomplete="off" id="itemSno" name="itemSno""
                                              value="${rowlen}" size="2" readonly>
                                           </td>
                                         <input type="hidden" class="form-control" id="itemtype" name="itemtype" value="Service">
                                          <td>
                                               <input class="form-control" id="servicecategory${rowlen}" name="productCategory" onchange="servicecatfilter(event)">
                                                   
                                           
                                           </td>
                             
                                             <td>
                                                            <input class="form-control" id="servicedescription${rowlen}" name="servicedescription" value="" />
                                                        </td>
                                         
                                        
                                           <td><input type="text" class="itemrate form-control" autocomplete="off" placeholder="0.00" id="serviceitemrate${rowlen}" name="itemrate" oninput="calcTotal();calculateTotal(event)" onkeypress="return isNumber(event)"
                                              value="" maxlength="8"></td>
                                            <td><input  type="text" class="form-control vatAmount" placeholder="0" autocomplete="off" id="vatAmount" name="vatAmount" onInput="calcTotal()" onkeyup="return isNumberWithDot(event)"
                                                           value="0" ></td>
                                         
                                        <td class=""><div class="d-flex"><span class="currency"></span><span><input  type="text"  readonly class="form-control" value="0.00" name="itemvattotal" id="itemvattotal"></span></div></td>

                                           <td class="d-flex"><span class="currency"></span><span><input type="text" size="10" readonly class="form-control "  value="0.00" name="itemtotal" id="itemtotal"></span></td>  <input type="hidden" id="uomType" name="uomType" value="">
                                          
                                                                       
                                            `;

    updateSymbol();
}

function serviceremoveRow(e) {
    e.preventDefault();
    e.target.closest("tr").remove();

    calcTotal();
}

var incsummary = document.querySelector(".incsummary");

function calcTotal() {
    var subTotalInput = document.getElementById("subTotalInput");
    var vatsubTotalInput = document.getElementById("vatpertotl");
    var total = document.getElementById("total");

    var arrRate = [];
    var itemRate;
    var itemTotal;

    var vatarrRate = [];

    var vatfield;
    var vatper;

    $("table tbody tr").each(function () {
        itemRate = $(this).find(".itemrate").val();

        vatfield = $(this).find(".vatAmount").val();
        console.log(itemRate);
        vatper = (Number(itemRate) * Number(vatfield)) / 100;
        $(this).find("#itemvattotal").val(vatper);

        itemTotal = Number(itemRate);

        arrRate.push(itemTotal);
        vatarrRate.push(vatper);
    });

    let sum = arrRate.reduce(function (accumulator, currentValue) {
        return accumulator + currentValue;
    }, 0);

    let vatsum = vatarrRate.reduce(function (accumulator, currentValue) {
        return accumulator + currentValue;
    }, 0);

    subTotal = sum.toString();

    var value = Number(subTotal);

    var res = subTotal.split(".");

    value = value.toFixed(3);

    subTotalInput.value = value;

    vatsubTotal = vatsum.toString();

    var vatvalue = Number(vatsubTotal);

    var vatres = vatsubTotal.split(".");

    vatvalue = vatvalue.toFixed(3);

    vatsubTotalInput.value = vatvalue;

    var totalVal = Number(value) + Number(vatsubTotalInput.value);
    totalstring = totalVal.toString();
    var totalnumber = Number(totalstring);
    var res = totalstring.split(".");

    totalnumber = totalnumber.toFixed(3);

    total.value = totalnumber;

    //set amound paid value
    var enteredAmounValue = $("#amounpaid").val();
    if (enteredAmounValue > $("#total").val()) {
        alert("Amound paid should be less than total amount");
        return;
    } else {
        $("#amounpaidfinal").val(enteredAmounValue);
    }

    //calculate balance due value
    balDue = Number($("#total").val()) - Number($("#amounpaidfinal").val());
    $("#balDue").val(balDue);

    // calculateTax();
}

//calculate baldue
function calculateBalanceDue() {
    //set amound paid value
    var enteredAmounValue = $("#amounpaid").val();
    if (enteredAmounValue > $("#total").val()) {
        alert("Amound paid should be less than total amount");
        $("#amounpaid").val("");
        $("#amounpaidfinal").val(0.0);
        $("#balDue").val(0.0);
    } else {
        $("#amounpaidfinal").val(enteredAmounValue);
        //calculate balance due value
        balDue = Number($("#total").val()) - Number($("#amounpaidfinal").val());
        $("#balDue").val(balDue);
    }
}

function calculateTotal(event) {
    var itemRate = $(event.target).parents("tr").find(".itemrate").val();
    var amountTotal = Number(itemRate);
    $(event.target).parents("tr").find("#itemtotal").val(amountTotal);
    calcTotal();
}

function calculateTax() {
    var discrate = document.getElementById("disc").value;
    //                    var discpercent = document.getElementById("discpercent");
    var disclabel = document.querySelector(".disclabel");
    var subTotalInput = document.getElementById("subTotalInput");
    var vatsubTotalInput = document.getElementById("vatpertotl");
   
    disclabel.innerHTML = `Discount (${discrate}%)`;
    var discper = (Number(subTotalInput.value) * Number(discrate)) / 100;

   
    discperstring = discper.toString();
    var discpernumber = Number(discperstring);

    discpernumber = discpernumber.toFixed(3);
    discpercent.value = discpernumber;

    var totalVal = Number(subTotalInput.value) - discper + Number(vatsubTotalInput.value);

    totalstring = totalVal.toString();
    // Convert input string to a number and store as a variable.
    var totalnumber = Number(totalstring);
    // Split the input string into two arrays containing integers/decimals

    // If there is any decimal points
    // Set the number to two decimal places
    totalnumber = totalnumber.toFixed(3);

    total.value = totalnumber;

    var inccheckbox = document.getElementById("inc");

}

function calculateDiscount() {
    calcTotal();
    calculateTax();
}

var taxtype = document.querySelector("#tax-type");
var taxrate = document.querySelector(".tax-rate-container");
var taxinc = document.querySelector(".tax-inc-container");
var taxlabel = document.querySelector(".tax-label-container");
var taxsummarycon = document.querySelector(".tax-summary-container");


function calcAmountPaid() {
    // var amountpaidrate = document.querySelector("#amount_paid_rate").value;
    var amountpaid = document.querySelector("#amountpaid");
    var total = document.querySelector("#total").value;
    var baldue = document.querySelector("#baldue");

    totalstring = amountpaidrate.toString();

    var totalnumber = Number(totalstring);

    amountpaid.value = totalnumber.toFixed(3);

    totalstring = baldue.value.toString();

    var totalnumber = Number(totalstring);

    var res = totalstring.split(".");
}

//is numberkey code starts
function isNumber(evt) {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function isNumberWithDot(evt) {
    var val = evt.target.value;
    if (isNaN(val)) {
        val = val.replace(/[^0-9\.]/, "");
        if (val.split(".").length > 3) val = val.replace(/\.+$/, "");
    }
    evt.target.value = val;
}

function allowThreeDecimal(ev) {
    var v = parseFloat(ev.target.value);
    if (isNaN(v)) {
        ev.target.value = "";
    } else {
        ev.target.value = v.toFixed(3);
    }
}
function updateSymbol() {
    var selected = $(".currency-selector option:selected");
    var a = selected.text();
    $(".currency").text(selected.data("symbol"));
}

$(".currency-selector").on("change", updateSymbol);