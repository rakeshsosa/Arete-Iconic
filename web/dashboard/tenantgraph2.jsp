<%-- 
    Document   : tenantgraph2
    Created on : 28 May, 2018, 6:53:36 PM
    Author     : ebs
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../dashboard/dashboardstyle.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>


        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="tenantStyle"> 
                <div class="x_title" >
                    <h3>Tenant Management</h3>
                </div>

                <div id="chartContainer"style="height: 280px; width: 100%;" ></div>                 


                <script>
                    NProgress.done();
                </script>
            </div>
        </div>

    </body>
</html>
