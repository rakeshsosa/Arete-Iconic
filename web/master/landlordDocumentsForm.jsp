<%-- 
    Document   : SalesQuote
    Created on : 11 Mar, 2016, 1:37:56 PM
    Author     : njn
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
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>        
    </head>


    <body class="nav-md">

        <c:forEach items="${fileSize}" var="list">
            <c:if test="${list[0] eq 'F-25'}">
                <input type="hidden" value="${list[1]}" id="docsize"/>
            </c:if>
        </c:forEach>

        <br/>
        <table  class="table table-striped responsive-utilities jambo_table" id="itemsTableDocuments">
            <thead>
                <tr class="item-rowdocuments"> 
                    <c:if test="${action ne 'view'}">
                        <th><i class="fa fa-trash fa-lg"></i></th> 
                        </c:if>
                    <th style="font-size:13px;">Attachment</th>
                </tr>
            </thead>
            <tbody id="">               
                <c:choose>
                    <c:when test="${fn:length(landlordDocuments) > 0}">
                        <c:forEach items="${landlordDocuments}" var="attach">
                            <c:choose>
                                <c:when test="${action eq 'edit'}">
                                <input name="attachSnoFull" type="hidden" value="${attach.sno}" >
                                <tr class="item-rowdocuments">
                                <input name="attachSno" type="hidden" value="${attach.sno}" >
                                <td align="center" onclick=""><button type="button" id="deleteRowdocument"><i class="fa fa-trash fa-lg-o"></i></button></td>                                        
                                <td><c:if test="${not empty attach.filename}">
                                        <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                            <span title="${attach.filename}"></span></a>
                                        </c:if>
                                        <c:if test="${empty attach.filename}">N/A</c:if> 
                                    </td>
                                </tr>
                        </c:when>
                        <c:when test="${action eq 'view'}">
                            <tr class="item-rowdocuments">
                            <input name="attachSno" type="hidden" value="${attach.sno}" >
                            <!--<td align="center" onclick=""><button type="button"><i class="fa fa-trash fa-lg-o" id=""></i></button></td>-->                                        
                            <td><c:if test="${not empty attach.filename}">
                                    <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                        <span title="${attach.filename}"></span></a>
                                    </c:if>
                                    <c:if test="${empty attach.filename}">N/A</c:if> 
                                </td>
                            </tr>
                    </c:when>
                    <c:otherwise>
                        <tr class="item-rowdocuments">
                        <input name="attachSno" type="hidden" value="${attach.sno}" >
                        <td align="center" onclick=""><button type="button" id="deleteRowdocument"><i class="fa fa-trash fa-lg-o"></i></button></td>                                        
                        <td><c:if test="${not empty attach.filename}">
                                <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                    <span title="${attach.filename}"></span></a>
                                </c:if>
                                <c:if test="${empty attach.filename}">N/A</c:if> 
                            </td>
                        </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:if test="${action eq 'view'}"><tr><td>No Documents...!</td></tr></c:if>
        <c:if test="${action ne 'view'}">
            <tr class="item-rowdocuments">
                <td align="center" onclick=""><button type="button" id="deleteRowdocument"><i class="fa fa-trash fa-lg-o"></i></button></td>                                        
                <td style="font-size:12px;">                                                                               
                    <input class="input-file uniform_on"  id="attachmentReference" type="file" value="" name="attachmentReference" onchange="fileCheck(this);"></td>
            </tr>
        </c:if>
    </c:otherwise>
</c:choose>


</tbody>

</table>
<c:if test="${action ne 'view'}">
    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
        <div class="col-md-9 col-sm-9 col-xs-12">
            <a href="#" id="addRowBtndocument" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Document</a>

        </div>
    </div>
</c:if>

<p>&nbsp;</p> 

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>
<script>
    function fileCheck($this)
    {
        var docsize = document.getElementById("docsize").value;
        var $fin = $($this).closest('tr');
        var fl = $fin.find('#attachmentReference').val();
        var fileSize = $this.files[0];
        var sizeInMb = fileSize.size / 1024;
        var sizeLimit = 1024 * docsize;
        if (sizeInMb > sizeLimit) {
            alert("File Size Exceeded (Only " + docsize + " MB Allowed)");
            $($this).val('');
            return;
        }
        var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|pdf|PDF|docx|DOCX|zip|ZIP)$/;
        if (!fl.match(fmt))
        {
            alert('Invalid File');
            $($this).val('');
            return false;
        }

        else {
            return true;
        }

    }
</script>
<script>
    NProgress.done();
</script>
</body>
</html>

