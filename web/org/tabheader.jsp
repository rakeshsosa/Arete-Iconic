<%-- 
    Document   : tabheader
    Created on : Mar 23, 2016, 5:03:33 PM
    Author     : Sudhanshu
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
        <ul class="nav nav-pills">
            <c:forEach items="${tablist}" var="tablist">
                <c:choose>
                    <c:when test="${tablist.tabName eq tab}">
                        <li class="nav-item"><a class="nav-link active" href="${tablist.listUrl}">${tablist.tabName}</a></li>
                                <c:set value="${tablist.listUrl}" var="listUrl"/>
                                <c:set value="${tablist.newEntry}" var="formUrl"/>
                            </c:when>
                        
                            <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="${tablist.listUrl}">${tablist.tabName}</a></li>
                            </c:otherwise>
                        </c:choose>

            </c:forEach>
        </ul>
        <br/>
        <c:forEach items="${tablist}" var="tablist">
            <c:choose>
                <c:when test="${tablist.tabName eq tab}">
                    <div class="text-end">
                <c:if test="${pagetype eq 'list' && formUrl ne 'n'}">
                    
                    <c:if test="${tablist.tabName eq 'Property Document'}">
                    
                    <a class="btn btn-primary btn-sm "  href="${formUrl}"><i class="bi bi-plus"></i> Add ${tablist.tabName}</a>
                    
                    </c:if>
                    
                    <c:if test="${tablist.tabName eq 'Area Management'}">
                    
                    <a class="btn btn-primary btn-sm "  href="${formUrl}"><i class="bi bi-plus"></i> Setup Property Areas </a>
                    
                    </c:if>
                    
                    <c:if test="${tablist.tabName eq 'Vendor Details'}">
                    
                    <a class="btn btn-primary btn-sm "  href="${formUrl}"><i class="bi bi-plus"></i> Add New Vendor </a>
                    
                    </c:if>
                    
                    <c:if test="${tablist.tabName ne 'Property Document' && tablist.tabName ne 'Area Management' && tablist.tabName ne 'Vendor Details'}">
                    
                    <a class="btn btn-primary btn-sm "  href="${formUrl}"><i class="bi bi-plus"></i> Create ${tablist.tabName}</a>
                    
                    </c:if>
                    
                </c:if>
                <c:if test="${pagetype eq 'form'}">
                    <a class="btn btn-primary btn-sm " href="${listUrl}"><i class="bi bi-eye "></i> Show ${tablist.tabName} Records</a>
                </c:if>
                    </div>
                    </c:when>
            </c:choose>

        </c:forEach>
    </body>
</html>
