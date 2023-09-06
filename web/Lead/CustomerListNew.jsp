<%-- 
    Document   : CustomerListNew
    Created on : 22 Jun, 2016, 2:41:17 PM
    Author     : ebs-sdd05
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



                                        <jsp:include page="../login/headerlink.htm?submodule=Lead&tab=Customer Management&pagetype=list"/>



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Customer List</h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th>Customer Type </th>
                                                                    <th>Company </th>

                                                                    <th>Customer Source</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%-- <c:set value="0" var="customerCode1"/>
                                                                <c:forEach items="${customermanagmentList}" var="type">
                                                                    <c:if test="${type.customerCode!=customerCode1}">
                                                                        <tr>

                                                                            <td class="center">${type.customerType}</td>
                                                                            <td class="center">${type.company}</td>

                                                                            <td class="center">${type.customerSource}</td>



                                                                            <td class="center" style="text-align: center;">
                                                                                <a  href="../Lead/CustomerFormNew.htm?sno=${type.sno}&customerCode=${type.customerCode}&action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                                                            
                                                                                </a>
<!--                                                                  <a class="btn btn-primary btn-round" href="../CRM/customermanagmentForm.htm?sno=${type.sno}&action=edit"  target="newWindow">
                                                                                <i class="icon-zoom-in icon-white"></i>  
                                                                                Edit                                            
                                                                  </a>              -->
                                                                            </td>   


                                                                        </tr>
                                                                    </c:if>
                                                                    <c:set value="${type.customerCode}" var="customerCode1"/>

                                                                </c:forEach> --%>

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <br />
                                            <br />
                                            <br />

                                        </div>
                                    </div>


                                </div>
                                <!-- /page content -->
                            </div>

                        </div>


                        <!-- Datatables -->
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
                                    "sAjaxSource": "../CRM/CampaignPaginationList.htm?idcheck=Customer",
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
                                            "sWidth": "280px",
                                            "mRender": function (data, type, full) {

                                                return '<div style="text-align:left;"><a style="text-align: left;" class="fa fa-eye fa-lg"title="View" href="../Lead/CustomerFormNew.htm?sno=' + full[3] + '&customerCode=' + full[4] + '&action=view" > \n\
                                                         </a> \n\
                                                         <a style="text-align: left;" class="fa fa-pencil fa-lg" href="../Lead/CustomerFormNewEdit.htm?sno=' + full[3] + '&customerCode=' + full[4] + '&action=edit" > \n\
                                                         <i class="fa fa-edit" >Edit</i> </a> </div>';


                                            },
                                        },
                                    ],
                                });
                            });</script>	








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


</div>
<!-- /page content -->
</div>


</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>
<script>
    NProgress.done();
</script>
</body>

</html>



