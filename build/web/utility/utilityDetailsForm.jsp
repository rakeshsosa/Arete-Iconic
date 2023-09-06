 <%-- 
    Document   : tenantCategoryForm
    Created on : Mar 4, 2016, 10:42:01 AM
    Author     : Shweta s
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="../common/theme/css/csspopup.js" type="text/javascript"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
         
        <script type="text/javascript">
            function mandTest() {
               
                var penaltyM = document.getElementById("tenantType").value &&
                        document.getElementById("tenantCategory").value &&
                        document.getElementById("tenantCode").value &&
                        document.getElementById("tenantFname").value &&
                        document.getElementById("tenantLname").value &&
                        document.getElementById("period").value &&
                        document.getElementById("toDate").value;
                        
                      

                if (penaltyM == '')
                {
                    alert("Please Fill Mandatory Fields in Utility Details");
                    return false;
                }
                

                else {
                    document.forms["tenantform"].submit();
                }
            }
            function mandTest1() {
                var tenantM = document.getElementById("tenantCode").value && 
                        document.getElementById("tenantFname").value &&
                        document.getElementById("tenantLname").value &&                        
                        document.getElementById("tenantContactno").value;  
               
                        
                      

                if (tenantM == '')
                {
                    alert("Please Fill Mandatory Fields in Utility Details");
                    return false;
                }
                

                
            }
           

            function firstToUpperCase() {

                var str = document.getElementById("tenantFname").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#tenantFname").val(a);
            }
            function firstToUpperCase1() {

                var str = document.getElementById("tenantLname").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#tenantLname").val(a);
            }
            function fileCheck($this)
            {
                var docsize = document.getElementById("docsize").value;
                var $fin = $($this).closest('tr');
                var fl = $fin.find('#attachmentReference').val();
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * docsize;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded (Only " + docsize + " MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|pdf|PDF|docx|DOCX|zip|ZIP)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }
            function selectUtility()
            {
                myWindow = window.open("../utility/selectUtility.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectAssetDetails()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                myWindow = window.open("../tenant/selectAssetDetails.htm?tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                document.getElementById("flatNo").value = "";
                document.getElementById("waterBillno").value = "";
                document.getElementById("electricityBillno").value = "";
            }
            function selectSubAssetDetails()
            {
                var assetCode = document.getElementById("assetCode").value;
                var tenantCategory = document.getElementById("tenantCategory").value;
                myWindow = window.open("../tenant/selectSubAssetDetails.htm?assetCode=" + assetCode + "&tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectContractCode()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                var flatNo = document.getElementById("subclassifiedAstno").value;
                myWindow = window.open("../tenant/selectContractCode.htm?tenantCategory=" + tenantCategory + "&flatNo=" + flatNo + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function isNumberKey3(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
            
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Only Alphanumerics");
                    return false;
                }
                return true;
            }
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }
            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
//                    alert("Please Enter Only Alphabets");
                    return false;
                }
                return true;
            }
            
           

            function validateEmail1(sEmail) {
                var etext = document.getElementById('postboxNo1').value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (etext.match(mailformat)) {
                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('postboxNo1').value = "";
                }
            }

            function testllImage() {
                var llSno = document.getElementById("llSno").value;
                if (llSno == '') {
                    alert("No image!!!");
                    return false;
                }
                else {
                    var res = llSno.split(",");
                    for (i = 0; i < res.length; i++) {
                        alert("You have " + (res.length - i) + " files to download");
                        window.location.href = '../tenant/tenantlAttachDownload.htm?sno=' + res[i];
                    }
                }
            }
            function testContImage() {
                var contSno = document.getElementById("contSno").value;
                if (contSno == '') {
                    alert("No image!!!");
                    return false;
                } else {
                    var res = contSno.split(",");
                    for (i = 0; i < res.length; i++) {
                        alert("You have " + (res.length - i) + " files to download");
                        window.location.href = '../tenant/tenantContAttachDownload.htm?sno=' + res[i];
                    }
                }
            }
            function rentCalc() {
                var actualRent = parseFloat(document.getElementById("actualRent").value);
                var rentTenant = parseFloat(document.getElementById("extra2").value);
                var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                if (rentTenant == '0') {
                    alert("Invalid Amount..");
                    document.getElementById("extra2").value = "";
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    rentPMonth();
                    return true;
                }
            }
            function dateCheckCondition() {
                var contract = document.getElementById("contractSigningDate").value;
                var dueDate = document.getElementById("dueDate").value;
                var actD = contract.split("-");
                var inA = dueDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (trd < or) {
                    alert("Due Date should be greater than Contract Signing Date.");
                    document.getElementById("contractSigningDate").value = '';
                    document.getElementById("dueDate").value = '';
                }
                return false;
            }
            function getLlAttach() {
                var llId = document.getElementById("llId").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/getLlAttach.htm',
                            data: {
                                llId: llId
                            },
                            success: function (data) {
                                if (data == 'a') {
                                    document.getElementById("llSno").value = '';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("llSno").value = dat1[0];
                                }
                            }
                        });
            }
            function getContAttach() {
                var contCode = document.getElementById("contractPeriod").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/getContAttach.htm',
                            data: {
                                contCode: contCode
                            },
                            success: function (data) {
                                if (data == 'a') {
                                    document.getElementById("contSno").value = '';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("contSno").value = dat1[0];
                                }
                            }
                        });
            }
