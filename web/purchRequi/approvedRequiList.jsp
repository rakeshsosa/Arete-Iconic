<%-- 
    Document   : appreovedReqList
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

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">



        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        
        <style>
            tbody tr td{
                text-align: left !important;
            }
        </style>
    </head>


    <body class="nav-sm">
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Approved Requisition&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Approved Requisition</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">                                                    
                                                                    <th>Organisation Code</th>
                                                                    <th>Store Name</th>
                                                                    <th>Requisition No</th>
                                                                    <th>Requisition Date</th>                                                                    
                                                                    <th>Requestor Name</th>                                                                     
                                                                    <th>Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Create Enquiry</span>
                                                                    <th class=" no-link last"><span class="nobr">Action <a class="myButton7" class="" onclick="getReq();"><i class="fa  fa-file-powerpoint-o" > Create PO  </i></a></span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                       <c:forEach items="${purchReqList}" var="type">
                                                                    <tr>
                                                                        <td>${orgCode}</td>
                                                                        <td>${type[8]}</td>
                                                                        <td>${type[0]}</td>
                                                                        
                                                                        <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>                                                                        
                                                                        <td>${type[4]}</td>  
                                                                        <td> <c:if test="${type[7] eq 'MI Requested' || type[7] eq 'Store Reviewed'}">Store Reviewed</c:if></td> 

                                                                            <td> 
                                                                                <a class="fa fa-question-circle" class=""  href="../purchase/enquiryForm.htm?reqNo=${type[0]}" title="Enquiry">
                                                                                                                
                                                                            </a>
                                                                        </td> 
                                                                        <td> 
                                                                            <a class="myButton7" class=""  href="../purchase/reqPOform.htm?reqNo=${type[0]}">
                                                                                <i class="fa  fa-file-powerpoint-o" >
                                                                                    Create PO  </i>                                     
                                                                            </a>
                                                                        </td> 
                                                                        <!--                                                    <td>                                                                                                              
                                                                                                                                <a class="btn btn-primary"  target="newWindow" href="../purchReq/purchReqView.htm?reqNo=${type[0]}&action=view" >
                                                                                                                                <i class="fa fa-search-plus" ></i>
                                                                                                                                View                                            
                                                                                                                            </a>  
                                                                                                                        </td>      -->
                                                                    </tr>
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

            <!-- Datatables -->
            <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->
            <script src="../common/theme/pagination/jquery.dataTables.min.js"></script>


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
                                                                                "sAjaxSource": "../purchase/appreovedReqPaginationList.htm",
                                                                                "aoColumnDefs": [
                                                                                    {
                                                                                        "aTargets": [0],
                                                                                        "sWidth": "150px",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return '${orgCode}';
                                                                                        }

                                                                                    },
                                                                                    {
                                                                                        "aTargets": [1],
                                                                                        "sWidth": "",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return full[8];
                                                                                        }

                                                                                    },
                                                                                    {
                                                                                        "aTargets": [2],
                                                                                        "sWidth": "150px",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return full[0];
                                                                                        }

                                                                                    },
                                                                                    {
                                                                                        "aTargets": [3],
                                                                                        "sWidth": "150px",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return moment(full[1]).format('DD-MMM-YYYY');
                                                                                        }
                                                                                    },
                                                                                    {
                                                                                        "aTargets": [4],
                                                                                        "sWidth": "200px",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return full[4];
                                                                                        }

                                                                                    },
                                                                                    {
                                                                                        "aTargets": [5],
                                                                                        "sWidth": "200px",
                                                                                        "mRender": function (data, type, full) {
                                                                                            return 'Store Reviewed';
                                                                                        }

                                                                                    },
                                                                                    {
                                                                                        "aTargets": [6],
                                                                                        "sWidth": "150px",
                                                                                        "bSortable": false,
                                                                                        "mRender": function (data, type, full) {

                                                                                            return '<a class="fa fa-question-circle fa-lg" class=""  href="../purchase/enquiryForm.htm?reqNo=' + full[0] + '" title="Enquiry"></a>';

                                                                                        },
                                                                                    },
                                                                                    {
                                                                                        "aTargets": [7],
                                                                                        "sWidth": "250px",
                                                                                        "bSortable": false,
                                                                                        "mRender": function (data, type, full) {

                                                                                            return '<a class="fa fa-print fa-lg" target="_blank" class=""  href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=print" title="Print"></a>\n\
                                                                                                    <input type="checkbox" id="chk1" name="chk1"  value="' + full[0] + '$$' + full[8] + '$$' + '${orgCode}' + '$$" onclick="getVal(this);"/>';

                                                                                        },
                                                                                    },
                                                                                ],
                                                                            });
                                                                        });
            </script>

        </div>      

    </div>
    <!-- /page content -->
</div>

</div>

<script>
    function getVal($this) {
        if (!$($this).is(':checked'))
        {
            return false;
        }
        var split1 = '';
        var req = '';
        var x = document.getElementById("example").rows.length;
        var $itemRow = $($this).closest('tr');
        var chkVal = $itemRow.find('#chk1').val().split("$$");

        var valchk = chkVal[1] + "$$" + chkVal[2];

        var aa = document.getElementsByName('chk1');

        for (var i = 0; i < aa.length; i++) {
            if (aa[i].checked) {

                split1 = aa[i].value.split("$$");

                req = split1[1] + "$$" + split1[2];
                if (req !== valchk) {
                    alert('Organization Code and Store Name not matching..!!!');
                    $itemRow.find('#chk1').prop('checked', false);
                    return;
                }
            }

        }

    }
    function getReq()
    {
        var split1 = '';
        var req = '';
        var aa = document.getElementsByName('chk1');
        var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
        if (atLeastOneIsChecked <= 0) {
            alert("Please select atleast one check box..!!!");
            return  false;
        }

        for (var i = 0; i < aa.length; i++) {
            if (aa[i].checked) {

                split1 = aa[i].value.split("$$");

                req = req + split1[0] + "@@";
            }

        }
        window.location.href = "../purchase/reqPOform.htm?reqNo=" + req;
    }
    NProgress.done();
</script>
</body>

</html>
