/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function calculateTotal(event){
    //alert("Function reached");
   
//    var itemRate = $(event.target).parents('tr').find('.itemrate').val();
//    console.log(itemRate);
//    var itemQty = $(event.target).parents('tr').find('.itemQty').val();
//    console.log(itemQty);
//    var amountTotal = Number(itemRate) * Number(itemQty);
//    console.log(amountTotal);
//    $(event.target).parents('tr').find('#itemtotal').val(amountTotal);
                           
//                           var table = document.getElementById("myTable");
//                           
//                            var row12 = table.rows[1];
//                            var arrRate = [];
//                            var vatarrRate = [];
//                            for (var i = 1, row; row = table.rows[i]; i++) {
//                               for (var j = 6, col; col = row.cells[j]; j++) {
//                                    if(j<7){
//                                        var ratefield = col.childNodes[0].value;
//                                        var amtfield = col.nextSibling.nextElementSibling.nextSibling.nextElementSibling.nextSibling.nextElementSibling.nextSibling.nextElementSibling.childNodes[0].nextSibling.childNodes[0];
//                                        var vatamtfield = col.nextSibling.nextElementSibling.nextSibling.nextElementSibling.nextSibling.nextElementSibling.childNodes[0].childNodes[0].nextSibling.childNodes[0];
//                                        var qtyfield = col.nextSibling.nextElementSibling.nextSibling.nextElementSibling.childNodes[0].value;
//                                        var vatfield = col.nextSibling.nextElementSibling.childNodes[0].value;
//                                        var vatper = (Number(ratefield)) * (Number(vatfield)) / 100 ;
//                                                amtfield.value = (ratefield *  qtyfield).toFixed(3);
//                                                arrRate.push(Number(amtfield.value));
//                                                
//                                    }
//                               }  
//                            };
                            
    calcTotal();
}
function calcTotal(){
               
                            var subTotalInput = document.getElementById('subTotalInput');

                            var total = document.getElementById('total');

                           var table = document.getElementById("myTable");
                 var row12 = table.rows[1];
//                           console.log(row12.childNodes[3].nextSibling.nextElementSibling.childNodes[0].value);
                            var arrRate = [];
                             var itemRate ;
                              var itemTotal;
                              var itemQty;
                              var itemtotal, vatpers, vatTotal, discpers, discAmount;
                              
                           // var vatarrRate = [];
                            var qtarrRate = [];
                            $("#commontbody tr").each(function(){
                                itemRate = $(this).find('.itemrate').val();
                                itemQty = $(this).find('.itemQty').val();
                                vatpers = $(this).find('.vatpersAmt').val();
                                discpers = $(this).find('.discperAmount').val();
                                
                                console.log(vatpers)
                                itemTotal = Number(itemRate) * Number(itemQty);
                                vatTotal = itemTotal * Number(vatpers) / 100;
                                discAmount = itemTotal * Number(discpers) / 100;
                                $(this).find('#itemvattotal').val(vatTotal);
                                $(this).find('#itemdisctotal').val(discAmount);
                                itemTotal = itemTotal+ vatTotal;
                                itemTotal = itemTotal - discAmount;
                                $(this).find('#itemtotal').val(itemTotal);
                                arrRate.push(itemTotal);
                            })

//                            console.log(vatarrRate);
                            let sum1 = arrRate.reduce(function (accumulator, currentValue) {
                                    return accumulator + currentValue
                                  }, 0);
                                  
                                  
                               var elementarrRate = [];
                           
                            $("#elementmyTable tbody tr").each(function(){
                              var  elementRate = $(this).find('#costingvalues').val();   
                             
                            //    elementTotal += elementRate;
                                  elementarrRate.push( Number(elementRate));
                            })

                            let elementSum = elementarrRate.reduce(function (ac, cu) {
                            return ac + cu
                          }, 0);   
                                  
                               var sum = Number(sum1) + Number(elementSum)
                               var additionalTax = $("#additionalTax").val();
                               var totalAditionTax = Number(additionalTax) * sum / 100;
                               
                               $("#taxpercent").val(Number(totalAditionTax).toFixed(3));
                               
                            subTotal = sum.toString();
                            // Convert input string to a number and store as a variable.
                                var value = Number(subTotal);      
                            // Split the input string into two arrays containing integers/decimals
                                var res = subTotal.split(".");     
                            // Set the number to two decimal places
                                    value = value.toFixed(3);
                                
                                subTotalInput.value = value;

                            var totalVal = Number(value) + Number(totalAditionTax);
                            console.log(totalVal)
              // adding two decimal places for total after tax rate
                            totalstring = totalVal.toString();
                            // Convert input string to a number and store as a variable.
                                var totalnumber = Number(totalstring);      
                            // Split the input string into two arrays containing integers/decimals
                                var res = totalstring.split(".");     
                            // If there is no decimal point or any decimal place found.
                            // Set the number to two decimal places
                                    totalnumber = totalnumber.toFixed(3);
                                    

//                            baldue.value =  totalnumber;
                            total.value = totalnumber;
                //            subTotalEle.innerText = '₹'+value;

                        }
                        
                        
                        
                        