// Uniqueness
            function fetchTid() {
                var tenantId = document.getElementById("tenantId").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTid.htm',
                            data: {
                                tenantId: tenantId
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantId").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchTName() {
                var tenantFname = document.getElementById("tenantFname").value;
                var tenantLname = document.getElementById("tenantLname").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTName.htm',
                            data: {
                                tenantFname: tenantFname,
                                tenantLname: tenantLname
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantFname").value = "";
                                    document.getElementById("tenantLname").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchTCono() {
                var tenantContactno = document.getElementById("tenantContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTCono.htm',
                            data: {
                                tenantContactno: tenantContactno
                            },
//                            success: function (data) {
//                                if ($.trim(data) == 'Already Exists.Enter another') {
//                                    alert("Tenant contact no. already exist");
//                                    document.getElementById("tenantContactno").value = "";
//                                    return false;
//                                }
//                            }
                        });
            }
            function fetchTWcono() {
                var tenantWorkContactno = document.getElementById("tenantWorkContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTWcono.htm',
                            data: {
                                tenantWorkContactno: tenantWorkContactno
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantWorkContactno").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchCrno() {
                var tenantCrNo = document.getElementById("tenantCrNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchCrno.htm',
                            data: {
                                tenantCrNo: tenantCrNo
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantCrNo").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function validateEmail() {
                var tenantMailid = document.getElementById("tenantMailid").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (tenantMailid.match(mailformat)) {
//                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('tenantMailid').value = "";
                }
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTEmail.htm',
                            data: {
                                tenantMailid: tenantMailid
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantMailid").value = "";
                                    return false;
                                }
                            }
                        });
            }


function checkDates1() {
                document.getElementById("toDate").value = '';
               //var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;

                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (trd < or) {
                    alert("To Date should be Greater Than From Date.");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
                else if (receiptType === 'Rent') {
                    var v1 = new Date(actD);
                    var actualstartdatef = v1.getDate();
                    var actualstartmonthf = v1.getMonth();
                    var actualstartmonthf1 = actualstartmonthf + 1;
                    var actuaystartf = v1.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/previousContrtacts.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    actualstartdatef: actualstartdatef,
                                    actualstartmonthf1: actualstartmonthf1,
                                    actuaystartf: actuaystartf,
                                },
                                success: function (data) {
                                    if (data === 'a') {
                                        return false;
                                    } else {
                                        var dat = data.split(",");
                                        document.getElementById("rentAmount").value = parseFloat(dat[0]);
                                        document.getElementById("billCycle").value = dat[1];
                                        return true;
                                    }
                                }

                            });

                }



            }
            
            function checkDates() {
                //alert("Select from date...");
               // var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                //var billCycle = document.getElementById("billCycle").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
               // if (actD == '' && receiptType != 'Rent') {
                   // alert("Select from date...");
                    //document.getElementById("period").value = '';
                    //document.getElementById("toDate").value = '';
                //}
                if (trd < or) {
                    alert("To Date should be Greater Than From Date");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
           <%--<c:if test="${action ne 'edit'}">--%>
                   // alert("Select from date...");
                   var v1 = new Date(actD);
                    var v2 = new Date(inA);
                    var actualdatef = v1.getDate();
                    var actualdatet = v2.getDate();
                    var actualmonthf = v1.getMonth();
                    var actualmontht = v2.getMonth();
                    var actualmonthf1 = actualmonthf + 1;
                    var actualmontht1 = actualmontht + 1;
                    var actuayf = v1.getFullYear();
                    var actuayt = v2.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../utility/getUtilityDates.htm',
                                data: {
                                   tenantCode: tenantCode,
                                    actualdatef: actualdatef,
                                    actualdatet: actualdatet,
                                    actualmonthf1: actualmonthf1,
                                    actualmontht1: actualmontht1,
                                    actuayf: actuayf,
                                    actuayt: actuayt,
                                    //receiptType: receiptType,
                                },
                                success: function (data) {
                                    if ($.trim(data) == 'Already Exists.Enter another') {
                                        alert("Utility Already Paid for this Month(s) " + fromDate + " to " + toDate);
                                        document.getElementById("period").value = "";
                                        document.getElementById("toDate").value = "";
                                        return false;
                                    }
                                }
                            }); 
                    
                    
                
           <%-- </c:if>--%>
//                else if (billCycle === 'Quarterly' && receiptType === 'Rent') {
//                    var v1 = new Date(actD);
//                    var v2 = new Date(inA);
//                    var actualdatef = v1.getDate();
//                    var actualdatet = v2.getDate();
//                    var actualmonthf = v1.getMonth();
//                    var actualmontht = v2.getMonth();
//                    var actualmonthf1 = actualmonthf + 1;
//                    var actualmontht1 = actualmontht + 1;
//                    var actuayf = v1.getFullYear();
//                    var actuayt = v2.getFullYear();
//                    $.ajax
//                            ({
//                                type: "POST",
//                                url: '../tenant/getTenantDates.htm',
//                                data: {
//                                    tenantCode: tenantCode,
//                                    actualdatef: actualdatef,
//                                    actualdatet: actualdatet,
//                                    actualmonthf1: actualmonthf1,
//                                    actualmontht1: actualmontht1,
//                                    actuayf: actuayf,
//                                    actuayt: actuayt
//                                },
//                                success: function (data) {
//                                    if ($.trim(data) == 'Already Exists.Enter another') {
//                                        alert("Rent Already Paid for this Month " + actualmonthf1);
//                                        document.getElementById("period").value = "";
//                                        document.getElementById("toDate").value = "";
//                                        return false;
//                                    }
//                                }
//                            });
//                }

            }
            function checkContDates() {
               // var receiptType = document.getElementById("receiptType").value;
                //var tenantCode = document.getElementById("tenantCode").value;
                var billCycle = document.getElementById("billCycle").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var dues = parseFloat(document.getElementById("dues").value);
                var tempdate = null;
                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                
                if (trd < or) {
                    alert("To Date should be Greater Than From Date");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
                
                
                
               
                if (billCycle === 'Monthly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 1));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Quarterly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 3));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Half Yearly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 6));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Yearly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 12));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }

//                var startsFrom = document.getElementById("startsFrom").value;
//                var endsTo = document.getElementById("endsTo").value;
//                var startsFrom1 = startsFrom.split("-");
//                var endsTo1 = endsTo.split("-");
//                var startsFrom2 = new Date(startsFrom1[1] + '/' + startsFrom1[0] + '/' + startsFrom1[2]);
//                var endsTo2 = new Date(endsTo1[1] + '/' + endsTo1[0] + '/' + endsTo1[2]);
//                var diff = ((new Date(startsFrom2).getTime()) - (new Date(or).getTime())) / (1000 * 24 * 3600);
//                var diff1 = ((new Date(endsTo2).getTime()) - (new Date(or).getTime())) / (1000 * 24 * 3600);
//                var diff2 = ((new Date(startsFrom2).getTime()) - (new Date(trd).getTime())) / (1000 * 24 * 3600);
//                var diff3 = ((new Date(endsTo2).getTime()) - (new Date(trd).getTime())) / (1000 * 24 * 3600);
//                if (diff < 0 && diff1 < 0 && diff2 < 0 && diff3 < 0)
//                {
//                    alert("Start Date and End Date Should be With in Contract Period:" + startsFrom + " To " + endsTo);
//                    document.getElementById("period").value = '';
//                    document.getElementById("toDate").value = '';
//                    return false;
//                }
//                else{
//                    var v1 = new Date(startsFrom1);
//                    var actualstartdatef = v1.getDate();
//                    var actualstartmonthf = v1.getMonth();
//                    var actualstartmonthf1 = actualstartmonthf + 1;
//                    var actuaystartf = v1.getFullYear();
//                    $.ajax
//                            ({
//                                type: "POST",
//                                url: '../tenant/previousArrearsforBV.htm',
//                                data: {
//                                    tenantCode: tenantCode,
//                                    startsFrom : startsFrom,
//                                    actualstartdatef : actualstartdatef,
//                                    actualstartmonthf1 : actualstartmonthf1,
//                                    actuaystartf : actuaystartf,
//                                },
//                                success: function (data) {
//                                    if (data === 'a') {
//                                        return false;
//                                    } else {
//                                        var dat = data.split("[");
//                                        var dat1 = dat[1].split("]");
//                                        document.getElementById("dues").value = parseFloat(dat1[0])+dues;
//                                    }
//                                }
//                            });
//                }
            }
            

       
           


        </script>
        <script>
            function call() {
                $("#tag").toggle();
            }

            function call1() {
                $("#tag1").toggle();
            }
            function call2() {
                $("#tag2").toggle();
            }
            function call3() {

                $("#tag3").toggle();
            }
            function call4() {

                $("#tag4").toggle();
            }
            function call5() {

                $("#tag4").toggle();
            }
            function call6() {

                $("#tag4").toggle();
            }
            function call7() {

                $("#tag4").toggle();
            }
            function callM() {
                $(window).scrollTop(0);
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM1() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM2() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM3() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
                $("#tag4").hide();
            }
            function callM4() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
            }
            function callM5() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
            }


            function check_digit(e, obj, intsize, deczize) {
                var keycode;
                if (window.event)
                    keycode = window.event.keyCode;
                else if (e) {
                    keycode = e.which;
                }
                else {
                    return true;
                }
                var fieldval = (obj.value),
                        dots = fieldval.split(".").length;
                if (keycode == 46) {
                    return dots <= 1;
                }
                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
                    // back space, tab, delete, enter 
                    return true;
                }
                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                    return false;
                }
                if (fieldval == "0" && keycode == 48) {
                    return false;
                }
                if (fieldval.indexOf(".") != -1) {
                    if (keycode == 46) {
                        return false;
                    }
                    var splitfield = fieldval.split(".");
                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                        return false;
                } else if (fieldval.length >= intsize && keycode != 46) {
                    return false;
                } else {
                    return true;
                }
            }
            
            
            
            
            function elcCalc() {
                var prviousEBReding = parseFloat(document.getElementById("prviousEBReding").value);
                var currentEBReding = parseFloat(document.getElementById("currentEBReding").value);
               // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (prviousEBReding == '0' && currentEBReding == '0') {
                    alert("Invalid Amount..");
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    elcCalcMonth();
                    return true;
                }
            }

            function elcCalcMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
               // var totalEBUnints = parseFloat(document.getElementById("totalEBUnints").value);
                //var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                var prviousEBReding = parseFloat(document.getElementById("prviousEBReding").value);
                var currentEBReding = parseFloat(document.getElementById("currentEBReding").value);
                var totalEBUnints =  currentEBReding - prviousEBReding ;
                var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
               // document.getElementById("waterBill").value = totalWBUnints*WBPerUnit ;
               // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("electricBill").value = totalEBUnints*EBPerUnit;
                 
            }
            
            function wtrCalc() {
                var prviousWBReding = parseFloat(document.getElementById("prviousWBReding").value);
                var currentWBReding = parseFloat(document.getElementById("currentWBReding").value);
                //var parkingBill = parseFloat(document.getElementById("parkingBill").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (prviousWBReding == '0' && currentWBReding == '0') {
                    alert("Invalid Amount..");
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    wtrCalcMonth();
                    return true;
                }
            }

            function wtrCalcMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var prviousWBReding = parseFloat(document.getElementById("prviousWBReding").value);
                var currentWBReding = parseFloat(document.getElementById("currentWBReding").value);
                var totalWBUnints =  currentWBReding - prviousWBReding ;
                var WBPerUnit = parseFloat(document.getElementById("WBPerUnit").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("waterBill").value = totalWBUnints*WBPerUnit ;
                 
            }


           function debBillCalc() {
                var prviousEBReding = parseFloat(document.getElementById("prviousEBReding").value);
                var currentEBReding = parseFloat(document.getElementById("currentEBReding").value);
               // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (prviousEBReding == '0' && currentEBReding == '0') {
                    alert("Invalid Amount..");
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    debBillPMonth();
                    return true;
                }
            }

            function debBillPMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var prviousEBReding = parseFloat(document.getElementById("prviousEBReding").value);
                var currentEBReding = parseFloat(document.getElementById("currentEBReding").value);
               // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("totalEBUnints").value = currentEBReding - prviousEBReding ;
                 
            }
            
            function dwbBillCalc() {
                var prviousWBReding = parseFloat(document.getElementById("prviousWBReding").value);
                var currentWBReding = parseFloat(document.getElementById("currentWBReding").value);
                //var parkingBill = parseFloat(document.getElementById("parkingBill").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (prviousWBReding == '0' && currentWBReding == '0') {
                    alert("Invalid Amount..");
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    dwbBillPMonth();
                    return true;
                }
            }

            function dwbBillPMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var prviousWBReding = parseFloat(document.getElementById("prviousWBReding").value);
                var currentWBReding = parseFloat(document.getElementById("currentWBReding").value);
                //var parkingBill = parseFloat(document.getElementById("parkingBill").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("totalWBUnints").value = currentWBReding - prviousWBReding ;
                 
            }







            function drentCalc() {
                var electricBill = parseFloat(document.getElementById("electricBill").value);
                var waterBill = parseFloat(document.getElementById("waterBill").value);
                var parkingBill = parseFloat(document.getElementById("parkingBill").value);
                var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (electricBill == '0' && waterBill == '0' && parkingBill == '0'&&maintainceBill== '0') {
                    alert("Invalid Amount..");
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    drentPMonth();
                    return true;
                }
            }

            function drentPMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var electricBill = parseFloat(document.getElementById("electricBill").value);
                var waterBill = parseFloat(document.getElementById("waterBill").value);
                var parkingBill = parseFloat(document.getElementById("parkingBill").value);
                var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("totalAmount").value = electricBill + waterBill + parkingBill+ maintainceBill;
                 
            }







            function rentPMonth() {
                var rentpMonth = parseFloat(document.getElementById("extra2").value);
                var billgCycle = document.getElementById("billingCycle").value;
                if (isNaN(rentpMonth) === false && billgCycle !== '') {
                    if (billgCycle == "Monthly") {
                        document.getElementById("totalAmount").value = rentpMonth;
                    }
                    else if (billgCycle == "Quarterly") {
                        document.getElementById("totalAmount").value = rentpMonth * 3;
                    }
                    else if (billgCycle == "Half Yearly") {
                        document.getElementById("totalAmount").value = rentpMonth * 6;
                    }
                    else if (billgCycle == "Yearly") {
                        document.getElementById("totalAmount").value = rentpMonth * 12;
                    }
                } else {
                    document.getElementById("totalAmount").value = '0';
                }
            }
            function selectUtility()
            {
                myWindow = window.open("../utility/selectUtility.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
        </script>

    </head>
    <body class="nav-md">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
         <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Utility Details&tab=Utility Details&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Utility Details</h5>
                                </div>
                                    <form class="form-inline row" id="tenantform" action="../utility/utilityDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data">

                                        <c:forEach items="${levellist}" var="list">
                                            <c:if test="${list.userId eq userId}">
                                                <c:if test="${list.submoduleName eq 'Utility Details'}">
                                                    <c:if test="${list.tabName eq 'Utility Details'}">
                                                        
                                                    </c:if> 
                                                </c:if> 
                                            </c:if> 
                                        </c:forEach>
                                        
                                        <input type="hidden"  class="form-control"  name="submoduleName" value="Utility Details"> 
                                        <input type="hidden"  class="form-control"  name="tabName" value="Utility Details"> 

                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '639'}">
                                                <c:set value="${list[1]}" var="field_639"/>
                                                <c:set value="${list[2]}" var="fieldStatus_639"/>
                                                <c:set value="${list[3]}" var="mand_status_639"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '640'}">
                                                <c:set value="${list[1]}" var="field_640"/>
                                                <c:set value="${list[2]}" var="fieldStatus_640"/>
                                                <c:set value="${list[3]}" var="mand_status_640"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '641'}">
                                                <c:set value="${list[1]}" var="field_641"/>
                                                <c:set value="${list[2]}" var="fieldStatus_641"/>
                                                <c:set value="${list[3]}" var="mand_status_641"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '642'}">
                                                <c:set value="${list[1]}" var="field_642"/>
                                                <c:set value="${list[2]}" var="fieldStatus_642"/>
                                                <c:set value="${list[3]}" var="mand_status_642"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '643'}">
                                                <c:set value="${list[1]}" var="field_643"/>
                                                <c:set value="${list[2]}" var="fieldStatus_643"/>
                                                <c:set value="${list[3]}" var="mand_status_643"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '644'}">
                                                <c:set value="${list[1]}" var="field_644"/>
                                                <c:set value="${list[2]}" var="fieldStatus_644"/>
                                                <c:set value="${list[3]}" var="mand_status_644"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '645'}">
                                                <c:set value="${list[1]}" var="field_645"/>
                                                <c:set value="${list[2]}" var="fieldStatus_645"/>
                                                <c:set value="${list[3]}" var="mand_status_645"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '646'}">
                                                <c:set value="${list[1]}" var="field_646"/>
                                                <c:set value="${list[2]}" var="fieldStatus_646"/>
                                                <c:set value="${list[3]}" var="mand_status_646"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '647'}">
                                                <c:set value="${list[1]}" var="field_647"/>
                                                <c:set value="${list[2]}" var="fieldStatus_647"/>
                                                <c:set value="${list[3]}" var="mand_status_647"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '648'}">
                                                <c:set value="${list[1]}" var="field_648"/>
                                                <c:set value="${list[2]}" var="fieldStatus_648"/>
                                                <c:set value="${list[3]}" var="mand_status_648"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '649'}">
                                                <c:set value="${list[1]}" var="field_649"/>
                                                <c:set value="${list[2]}" var="fieldStatus_649"/>
                                                <c:set value="${list[3]}" var="mand_status_649"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '650'}">
                                                <c:set value="${list[1]}" var="field_650"/>
                                                <c:set value="${list[2]}" var="fieldStatus_650"/>
                                                <c:set value="${list[3]}" var="mand_status_650"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '651'}">
                                                <c:set value="${list[1]}" var="field_651"/>
                                                <c:set value="${list[2]}" var="fieldStatus_651"/>
                                                <c:set value="${list[3]}" var="mand_status_651"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '652'}">
                                                <c:set value="${list[1]}" var="field_652"/>
                                                <c:set value="${list[2]}" var="fieldStatus_652"/>
                                                <c:set value="${list[3]}" var="mand_status_652"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '653'}">
                                                <c:set value="${list[1]}" var="field_653"/>
                                                <c:set value="${list[2]}" var="fieldStatus_653"/>
                                                <c:set value="${list[3]}" var="mand_status_653"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '654'}">
                                                <c:set value="${list[1]}" var="field_654"/>
                                                <c:set value="${list[2]}" var="fieldStatus_654"/>
                                                <c:set value="${list[3]}" var="mand_status_654"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '655'}">
                                                <c:set value="${list[1]}" var="field_655"/>
                                                <c:set value="${list[2]}" var="fieldStatus_655"/>
                                                <c:set value="${list[3]}" var="mand_status_655"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '656'}">
                                                <c:set value="${list[1]}" var="field_656"/>
                                                <c:set value="${list[2]}" var="fieldStatus_656"/>
                                                <c:set value="${list[3]}" var="mand_status_656"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '657'}">
                                                <c:set value="${list[1]}" var="field_657"/>
                                                <c:set value="${list[2]}" var="fieldStatus_657"/>
                                                <c:set value="${list[3]}" var="mand_status_657"/>
                                            </c:if>                                            
                                            <c:if test="${list[0] eq '658'}">
                                                <c:set value="${list[1]}" var="field_658"/>
                                                <c:set value="${list[2]}" var="fieldStatus_658"/>
                                                <c:set value="${list[3]}" var="mand_status_658"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '659'}">
                                                <c:set value="${list[1]}" var="field_659"/>
                                                <c:set value="${list[2]}" var="fieldStatus_659"/>
                                                <c:set value="${list[3]}" var="mand_status_659"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '660'}">
                                                <c:set value="${list[1]}" var="field_660"/>
                                                <c:set value="${list[2]}" var="fieldStatus_660"/>
                                                <c:set value="${list[3]}" var="mand_status_660"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '661'}">
                                                <c:set value="${list[1]}" var="field_661"/>
                                                <c:set value="${list[2]}" var="fieldStatus_661"/>
                                                <c:set value="${list[3]}" var="mand_status_661"/>
                                            </c:if>
                                            
                                        </c:forEach>
                                        <c:forEach items="${fileSize}" var="list">
                                            <c:if test="${list[0] eq 'F-25'}">
                                                <input type="hidden" value="${list[1]}" id="docsize"/>
                                            </c:if>
                                        </c:forEach>



                                        <%--<div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                    <h4><b style="padding-left: 20px;">Tenant Details (Second Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                    </div> --%>
                                        <%-- <div class="box-content" id="tag1"> --%>

                                        <c:if test="${fieldStatus_639 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_639 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_639}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly id="tenantType" name="tenantType" value="${list.tenantType}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantType" value="${list.tenantType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" id="tenantType" name="tenantType" value="">-->
                                                        <select id="tenantType" name="tenantType" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantType}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_640 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_640 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_640}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly id="tenantCategory" name="tenantCategory" value="${list.tenantCategory}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" id="tenantCategory" name="tenantCategory" value="">-->
                                                        <select id="tenantCategory" name="tenantCategory" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantCategory}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_641 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_641 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_641}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantCode" name="tenantCode" maxlength="15" value="${list.tenantCode}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCode" value="${list.tenantCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>


                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Tenant ID" readonly class="form-control" id="tenantCode" name="tenantCode" value="" onclick="selectUtility();" onblur="return getLlAttach();">
                                                        <input type="hidden" id="tenantCode" name="tenantCode" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_642 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_642 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><!--<a style="color:transparent;">*</a>-->
                                                <label class="control-label">${field_642}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="tenantFname" name="tenantFname" value="${list.tenantFname}">
                                                                    <input type="hidden" id="tenantFname" name="tenantFname" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                                    <input type="hidden" id="tenantFname" name="tenantFname" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly class="form-control" id="tenantFname" name="tenantFname" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_643 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_643 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><!--<a style="color:transparent;">*</a>-->
                                                <label class="control-label">${field_643}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="tenantLname" name="tenantLname" value="${list.tenantLname}">
                                                                    <input type="hidden" id="tenantLname" name="tenantLname" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                                    <input type="hidden" id="tenantLname" name="tenantLname" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly class="form-control" id="tenantLname" name="tenantLname" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_648 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_648 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><!--<a style="color:transparent;">*</a>-->
                                                <label class="control-label">${field_648}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="tenantContactno" name="tenantContactno" value="${list.tenantContactno}">
                                                                    <input type="hidden" id="tenantContactno" name="tenantContactno" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.tenantContactno}">
                                                                    <input type="hidden" id="tenantContactno" name="tenantContactno" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly class="form-control" id="tenantContactno" name="tenantContactno" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_650 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_650 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_650}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="electricityBillno" name="electricityBillno" value="${list.electricityBillno}">
                                                                    <input type="hidden" id="electricityBillno" name="electricityBillno" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.electricityBillno}">
                                                                    <input type="hidden" id="electricityBillno" name="electricityBillno" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly class="form-control" id="electricityBillno" name="electricityBillno" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            <c:if test="${fieldStatus_657 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_657 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_657}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="waterBillno" name="waterBillno" value="${list.waterBillno}">
                                                                    <input type="hidden" id="waterBillno" name="waterBillno" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.waterBillno}">
                                                                    <input type="hidden" id="waterBillno" name="waterBillno" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly class="form-control" id="waterBillno" name="waterBillno" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            <c:if test="${fieldStatus_660 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_660 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_660}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="period" name="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();">
                                                                    <input type="hidden" name="month" value="">
                                                                    <input type="hidden" name="year" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="period" name="period" value="" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();" onblur="checkContDates();">
                                                        <input type="hidden" name="month" value="">
                                                        <input type="hidden" name="year" value="">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>
                                            
                                            <c:if test="${fieldStatus_661 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_661 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_661}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="toDate" name="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.toDate}"/>" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.toDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="toDate" name="toDate" value="" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            
                                            <c:if test="${fieldStatus_651 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_651 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_651}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="prviousEBReding" name="prviousEBReding" value="${list.prviousEBReding}" onchange="return mandTest1();"  onkeypress="return check_digit(event, this, 10, 3);">
                                                                    <input type="hidden" id="prviousEBReding" name="prviousEBReding" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="prviousEBReding" value="${list.prviousEBReding}">
                                                                    <input type="hidden" id="prviousEBReding" name="prviousEBReding" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" class="form-control" id="prviousEBReding" name="prviousEBReding" value="" onchange="return mandTest1();"  onkeypress="return check_digit(event, this, 10, 3);">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            
                                            <c:if test="${fieldStatus_653 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_653 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_653}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="currentEBReding" name="currentEBReding" maxlength="11" value="${list.currentEBReding}" onkeypress="return isNumberKey(event)" onchange="debBillCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="currentEBReding" value="${list.currentEBReding}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder=""  class="form-control" id="currentEBReding" name="currentEBReding" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="debBillCalc();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_655 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_655 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_655}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="totalEBUnints" name="totalEBUnints" value="${list.totalEBUnints}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="totalEBUnints" value="${list.totalEBUnints}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" name="totalEBUnints" id="totalEBUnints" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            
                                            
                                            <c:if test="${fieldStatus_658 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_658 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_658}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="EBPerUnit" name="EBPerUnit" value="${list.EBPerUnit}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="elcCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="EBPerUnit" value="">   
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" name="EBPerUnit" id="EBPerUnit" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="elcCalc();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>                                       
                                                                                    
                                                                                   
                                           
                                            
                                            <c:if test="${fieldStatus_644 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_644 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_644}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="electricBill" name="electricBill" maxlength="15" value="${list.electricBill}" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="electricBill" value="${list.electricBill}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly class="form-control" id="electricBill" name="electricBill" maxlength="15" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if> <p>&nbsp;</p>
                                            
                                            <c:if test="${fieldStatus_652 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_652 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_652}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly="" id="prviousWBReding" name="prviousWBReding" value="${list.prviousWBReding}"  onkeypress="return check_digit(event, this, 10, 3);">
                                                                    <input type="hidden" id="prviousWBReding" name="prviousWBReding" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="prviousWBReding" value="${list.prviousWBReding}"  onkeypress="return check_digit(event, this, 10, 3);">
                                                                    <input type="hidden" id="prviousWBReding" name="prviousWBReding" value=""  onkeypress="return check_digit(event, this, 10, 3);">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" class="form-control" id="prviousWBReding" name="prviousWBReding" value="" onkeypress="return check_digit(event, this, 10, 3);">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            
                                            
                                            
                                            
                                           <c:if test="${fieldStatus_654 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_654 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_654}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="currentWBReding" name="currentWBReding" maxlength="11" value="${list.currentWBReding}" onkeypress="return isNumberKey(event)" onchange="dwbBillCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="currentWBReding" value="${list.currentWBReding}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="currentWBReding" name="currentWBReding" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="dwbBillCalc();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            
                                            <c:if test="${fieldStatus_656 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_656 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_656}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="totalWBUnints" name="totalWBUnints" value="${list.totalWBUnints}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="totalWBUnints" value="${list.totalWBUnints}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" name="totalWBUnints" id="totalWBUnints" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if><p><p>&nbsp;</p>   
                                            
                                            
                                            <c:if test="${fieldStatus_659 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_659 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_659}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="WBPerUnit" name="WBPerUnit" value="${list.WBPerUnit}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="wtrCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="WBPerUnit" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" name="WBPerUnit" id="WBPerUnit" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="wtrCalc();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>                                            
                                           
                                             
                                            <c:if test="${fieldStatus_645 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_645 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_645}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="waterBill" name="waterBill" maxlength="15" value="${list.waterBill}" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="waterBill" value="${list.waterBill}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly class="form-control" id="waterBill" name="waterBill" maxlength="15" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                          
                                        <c:if test="${fieldStatus_646 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_646 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_646}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="parkingBill" name="parkingBill" maxlength="11" value="${list.parkingBill}" onkeypress="return isNumberKey(event)" onchange="fetchCrno();" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="parkingBill" value="${list.parkingBill}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="parkingBill" name="parkingBill" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="fetchCrno();" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>   
                                        <c:if test="${fieldStatus_647 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_647 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_647}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="maintainceBill" name="maintainceBill" maxlength="11" value="${list.maintainceBill}" onkeypress="return isNumberKey(event)" onchange="drentCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="maintainceBill" value="${list.maintainceBill}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="maintainceBill" name="maintainceBill" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="drentCalc();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_649 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_649 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_649}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(utilityDetails) > 0}">
                                                        <c:forEach items="${utilityDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="totalAmount" name="totalAmount" value="${list.totalAmount}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="totalAmount" value="${list.totalAmount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" name="totalAmount" id="totalAmount" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if> <p>&nbsp;</p><p>&nbsp;</p>

                                         
                                           


                                        <c:if test="${action ne 'view'}">
                                            <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                                                <a href="../utility/utilityDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                            <!--</div>--> 
                                        </c:if>
                                    </form>
                               </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <jsp:include page="../login/footer.jsp" />
</body>

</html>