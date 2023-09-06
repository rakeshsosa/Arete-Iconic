/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 Created on : May 12, 2016, 3:36:53 PM
 Author     : Nataraj
 */

//Mouse Over It will display last 3 po list
function  checkPrevPO($this, itemCode)
{
    var header = '<th>Supplier Name</th><th>Item Name</th><th>Unit Price</th><th>Perc Diff(%)</th><th>PO No</th><th>PO Date</th>'
    $.ajax({
        type: 'POST',
        url: '../purchReq/chkPrevPO.htm',
        data: {
            itemCode: itemCode,
        },
        success: function (data) {
            if (data === 'Not Yet Purchased...!!') {
//                                                                            alert('Not Yet Purchased...!!');
                jQuery($this).find('#prevpolst').html('Not Yet Purchased...!!');
                $($this).hover(function (ev) {
                    jQuery($this).find('#t01').stop(true, true).fadeIn();
                }, function (ev) {
                    jQuery($this).find('#t01').stop(true, true).fadeOut();
                }).mousemove(function (ev) {
                    jQuery($this).find('#t01').css({left: ev.layerX + 10, top: ev.layerY + 10});
                    jQuery($this).find('#t01').css("z-index", "10");
                });
                return false;
            } else
            {
                var rowVal = data.split("$");
                var body;
                var baseperc = 0, totalperc = 0;
                for (var i = 0; i < rowVal.length - 1; i++) {
                    var polist = rowVal[i].split(",");
                    baseperc = polist[1];
                }
                for (var i = 0; i < rowVal.length - 1; i++) {
                    var polist = rowVal[i].split(",");
                    totalperc = (polist[1] / baseperc) * 100;
                    totalperc = totalperc - 100;
                    body = body + '<tr class="prevlst"><td>' + polist[4] + '</td><td>' + polist[0] + '</td><td class="right">' + parseFloat(polist[1]).toFixed(3) + '</td><td id="percent" class="right">' + parseFloat(totalperc).toFixed(2) + '</td><td>' + polist[2] + '</td><td>' + moment(polist[3]).format('DD-MMM-YYYY') + '</td></tr>';

                }
                jQuery($this).closest('tr');
                jQuery($this).find('#prevhead').html(header);
                jQuery($this).find('#prevpolst').html(body);



                $($this).hover(function (ev) {
                    jQuery($this).find('#t01').stop(true, true).fadeIn();
                }, function (ev) {
                    jQuery($this).find('#t01').stop(true, true).fadeOut();
                }).mousemove(function (ev) {
                    jQuery($this).find('#t01').css({left: ev.layerX + 10, top: ev.layerY + 10});
                    jQuery($this).find('#t01').css("z-index", "10");
                });
            }


        }


    });



}