function addRow(e) {
     
    e.preventDefault();
//            var table = document.getElementById('myTable');
            //var row = document.getElementById("myTable");
            var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
            var x = tableRef.insertRow((tableRef.rows.length));
//            var e = table.rows.length-1;
              var rowlen = tableRef.rows.length;
//              var prodlist = callcategoryproduct();
//                              var columnLength = document.getElementById('myTable').rows[0].cells.length;
//                              alert(columnLength);
//            var l = table.rows[e].cells.length;
            x.innerHTML = `<tr class="item-row item-row-1 with-tax" id='myRow'>
                    <td class="item-row-actions">
                                              <div class="confirm-delete-button"><button title="Remove Item" onClick="removeRow(event)"
                                                 class="btn btn-light border"><i class="fa fa-times"></i></button>
                                              </div>
                                             <input type="hidden" class="form-control" id="productSno" name="sno"
                                                                                           value="" >
                                           </td>
                                                        <td>
                                               <input style="text-align: center;width: auto;" type="text" class="form-control" autocomplete="off" id="itemSno" name="itemSno""
                                              value="${rowlen}" size="1" readonly>
                                              <input type="hidden" class="form-control" id="itemtype" name="itemtype" value="Product">
                                           </td>
                                                <td>
                                                    <input type="text" placeholder="Item Name" class="form-control" id="category0" name="productCategory" maxlength="100" required>
                                                </td>
                                                
                                                <td style="width: 150px">
                                                    <input type="text" class="form-control" placeholder="Enter Product Name" autocomplete="off" id="itemdesc" name="itemdesc"
                                                           value="" style="display: none;" disabled="true">
                                                    <span class="item-row-description">
                                                        <input class="item-description-input form-control" maxlength="100" placeholder="Item Description" name="itemdetails" id="itemdetails" >
                                                    </span>
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="UOM" class="form-control" id="uomType" name="uomType" maxlength="100" required>
                                                    <input type="hidden" id="prodservicetimespan" name="servicetimespan" value="">
                                                </td>
                                                <td><input style="width: 70px;" type="text" class="form-control itemrate" placeholder="0.00" autocomplete="off" id="itemrate0" name="itemrate" onkeypress="return isNumber(event)" onInput="calcTotal();calculateTotal(event)" 
                                                           value="0.00" maxlength="10">
                                                </td>
                                                <td><input style="width: 60px;" type="text" class="form-control vatpersAmt" placeholder="0" autocomplete="off" id="vatAmount" name="vatAmount" onInput="calcTotal()" onkeyup="return isNumberWithDot(event)"
                                                           value="0"  size="3" maxlength="6"></td>
                                                <td><input style="width: 60px;" type="text" class="form-control discperAmount" placeholder="0" autocomplete="off" id="itemDiscount" name="itemDiscount" onInput="calcTotal()" onkeyup="return isNumberWithDot(event)"
                                                           value="0"  size="3" maxlength="6"></td>
                                                <td><input style="width: 50px;" type="text" class="form-control itemQty" autocomplete="off" placeholder="0" value="1" id="itemqty" name="itemqty" onInput="calcTotal();calculateTotal(event)" onkeypress="return isNumber(event)"
                                                           size="3" maxlength="5">
                                                    <input type="hidden" class="form-control" value="0" name="stock" id="stock">
                                                </td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemvattotal" id="itemvattotal"></span></div></td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemdisctotal" id="itemdisctotal"></span></div></td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemtotal" id="itemtotal"></span></div></td>
                                               
                                                </tr>`;

//                   updateSymbol();
//                                   const cbox = document.querySelectorAll(".itemdescriptions");
//
//                                    for (let i = 0; i < cbox.length; i++) {
//                                        autocomplete(cbox[i], countries);
//                    //                    cbox[i].addEventListener("click", function() {
//                    //                      cbox[i].classList.toggle("red");
//                    //                    });
//                                    }
//                    $("#category").empty();


                //            for (var c=0, m=l; c < m; c++) {
                //                table.rows[0].insertCell(c);
                //                table.rows[0].cells[c].innerHTML = "&nbsp;&nbsp;row";
                //            }
                



                        }
   //add a row to description js ends
  // $('table select').select2();
    function removeRow(e){
            e.preventDefault();
            e.target.closest("tr").remove();
//                            console.log(e.target.closest("tr"));
            calcTotal();
        }                        
                        
                        


function isNumberWithDot(evt){
                var val = evt.target.value;
                if(isNaN(val)){
                     val = val.replace(/[^0-9\.]/,'');
                     if(val.split('.').length>3) 
                         val =val.replace(/\.+$/,"");
                }
                evt.target.value = val;
            }

            function isNumberKey(evt)
            {
                $(this).on("cut copy paste",function(e) {
                    e.preventDefault();
                 });
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode >= 31 && (charCode < 48 || charCode > 57)){
                    swal("Special characters and alphabets are not allowed");
                    evt.preventDefault();
                    return false;
                } else {
                    return true;
                }
                    
                
            }
            
            function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
}
    return true;
}