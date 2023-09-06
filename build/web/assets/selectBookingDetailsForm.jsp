<%-- 
    Document   : selectBookingDetailsForm
    Created on : 13 Jun, 2023, 4:07:53 PM
    Author     : dipal
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

        <title>Al Hajar</title>

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


    <body>


        <script>
            function test(val51,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14,val15,val16,
            val17,val18,val19,val20,val21,val22,val23,val24,val25,val26,val27,val29,val30,val31,val32,val33,
            val34,val35,val36,val37,val38,val39,val40,val41,val42,val43,val44,val45,val46,val47,val48,val49,val50) {
                
                window.opener.document.getElementById('quotationId').value = val51;
                window.opener.document.getElementById('enquiryId').value = val1;
                window.opener.document.getElementById('quotationNumber').value = val2;
                window.opener.document.getElementById('quotationDate').value = val3;
                window.opener.document.getElementById('quotationExpiry').value = val4;
                window.opener.document.getElementById('currency').value = val5;
                
                window.opener.document.getElementById('assetCode').value = val6;
                window.opener.document.getElementById('assetName').value = val7;
                window.opener.document.getElementById('tenancyStartDate').value = val8;
                window.opener.document.getElementById('tenancyEndDate').value = val9;
                window.opener.document.getElementById('floor').value = val10;
                window.opener.document.getElementById('unitNumNo').value = val11;
                window.opener.document.getElementById('baserent').value = val12;
                
                window.opener.document.getElementById('customerType').value = val13;
                window.opener.document.getElementById('customerName').value = val14;
                window.opener.document.getElementById('tenantId').value = val15;
                window.opener.document.getElementById('businessName').value = val16;
                window.opener.document.getElementById('businessCrNumber').value = val17;
                window.opener.document.getElementById('contactPerson').value = val18;
                window.opener.document.getElementById('registeredEmailID').value = val19;
                window.opener.document.getElementById('phoneNo').value = val20;
                window.opener.document.getElementById('billingAddress').value = val21;
                window.opener.document.getElementById('permenamtAddress').value = val22;
                window.opener.document.getElementById('jointeeName1').value = val23;
                window.opener.document.getElementById('jointeeAddress1').value = val24;
                window.opener.document.getElementById('jointeeName2').value = val25;
                window.opener.document.getElementById('jointeeAddress2').value = val26;
                window.opener.document.getElementById('sponsorName').value = val27;
                window.opener.document.getElementById('ifWorking').value = val29;
                window.opener.document.getElementById('sponsorAddress').value = val30;
                window.opener.document.getElementById('sponsorEmail').value = val31;
                window.opener.document.getElementById('attachment').value = val32;
                window.opener.document.getElementById('idCardType').value = val33;
                
                //window.opener.document.getElementById('sno').value = val21;
                window.opener.document.getElementById('unitNo1').value = val34;
                window.opener.document.getElementById('rentPeiod').value = val35;
                window.opener.document.getElementById('chargesQuoted').value = val36;
                window.opener.document.getElementById('vatPercentage').value = val37;
                window.opener.document.getElementById('vatAmount').value = val38;
                window.opener.document.getElementById('totalAmount').value = val39;
                
                //window.opener.document.getElementById('sno').value = val29;
                window.opener.document.getElementById('serviceCategory').value = val40;
                window.opener.document.getElementById('serviceName').value = val41;
               window.opener.document.getElementById('chargesQuoted1').value = val42;
                window.opener.document.getElementById('vatPercentage1').value = val43;
                window.opener.document.getElementById('vatAmount1').value = val44;
                window.opener.document.getElementById('totalAmount1').value = val45;
                window.opener.document.getElementById('securityDeposit').value = val46;
                window.opener.document.getElementById('advance').value = val47;
                
                window.opener.document.getElementById('paymentTerms').value = val48;
                window.opener.document.getElementById('contactTerms').value = val49;
                window.opener.document.getElementById('termsattachment').value = val50;


                window.close();
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Booking List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                
                                           
                                        <th>Quotation ID </th>
                                        <th>Enquiry ID </th>
                                        <th>Quotation Number </th>
                                        <th>Quotation Date </th>
                                        <th>Quotation Expiry </th>
                                        <th>Currency  </th>
                                        
                                        <th>Property Code  </th>
                                        <th>Property Name  </th>
                                        <th>Tenancy Start Date  </th>
                                        <th>Tenancy End Date  </th>
                                        <th>Floor</th>
                                        <th>Unit Name/Unit No  </th>
                                        <th>Base Rent  </th>
                                        
                                        <th>Select Customer Type  </th>
                                        <th>Customer Name </th>
                                        <th>Tenant Id  </th>
                                        <th>Company/Business Name  </th>
                                        <th>Business CR No  </th>
                                        <th>Contact Person </th>
                                        <th>Registered Email ID </th>
                                        <th>Phone Number</th>
                                        <th>Billing Address</th>
                                        <th>Permanant Address</th>
                                        <th>Jointee Name1</th>
                                        <th>Jointee Address1</th>
                                        <th>Jointee Name2</th>
                                        <th>Jointee Address2</th>
                                        <th>Sponser Name</th>
                                        <th>If Working</th>
                                        <th>Sponsor Address</th>
                                        <th>Sponsor EmailId</th>
                                        <th>Attachment</th>
                                        <th>Id Card Type</th>
                                        
                                        <!--<th>S.No</th>-->
                                        <th>Unit No</th>
                                        <th>Rent Period</th>
                                        <th>Charges Quoted</th>
                                        <th>VAT (%)</th>
                                        <th>VAT Amount</th>
                                        <th>Total Amount</th>
                                        
                                        <!--<th>S.No</th>-->
                                        <th>Service Category</th>
                                        <th>Service Name</th>
                                        <th>Charges Quoted</th>
                                        <th>VAT (%)</th>
                                        <th>VAT Amount</th>
                                        <th>Total Amount</th>
                                        <th>Security Deposit </th>
                                        <th>Advance </th>
                                        
                                        <th>Payment Terms </th>
                                        <th>Contract Terms </th>
                                        <th>Add Attachment</th>
                                    </tr>
                                </thead>


                               <c:forEach items="${selectQuotationDetails}" var="type">

                                    <tr onclick="test('${type[2]}','${type[1]}','${type[3]}','<fmt:formatDate pattern="dd-MM-yyyy" value="${type[4]}"/>','<fmt:formatDate pattern="dd-MM-yyyy" value="${type[5]}"/>',
                                                '${type[6]}','${type[27]}','${type[28]}','<fmt:formatDate pattern="dd-MM-yyyy" value="${type[29]}"/>','<fmt:formatDate pattern="dd-MM-yyyy" value="${type[30]}"/>',
                                                '${type[31]}','${type[32]}','${type[33]}','${type[7]}','${type[8]}',
                                                '${type[9]}','${type[10]}','${type[11]}','${type[12]}','${type[13]}',
                                                '${type[14]}','${type[15]}','${type[16]}','${type[17]}','${type[18]}',
                                                '${type[19]}','${type[20]}','${type[21]}','${type[22]}','${type[23]}',
                                                '${type[24]}','${type[25]}','${type[26]}','${type[42]}','${type[43]}',
                                                '${type[44]}','${type[45]}','${type[46]}','${type[47]}','${type[34]}','${type[35]}',
                                                '${type[36]}','${type[37]}','${type[38]}','${type[39]}','${type[40]}','${type[41]}',
                                                '${type[48]}','${type[49]}','${type[50]}');">                                                
                                        
                                        <td class="center" style="text-align: left;">${type[2]}</td>
                                        <td class="center" style="text-align: left;">${type[1]}</td>
                                        <td class="center" style="text-align: left;">${type[3]}</td>
                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${type[4]}"/></td>
                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${type[5]}"/></td>
                                        <td class="center" style="text-align: left;">${type[6]}</td>
                                        
                                        <td class="center" style="text-align: left;">${type[27]}</td>
                                        <td class="center" style="text-align: left;">${type[28]}</td>
                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${type[29]}"/></td>
                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${type[30]}"/></td>
                                        <td class="center" style="text-align: left;">${type[31]}</td>
                                        <td class="center" style="text-align: left;">${type[32]}</td>
                                        <td class="center" style="text-align: left;">${type[33]}</td>
                                        
                                        <td class="center" style="text-align: left;">${type[7]}</td>
                                        <td class="center" style="text-align: left;">${type[8]}</td>
                                        <td class="center" style="text-align: left;">${type[9]}</td>
                                        <td class="center" style="text-align: left;">${type[10]}</td>
                                        <td class="center" style="text-align: left;">${type[11]}</td>
                                        <td class="center" style="text-align: left;">${type[12]}</td>
                                        <td class="center" style="text-align: left;">${type[13]}</td>
                                        <td class="center" style="text-align: left;">${type[14]}</td>
                                        <td class="center" style="text-align: left;">${type[15]}</td>
                                        <td class="center" style="text-align: left;">${type[16]}</td>
                                        <td class="center" style="text-align: left;">${type[17]}</td>
                                        <td class="center" style="text-align: left;">${type[18]}</td>
                                        <td class="center" style="text-align: left;">${type[19]}</td>
                                        <td class="center" style="text-align: left;">${type[20]}</td>
                                        <td class="center" style="text-align: left;">${type[21]}</td>
                                        <td class="center" style="text-align: left;">${type[22]}</td>
                                        <td class="center" style="text-align: left;">${type[23]}</td>
                                        <td class="center" style="text-align: left;">${type[24]}</td>
                                        <td class="center" style="text-align: left;">${type[25]}</td>
                                        <td class="center" style="text-align: left;">${type[26]}</td>
                                        
                                        <td class="center" style="text-align: left;">${type[42]}</td>
                                        <td class="center" style="text-align: left;">${type[43]}</td>
                                        <td class="center" style="text-align: left;">${type[44]}</td>
                                        <td class="center" style="text-align: left;">${type[45]}</td>
                                        <td class="center" style="text-align: left;">${type[46]}</td>
                                        <td class="center" style="text-align: left;">${type[47]}</td>
                                        
                                        <td class="center" style="text-align: left;">${type[34]}</td>
                                        <td class="center" style="text-align: left;">${type[35]}</td>
                                        <td class="center" style="text-align: left;">${type[36]}</td>
                                        <td class="center" style="text-align: left;">${type[37]}</td>
                                        <td class="center" style="text-align: left;">${type[38]}</td>
                                        <td class="center" style="text-align: left;">${type[39]}</td>
                                        <td class="center" style="text-align: left;">${type[40]}</td>
                                        <td class="center" style="text-align: left;">${type[41]}</td>
                                        
                                        <td class="center" style="text-align: left;">${type[48]}</td>
                                        <td class="center" style="text-align: left;">${type[49]}</td>
                                        <td class="center" style="text-align: left;">${type[50]}</td>
                                    </tr>
                                </c:forEach>


                            </table>
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
                            'bSortable': false,
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

