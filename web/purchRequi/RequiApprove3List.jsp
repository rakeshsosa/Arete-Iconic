<%-- 
    Document   : RequiApprove3List
    Created on : 15 Oct, 2016, 3:06:49 PM
    Author     : shweta s sakri
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

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>

                <div class="right_col" role="main">
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="x_panel">
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Approval 2&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Purchase Requisition List</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Requisition No</th>                                                                
                                                                    <th>Requisition Date</th>                                                                  
                                                                    <th>Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:set value="0" var="duplicate"/>  
                                                                <c:forEach items="${purchRequi}" var="list">                                                                                                                                    
                                                                    <c:if test="${list.requisitionNo != duplicate}">
                                                                        <tr class="even pointer">                                                                   
                                                                            <td style="text-align: left;">${list.requisitionNo}</td>                                                                        
                                                                            <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiOnDate}"/></td>
                                                                            <td style="text-align: left;">${list.recordStatus}</td>
                                                                            <td class=" last " style="text-align: center;">
                                                                                <c:if test="${approve eq 'y'}">         
                                                                                    <a class="myButton12" class=""  href="../purchase/RequiApprove3Form.htm?requisitionNo=${list.requisitionNo}">
                                                                                        <i class="fa  fa-undo" >
                                                                                            Need Approval </i>                                          
                                                                                    </a>
                                                                                </c:if>  
                                                                            </td>

                                                                        </tr>                                                                    
                                                                    </c:if>
                                                                    <c:set value="${list.requisitionNo}" var="duplicate"/>
                                                                </c:forEach> 

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>	


                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>


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
                                'aTargets': [3]
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

            <!-- Datatables -->


            <!--                        <script src="../common/theme/pagination/jquery.dataTables.min.js"></script>           
                    <script>
            //                $(document).ready(function () {
            //                    $('input.tableflat').iCheck({
            //                        checkboxClass: 'icheckbox_flat-green',
            //                        radioClass: 'iradio_flat-green'
            //                    });
            //                });
            
            //                var asInitVals = new Array();
                        $(document).ready(function () {
            
            
                            $('#example').dataTable({
                                oLanguage: {
                                    'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                },
                                "sPaginationType": "full_numbers",
                                "iDisplayLength": 10,
                                "bProcessing": true,
                                "bServerSide": true,
                                "sAjaxSource": "../insurance/insuranceDetailPaginationList.htm",
                                "aoColumnDefs": [
                                    {
                                        "aTargets": [0],
                                        "mRender": function (data, type, full) {
                                            return full[0];
                                        }
            
                                    },
                                    {
                                        "aTargets": [1],
                                        "mRender": function (data, type, full) {
                                            return full[1];
                                        }
            
                                    },
                                    {
                                        "aTargets": [2],
                                        "mRender": function (data, type, full) {
                                            return full[2];
                                        }
            
                                    },
                                    {
                                        "aTargets": [3],
                                        "mRender": function (data, type, full) {
            
                                            return moment(data).format("DD-MMM-YYYY");
                                        }
            
                                    },
                                    {
                                        "aTargets": [4],
                                        "mRender": function (data, type, full) {
            
                                            return moment(data).format("DD-MMM-YYYY");
                                        }
            
                                    },
                               
                                    {
                                        "aTargets": [5],
                                        "sWidth": "280px",
                                        "mRender": function (data, type, full) {
            
                                            return '<div style="text-align:left; width: 330px;"><a style="text-align: left;" class="fa fa-eye fa-lg"title="View" href="../insurance/insuranceDetailsForm.htm?insuranceNo='+full[0]+ '&action=view" > \n\
                                                     </a>\n\
                                                    <a style="text-align: left;"class="fa fa-pencil fa-lg"  href="../insurance/insuranceDetailsForm.htm?insuranceNo='+full[0]+ '&action=edit">  \n\
                                                    <i class="fa fa-edit" >Edit</i>  </a> \n\
                                                     </div>';
            
                                        },
                                    },
                                ],
                            });
                        });
                        function confrm() {
                            if (confirm('Do you really want to delete this record?')) {
                                return true;
                            } else {
                                return false;
                            }
                        }
                    </script>
            
                    </div>
                </div>
            </div>
            </div>
            </div>
            </div>
             /page content 
            </div>
            
            
            </div>
            
            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-group" class="tabbed_notifications"></div>
            </div>-->
            <script>
                NProgress.done();
            </script>
    </body>

</html>

