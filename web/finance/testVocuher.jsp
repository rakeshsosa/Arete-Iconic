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
        <title>Arete Iconic</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">    </head>
    
<body class="nav-md">
    <jsp:include page="../login/menu.htm"/>

<main id="main" class="main">
    <div>
      <jsp:include page="../login/headerlink.htm?submodule=Voucher&tab=Voucher Form&pagetype=list"/>
    </div>

    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Ledger List</h5></div>
                        <div class="table-responsive">
                            <table id="example" class="table datatable table-hover table-bordered" style="overflow-y: scroll;">
                                <thead>
                                    <tr class="headings">
                                         <th>Voucher Date</th>   
                                                                    <th>Voucher #</th>
                                                                      <th>Narration</th>
                                                                     <th>Status</th>  
                                        <th class="no-link last"><span class="nobr">Action</span></th>
                                    </tr>
                                </thead>

                                <tbody>
                                <h1>${ledgerList}</h1>
                                    <c:forEach items="${dfhfhfh}" var="type">
                                                                <tr class="even pointer">
                                                                <td class="center">${type.cdate}</td>
                                                                <td class="center">${type.voucherId}</td>
                                                                <td class="center">${type.voucherNarration}</td>
                                                                <td class="center">${type.voucherAccountStatus}</td>
                                                                <td></td>
<!--                                                                <td class="center">${type.voucherId}</td>-->
                                                                                                                                        
                                                               
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


    <jsp:include page="../login/footer.jsp"/>
     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, View, Search, Edit, Activate and Inactivate Account Group, Ledger Code, Ledger Account Name, Ledger Account Description, and Opening Balance. </p>\n\
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
