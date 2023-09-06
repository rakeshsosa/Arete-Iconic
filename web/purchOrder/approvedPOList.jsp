<%-- 
    Document   : approvedPOList
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>


    <body class="nav-sm">
        <jsp:include page="../login/menu.htm"/>
             <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Approved Purchase Orders&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                <c:remove var="message" scope="session" /> 
                                <div class="card-title"><h5>Purchase Order</h5></div> 
                                <!-- Table with stripped rows -->
                                
                                <div class="table-responsive">
                                                        <table id="example" class="table datatable table-bordered table-hover ">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Purchase Order No</th>
                                                                    <th>Purchase Order Date</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Prepared By</th>                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>                                                                
                                                                <%-- <c:forEach items="${poList}" var="type">
                                                          <c:choose>
                                                              <c:when test="${not empty type[6]}">
                                                              <td style="width:11%;">${type[6]}</td>
                                                          </c:when>
                                                          <c:otherwise>
                                                              <td style="width:11%;">${type[0]}</td>
                                                          </c:otherwise>
                                                      </c:choose>
                                                      <td style="width:11%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                      <td style="width:16%;">${type[2]}</td>  
                                                      <td style="width:10%;">${type[3]}</td>                                                                                                                                                    
                                                      <td class=" last" style="text-align: left;width:50%;"><!--  
                                                          <a href="../purchase/poEditForm.htm?poNo=${type[0]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;-->
                                                          <a class="fa fa-eye fa-lg" title="view" href="../purchase/approvedPOForm.htm?poNo=${type[0]}&action=edit"></a>
                                                             
                                                          <a class="myButton1"  href="../purchase/poAmendment.htm?poNo=${type[0]}&action=edit">
                                                              <i class="fa fa-edit" >
                                                                  Amendment </i>                                           
                                                          </a>
                                                          <input type="hidden" style="text-align:center;" id="${type[0]}" name="supplier" required="" class="form-control validate[required,custom[email]]" />
                                                          <c:if test="${type[7] eq 'Resend Email'}">
                                                              <a style="color: #FDDC54" class="myButton11" onclick="openWindow('${type[0]}');" >
                                                                  <i class="fa fa-send" >
                                                                      ${type[7]}  </i>                                
                                                              </a> 
                                                          </c:if>
                                                          <c:if test="${type[7] eq 'Send Email'}">
                                                              <a class="myButton9" onclick="openWindow('${type[0]}');" >
                                                                  <i class="fa fa-send" >
                                                                      ${type[7]}  </i>                                
                                                              </a> 
                                                          </c:if>
                                                          <a class="myButton15" target="_blank" class=""  href="../purchase/poEditForm.htm?poNo=${type[0]}&action=print">
                                                              <i class="fa fa-print" >
                                                                  Print  </i>                                          
                                                          </a>
                                                          <a class="myButton2"  class=""  href="../purchase/approvedPOForm.htm?poNo=${type[0]}&action=Cancel">
                                                              <i class="fa fa-trash" >
                                                                  Cancel PO  </i>                                          
                                                          </a>

                                                                </td> 

                                                                </tr>
</c:forEach> --%>


                                                            </tbody>

                                                        </table>
                                                                                   </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->


            <!-- Datatables -->
            <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->


            <script>

                $(document).ready(function () {
                    $('#example').dataTable({
                        oLanguage: {
                            'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                        },
                        "sPaginationType": "full_numbers",
                        "iDisplayLength": 10,
                        "bProcessing": true,
                        "bServerSide": true,
                        "aaSorting": [[0, 'desc']],
                        "sAjaxSource": "../purchase/poPaginationList.htm?listPage=approvedPoList&poStatus=AllList",
                        "aoColumnDefs": [
                            {
                                "aTargets": [0],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    var pono;
                                    if (full[6] == null)
                                    {
                                        pono = full[0];
                                    } else
                                    {
                                        pono = full[6];
                                    }
                                    return pono;
                                }

                            },
                            {
                                "aTargets": [1],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    return moment(full[1]).format('DD-MMM-YYYY');
                                }

                            },
                            {
                                "aTargets": [2],
                                "sWidth": "450px",
                                "mRender": function (data, type, full) {
                                    return full[2];
                                }
                            },
                            {
                                "aTargets": [3],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    return full[3];
                                }

                            },
                            {
                                "aTargets": [4],
                                "sWidth": "250px",
                                "mRender": function (data, type, full) {

                                    var action = '<div style=""> <a class = "fa fa-eye fa-lg" href = "../purchase/approvedPOForm.htm?poNo=' + full[0] + '&action=edit" ></a>\n\
                                    \n\<input type="hidden" style="text-align:center;" id="' + full[0] + '" name="supplier" required="" class="form-control validate[required,custom[email]]" />'

                                    
                                    if ('${sessionScope.EDIT}' == 'y') {
                                        action = action + '\n\<a class="fa fa-edit fa-lg"  href="../purchase/poAmendment.htm?poNo=' + full[0] + '&action=edit"><i class=""> Amendment </i></a>'
                                    }
                                    if (full[5] == 'PO Created' || full[5] == 'PM Recheck')
                                    {
                                        action = action + ' \n\<a class = "fa fa-edit fa-lg"  href = "../purchase/poAmendment.htm?poNo=' + full[0] + '&action=edit" title="Send Email"> <i class = "" > Amendment </i>     </a>'

                                    }
                                    if (full[7] == 'Resend Email')
                                    {
                                        action = action + ' \n\<a style = "color: #FDDC54" class = "fa fa-envelope fa-lg" onclick=openWindow("' + full[0] + '"); title=' + full[7] + '><i class = "" >  </i>    </a>'
                                    }
                                    if (full[7] == 'Send Email') {
                                        action = action + ' \n\<a class = "fa fa-envelope fa-lg" onclick=openWindow("' + full[0] + '"); title=' + full[7] + '> <i class = "" > </i>     </a>'
                                    }
                                    action = action + '\n\<a  target="_blank" class="fa fa-print fa-lg"  href="../purchase/poEditForm.htm?poNo=' + full[0] + '&action=print" title="print"><i class="" >  </i> </a>\n\
                                                <a  class="fa fa-trash fa-lg"  href="../purchase/approvedPOForm.htm?poNo=' + full[0] + '&action=Cancel" title="Cancel PO"><i class="" ></i> </a></div > ';
                                    return action;


                                }

                            },
                        ],
                    });
                });
            </script>

        </div>


        <script>
            function openWindow(id) {
                //            alert("Item not Available..!!");  href="../purchOrder/sendPOEmail.htm?poNo=${type[0]}&action=view"
                myWindow = window.open("../purchase/sendEmailpopup.htm?poNo=" + id + "&suppcode=sendEmail", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function sendEmail(poNo) {
                var suppEmail = $('#' + poNo).val();
                window.location.href = "../purchase/sendPOEmail.htm?poNo=" + poNo + "&suppEmail=" + suppEmail + "&action=applist";
            }
            NProgress.done();
        </script>
    </body>

</html>
