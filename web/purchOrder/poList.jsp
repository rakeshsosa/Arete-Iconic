
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

    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
        <jsp:include page="../login/footer.jsp"/>
        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Order&pagetype=list"/>
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
                                <div class="card-title"><h5>Purchase Order List</h5></div>                                 
                                <div class="table-responsive">
                                    <table id="example" class="table w-100 datatable table-hover table-bordered" >
                                        <thead>
                                            <tr class="headings">                                                    
                                                <th>Purchase Order No</th>
                                                <th>Purchase Order Date</th>
                                                <th>Vendor Name</th>
                                                <th>Review</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${poList}" var="type">
                                                  
                                                <c:choose>
                                                    <c:when test="${not empty type[6]}">
                                                    <td>${type[6]}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>${type[0]}</td>
                                                </c:otherwise>
                                            </c:choose>
                                                    <td class="align-left"><fmt:formatDate pattern="dd-MM-yyyy" value="${type[1]}"/></td>
                                            <td style="text-align:left;">${type[2]}</td>  
                                            
                                            <td class="align-left"></td>  
                                            <td class="align-left" style="text-align: left;">
                                                <%--   <a href="../purchase/poEditForm.htm?poNo=${type[0]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;--%>
                                                
                                                <a href="../purchase/purchaseOrderView.htm?poNo=${type[0]}&pk=${type[4]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;


                                                <c:if test="${type[5] eq 'PO Created' or type[5] eq 'PM Recheck'}">
                                                    <a  class="fa fa-pencil fa-lg" href="../purchase/poEditForm.htm?poNo=${type[0]}&action=edit" title="Edit"></a>                                                                        
                                                </c:if>                                                                   
                                                <input type="hidden" style="text-align:center;" id="${type[0]}" name="supplier" required="" class="form-control validate[required,custom[email]]" />
                                                <c:if test="${type[7] eq 'Resend Email'}">
                                                    <a style="color: #FDDC54" class="myButton11" onclick="openWindow('${type[0]}');" >
                                                        <i class="fa fa-send" >
                                                            ${type[7]}  </i>                                
                                                    </a> 
                                                </c:if>
                                                <c:if test="${type[7] eq 'Send Email'}">
                                                    <a class="myButton9" title="${type[7]}" onclick="openWindow('${type[0]}');" >
                                                        <i class="fa fa-send" >
                                                              </i>                                
                                                    </a> 
                                                </c:if>

                                            </td> 

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
        </main>

    <script>
        function openWindow(id) {
        <%--            alert("Item not Available..!!");  href="../purchOrder/sendPOEmail.htm?poNo=${type[0]}&action=view" --%>
            myWindow = window.open("../purchase/sendEmailpopup.htm?poNo=" + id + "&suppcode=sendEmail", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }
        function sendEmail(poNo) {
            var suppEmail = $('#' + poNo).val();
            window.location.href = "../purchase/sendPOEmail.htm?poNo=" + poNo + "&suppEmail=" + suppEmail + "&action=view";
        }
        NProgress.done();
    </script>
    </div>
         <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Send email, view, create, edit and search Purchase Order Number, Date, Vendor Name and Review. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        </script>
    </body>

</html>
