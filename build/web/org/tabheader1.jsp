<%-- 
    Document   : tabheader1
    Created on : 23 May, 2018, 11:54:41 AM
    Author     : ebs-sdd10
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="nav nav-tabs">
            <c:forEach items="${tablist}" var="tablist">
                <c:choose>
                    <c:when test="${tablist.tabName eq tab}">
                        <li class="active"><a href="${tablist.listUrl}"><span style="color:#fff;font-size:14px;">${tablist.tabName}</span></a></li>
                                <c:set value="${tablist.listUrl}" var="listUrl"/>
                                <c:set value="${tablist.newEntry}" var="formUrl"/>
                            </c:when>
                        
                            <c:otherwise>
                        <li><a href="${tablist.listUrl}"><span style="color:#fff;font-size:14px;">${tablist.tabName}</span></a></li>
                            </c:otherwise>
                        </c:choose>

            </c:forEach>
        </ul>
        <br/>
        <c:forEach items="${tablist}" var="tablist">
            <c:choose>
                <c:when test="${tablist.tabName eq tab}">
                <c:if test="${pagetype eq 'list' && formUrl ne 'n'}">
                    <a class="myButton3" style="float:right;text-transform: uppercase;" href="${formUrl}"><i class="fa fa-plus-circle"> Create ${tablist.tabName} Record</i></a>
                </c:if>
               
                    </c:when>
            </c:choose>

        </c:forEach>
    </body>
</html>