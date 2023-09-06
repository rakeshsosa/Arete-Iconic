<%-- 
    Document   : supplier
    Created on : Apr 19, 2016, 9:27:50 AM
    Author     : Sudhanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body class="nav-md">


        <script>
            function test(val1,val2) {
                $(window.opener.document).find('#${rowid} #supplierName').val(val2);
                $(window.opener.document).find('#${rowid} #supplierCode').val(val1);
                window.close();
            }

            checked = false;
            function checkAll() {
                var aa = document.getElementById('contDetForm');
                // alert('test');
                if (checked == false) {
                    checked = true;
                } else {
                    checked = false;
                }
                for (var i = 0; i < aa.elements.length; i++) {
                    aa.elements[i].checked = checked;
                }
            }

            function typelist(contDetForm) {
                
//                window.opener.document.getElementById('Class').value = val1;
                window.opener.document.getElementById('codeEnquiry').value = val2;
                window.opener.document.getElementById('nameEnquiry').value = val3;
//                window.opener.document.getElementById('mtid').value = val4;
                window.opener.document.getElementById('descriptionEnq').value = val5;
                window.close();
            }

            function chkNumber(obj,val,ttype){
                var cVal=document.getElementById(obj.id).value;
                var iType=isNaN(cVal)
                if(iType==true){
                    document.getElementById(obj.id).value=val;
                }
                else{
                    if(ttype=="gq"){
                        if(!(parseInt(cVal)<=parseInt(val))){
                            document.getElementById(obj.id).value=val;
                            alert("GRN Qty should be less or equal to "+val);
                        }
                    }
                }
            }
            function isNumberKey(event)
                        {

                            var charCode = (event.which) ? event.which : event.keyCode;
                            if (charCode != 46 && charCode > 31
                                    && (charCode < 48 || charCode > 57 || charCode==8))
                            {
                                return false;
                            }
                            else
                            {
                                return true;
                            }
                        }
            function closeChildPage(){
                window.close();
            }  
            
            function calcDetails(obj,curr,discount,rqty){
               var idArr=(obj.id).split("_");
               var n=idArr[1];
               var nId=idArr[0];
               if(nId=="unitprice"){
                   var unitprice= document.getElementById(obj.id).value;
                   var grnqty= document.getElementById("grnqty_"+n).value;
                   var grnAmt=parseFloat(unitprice)*parseFloat(grnqty);
                   var disPer=(parseFloat(grnAmt)*parseFloat(discount))/100;
                   document.getElementById("grnamt_"+n).innerHTML= grnAmt;
                   var bAmt=0;
                   $(".grnamtc").each(function(){
                       bAmt=parseFloat(bAmt)+parseFloat($(this).text());
                    });
                    document.getElementById("bamt").innerHTML= bAmt+".0  "+curr;                    
               }
               else{
                    var grnqty= document.getElementById(obj.id).value;
                    if(parseFloat(grnqty)<=parseFloat(rqty)){
                        var unitprice= document.getElementById("unitprice_"+n).value;
                        var grnAmt=parseFloat(unitprice)*parseFloat(grnqty);
                        var disPer=(parseFloat(grnAmt)*parseFloat(discount))/100;
                        document.getElementById("grnamt_"+n).innerHTML= (parseFloat(grnAmt)-parseFloat(disPer));
                        var bAmt=0;
                       $(".grnamtc").each(function(){
                           bAmt=parseFloat(bAmt)+parseFloat($(this).text());
                        });
                        document.getElementById("bamt").innerHTML= bAmt+".0  "+curr;
                     }
                     else{
                         document.getElementById(obj.id).value=rqty;
                         var unitprice= document.getElementById("unitprice_"+n).value;
                        var grnAmt=parseFloat(unitprice)*parseFloat(rqty);
                        var disPer=(parseFloat(grnAmt)*parseFloat(discount))/100;
                        document.getElementById("grnamt_"+n).innerHTML= (parseFloat(grnAmt)-parseFloat(disPer));
                        var bAmt=0;
                       $(".grnamtc").each(function(){
                           bAmt=parseFloat(bAmt)+parseFloat($(this).text());
                        });
                        document.getElementById("bamt").innerHTML= bAmt+".0  "+curr;
                     }
               }
            }
            function savePODetails(sno){
                var uprice;
                var grnqty;
                $(".uprice").each(function(){
                    if(uprice==null || uprice==""){
                        uprice=$(this).val();
                    }
                    else{
                        uprice=uprice+"_"+$(this).val();
                    }
                });
                $(".grnqty").each(function(){
                    if(grnqty==null || grnqty==""){
                        grnqty=$(this).val();
                    }
                    else{
                        grnqty=grnqty+"_"+$(this).val();
                    }
                });
                var upId="unitp"+sno;
                var grnqId="grnq"+sno;
                var selectpo1="selectpo"+sno;
//                alert(upId);
                window.opener.document.getElementById(upId).value = uprice;
                window.opener.document.getElementById(grnqId).value = grnqty;
                window.opener.document.getElementById(selectpo1).checked = true;
                window.close();
            }
        </script>

        <div class="clearfix"></div>

        <div class="main_container">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <input type="hidden" value="${rowid}" id="rowid">
                    <div class="x_title">
                        <h2>Item List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example1" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                   
                                        <th></th>       
                                        <th>S.No</th>       
                                        <th>PO No</th>
                                        <th>GRN NO</th>
                                        <th>Item name</th>
                                        <th>Unit price</th>                                      
                                        <th>GRN Qty</th>                                      
                                        <th>GRN Amount</th>                                      
                                    </tr>
                                </thead>

                                <tbody>                                   
                                    <c:set var="j" value="0"/>
                                    <c:set var="billamt" value="0"/>
                                    <c:set var="bamt" value="0"/>
                                    <c:set var="disc" value="0"/>
                                    <c:forEach items="${grndetails}" var="type">
                                        <c:set var="j" value="${j+1}"/>
                                        <tr onclick="test('${type.poNo}','${type.poNo}');">                                            
                                            <td class="center" ><input type="checkbox" id="selectitem" name="selectitem" value="selectitem"></td>
                                            <td class="center" >${j}</td>
                                            <td class="center" >${type.poNo}</td>
                                            <td class="center" >${type.goodReceiptNo}</td>
                                            <td class="center" >${type.itemName}</td>
                                            <td class="center" ><input class="form-control uprice" style="text-align: center;" name="unitprice" id="unitprice_${j}"  autocomplete="off" type="text" maxlength="30" value="<fmt:formatNumber pattern="0.000" value="${type.unitPrice}"/>" onchange="chkNumber(this,'${type.unitPrice}','up');" onkeypress="return isNumberKey(event)" onkeyup="calcDetails(this,'${currency}','${type.discount}','${type.receivingQty}');"></td>
                                            <td class="center" ><input class="form-control grnqty" style="text-align: center;" name="grnqty" id="grnqty_${j}"  autocomplete="off" type="text" maxlength="30" value="<fmt:formatNumber pattern="0.000" value="${type.receivingQty}"/>" onchange="chkNumber(this,'${type.receivingQty}','gq');" onkeypress="return isNumberKey(event)" onkeyup="calcDetails(this,'${currency}','${type.discount}','${type.receivingQty}');"></td>
                                            <td class="center" ><span id="grnamt_${j}" class="grnamtc">${(type.receivingQty)*(type.unitPrice)}</span></td>
                                            <c:set var="bamt" value="${(type.receivingQty)*(type.unitPrice)}"/>
                                            <c:set var="disc" value="${(bamt*(type.discount))/100}"/>
                                            <c:set var="billamt" value="${billamt+(bamt-disc)}"/>
                                            
                                        </tr>
                                    </c:forEach>
                                        <tr>
                                            <td colspan="7" ><span style="float: right; font-size: 19px; padding-right: 5px;">Billed Amount :</span></td>
                                            <td colspan="8" ><span id="bamt" style="font-size: 19px;"><fmt:formatNumber pattern="0.000" value="${billamt}"/> ${currency}</span></td>
                                        </tr>
                                </tbody>

                            </table>
                            <div class="clearfix"></div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 ">
                                                <!--<p>&nbsp;</p>-->
                                                <button type="button" class="btn btn-primary" onclick="savePODetails('${no}');">Save</button>
                                                <a href="#" class="btn btn-danger" onclick="closeChildPage();">Cancel</a>
                                            </div>
                                        </div>        
                        </form>
                    </div>
                </div>
            </div>

        </div>

                                                

        <!-- Datatables -->
        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

        <script>
                                            $(document).ready(function () {
                                                $('input.tableflat').iCheck({
                                                    checkboxClass: 'icheckbox_flat-green',
                                                    radioClass: 'iradio_flat-green'
                                                });
                                            });

                                            var asInitVals = new Array();
                                            $(document).ready(function () {
                                                var oTable = $('#example').dataTable({
                                                    "oLanguage": {
                                                        "sSearch": "Search all columns:"
                                                    },
                                                    "aoColumnDefs": [
                                                        {
                                                            'bSortable': true,
                                                            'aTargets': [0]
                                                        } //disables sorting for column one
                                                    ],
                                                    'iDisplayLength': 10,
                                                    "sPaginationType": "full_numbers",
                                                    "dom": 'T<"clear">lfrtip',
                                                    "tableTools": {
                                                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                                    }
                                                });
                                                $("tfoot input").keyup(function () {
                                                    /* Filter on the column based on the index of this element's parent <th> */
                                                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                                });
                                                $("tfoot input").each(function (i) {
                                                    asInitVals[i] = this.value;
                                                });
                                                $("tfoot input").focus(function () {
                                                    if (this.className == "search_init") {
                                                        this.className = "";
                                                        this.value = "";
                                                    }
                                                });
                                                $("tfoot input").blur(function (i) {
                                                    if (this.value == "") {
                                                        this.className = "search_init";
                                                        this.value = asInitVals[$("tfoot input").index(this)];
                                                    }
                                                });
                                            });
        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
