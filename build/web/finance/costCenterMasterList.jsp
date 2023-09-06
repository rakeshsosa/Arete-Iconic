<%-- 
    Document   : registerLetterList
    Created on : 7 Mar, 2017, 3:27:51 PM
    Author     : Akshata
--%>
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

    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>

        <main id="main" class="main">
             <div>
            <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link"  href="../finance/ledgerList.jsp">Ledger</a></li>
          <li class="nav-item"><a class="nav-link active"  href="../finance/costCenterMasterList.jsp">Cost Center</a></li>
<!--           <li class="nav-item"><a class="nav-link"  href="../finance/chartOfAccountsNew.jsp">Chart Of Accounts</a></li>-->
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
             <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
              <li class="nav-item"><a class="nav-link" href="../finance/accountingPeriodList.jsp">Accounting Period</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
                 <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
                 <li class="nav-item"><a class="nav-link" href="../finance/leadReferalList.jsp">Lead Referral</a></li>
        </ul>
            <br>
            <div class="text-end">
                   <a class="btn btn-primary btn-sm " href="../finance/costCenterMaster.jsp"><i class="bi bi-plus"></i> Create Cost Center</a>
                    </div>   </div>
       
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Cost Center List</h5></div> 
                    
                                <div class="table-responsive">
                                    
                                        <table id="example" class="table datatable" >
                                                            <thead>
                                                                <tr class="headings">                                                                              
                                                                    <!--<th style="text-align: center">S.No.</th>-->
                                                                    <th>Cost Center ID</th>   
                                                                    <th>Cost Center Name</th>  
                                                                    <th>Applicable For</th>  
                                                                 
                                                                 

                                                                    <th style="text-align: center;width: 330px;" class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${coaList}" var="type">
                                                                    <tr>
                                                                        <!--<td style="text-align: left" class="center">${type.sno}</td>-->
                                                                        <td style="text-align: left" class="center">${type.accountCode}</td>
                                                                        <td style="text-align: left" class="center">${type.accountDesc}</td>
                                                                     
                                                                        <td style="text-align: left" class="center">${type.parentCode}</td>
                                                                     

                                                                        <td class="center" style="text-align:left" >
                                                                            <c:set var="stsval" value=""/>    
                                                                            <c:set var="lblval" value=""/>   
                                                                            <c:set var="btncls" value=""/>    
                                                                            <c:set var="preimg" value=""/>
                                                                            <c:if test="${type.status eq 'Inactive'}">
                                                                                <c:set var="stsval" value="update"/>    
                                                                                <c:set var="lblval" value="Active"/> 
                                                                                <c:set var="btncls" value="myButton6"/>
                                                                                <c:set var="preimg" value="fa-check"/>
                                                                            </c:if>    
                                                                            <c:if test="${type.status ne 'Inactive'}">
                                                                                <c:set var="stsval" value="Inactive"/>    
                                                                                <c:set var="lblval" value="Inactive"/>
                                                                                <c:set var="btncls" value="myButton2"/>
                                                                                <c:set var="preimg" value="fa-remove"/>
                                                                            </c:if>
                                                                            <c:if test="${type.status ne 'Inactive'}">
                                                                            <a class="myButton" href="../Transactional/chartOfAccountsView.htm?sno=${type.sno}&action=view" >
                                                                                <i class="fa fa-search-plus">
                                                                                    </i>                                              
                                                                            </a>
                                                                            <a class="myButton1" href="../Transactional/chartOfAccountsEdit.htm?sno=${type.sno}&action=edit" >
                                                                                <i class="fa fa-pencil-square-o">  
                                                                                    </i>                                             
                                                                            </a>
                                                                            </c:if>    
                                                                            <a class="${btncls}"  href="../Transactional/deleteDetails.htm?sno=${type.sno}&clsname=ChartOfAccounts&listview=chartOfAccountsList&status=${stsval}" onclick="if (confirm('Do you really want to ${lblval} this record?')) {
                                                                                        return true;
                                                                                    } else {
                                                                                        return false;
                                                                                    }">
                                                                                <i class="fa ${preimg}" >
                                                                                    
                                                                                </i>                                           
                                                                            </a>    
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>

                                                        </table>
                                                    </div>
                                            

  </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <jsp:include page="../login/footer.jsp"/>
        <script>
            function confrm() {
                if (confirm('Do you really want to inactive this record?')) {
                    return true;
                } else {
                    return false;
                }
            }
     
            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {

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


     
    </body>

</html>
