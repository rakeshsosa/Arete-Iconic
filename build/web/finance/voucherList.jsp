<%-- 
    Document   : registerLetterList
    Created on : 7 Mar, 2017, 3:27:51 PM
    Author     : Akshata
--%>
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
        <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Voucher&tab=Voucher Form&pagetype=list"/>
            </div>
     
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Voucher List</h5></div> 
                    
                                <div class="table-responsive">
                                     <table id="example" class="table datatable" >
                                                            <thead>
                                                                <tr class="headings">         
                                                                    <th>Voucher Date</th>   
                                                                    <th>Voucher #</th>
                                                                      <th>Narration</th>
                                                                     <th>Status</th>  
<!--                                                                <th>Created By</th>  -->
                                                                    <th>Action </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                            <h1>test ${dfhfhfh}</h1>
                                                            <c:forEach items="${dfhfhfh}" var="list">
                                                                  
                                                                     <tr class="even pointer">
                                                                         <td class="center">${list.voucherNarration}</td>
                                                                         <td class="center">${list.voucherNarration}</td>
                                                                         <td class="center">${list.voucherNarration}</td>
                                                                         <td class="center">${list.voucherNarration}</td>
                                                                         <td class="center">${list.voucherNarration}</td>
                                                                <%--      <td class="center">${list.voucherId} hi</td>
                                                                      <td class="center">${list.voucherId}</td>
                                                                      <td class="center">${list.voucherId}</td>
                                                                      <td class="center">${list.voucherId}</td>   --%>
<!--                                                             <td>Test</td>
                                                             <td>Test</td>
                                                             <td>Test</td>-->
                                                                   
<!--                                                                      <td>Test</td>-->
<!--                                                                       <td>
                                                                            <a href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>

                                                                                <a class="fa fa-edit fa-lg" href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=edit" data-toggle="tooltip" title="Edit">
                                                                                                                          
                                                                                </a>
                                                                                    
                                                           <%--              <a class="fa fa-trash fa-lg" data-toggle="tooltip" title="Active" href="javascript:"  onClick="
                                                                                  swal({
                                                                                        text:'Do you really wish to make this EXPENSE CATEGORY ACTIVE? Please confirm.',
                                                                                        buttons: ['Cancel','OK']
                                                                                    }).then(function(isConfirm){
                                                                                           if (isConfirm) {         
                                                                                              window.location.href = '../Expenses/expenseCategoryDel.htm?expensesCategoryNumber=${type[0]}&status=${type[1]}';
                                                                                           }
                                                                                           })" >
                                                                            
                                                                                                                         
                                                                            </a>   --%>
                                                                        </td> -->
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

         <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit and Activate Voucher Date, Voucher, Narration, and Status.</p>\n\
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
        <script>
            function confrm() {
                if (confirm('Do you really want to inactive this record?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
<!--        <script>
            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {
//                var oTable = $('#example').dataTable({
//                    "oLanguage": {
//                        "sSearch": "Search all columns:"
//                    },
//                    "aoColumnDefs": [
//                        {
//                            'bSortable': true,
//                            'aTargets': [0]
//                        } //disables sorting for column one
//                    ],
//                    'iDisplayLength': 10,
//                    "sPaginationType": "full_numbers",
//                    "aaSorting": [],
//                    "dom": 'T<"clear">lfrtip',
//                    "tableTools": {
//                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
//                    }
//                });
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
        </script>-->


    </body>

</html>
