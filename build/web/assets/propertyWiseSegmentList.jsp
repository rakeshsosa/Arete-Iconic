<%-- Document : assetDetailsList Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <!-- Bootstrap core CSS -->

<style>
       @media only screen and (max-width: 600px) {
.card {
    overflow: hidden;
    width: fit-content;
}
}
  </style>  
    <script>

            function updateProcress()
            {
                alert("")

                var assetName = document.getElementById('assetName').value;
                console.log(assetName);
                //  alert(assetName);
//                 var enqNo = val;
//                 
//                  var remarks = prompt("Please mention reason of Remarks", "");
//                if (remarks == null || remarks == '') {
//                    return false;
//                } else {
                // window.location.href = "../LEAVE/leaveStatus.htm?leaveAppNo=" + leaveAppNo + "&noofdays2="+ noofdays2 +"&leaveType2=" + leaveType2 +"&hrremarks=" + hrremarks + "&action=Rejected By HR";
                window.location.href = "../assets/propertyWiseSegmentList.htm?assetName=" + assetName + "";
            }



        </script>

    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />
        <jsp:include page="../login/footer.jsp" />

        <main id="main" class="main">
            <div class="mt-3">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <ul class="nav nav-pills">
<!--                    <li class="nav-item">
                        <a class="nav-link" href="../assets/subAssetsDetailsList.htm">Property Segments</a>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link active" href="../assets/propertyWiseSegmentList.htm">List Of Proprty Wise Segments</a>
                    </li>
                </ul>
                <br>
                <div class="text-end"></div>
            </div>
            <!--                        <div class="mt-3">
            <%--<jsp:include  page="../login/headerlink.htm?submodule=Property Segments&tab=Property Wise Segments&pagetype=list" />--%>
        </div>-->
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Property Wise Segment List</h5>
                                </div>
                                <!-- Table with stripped rows -->
                                <div class="col-lg-3 px-0" >
                                    <p id="selectTriggerFilter" >
                                        <label ><b>Search Name</b></label><br />
                                    </p>
                                </div>

                                <%-- <select id="assetName"  class="form-control" onchange="updateProcress()">
                                                    <option value="" disabled selected>Select your option</option>
                                                    <c:forEach items="${propertyWiseilst}" var="list">
                                                    <option value="${list}">${list}</option>
                                                    </c:forEach>
</select>--%>


                                <table id="example" class="table datatable table-bordered table-hover">
                                    <thead>

                                        <tr class="headings">
                                            <th>Unit Code</th>
                                            <th>Unit Name</th>
                                            <th>Property Code</th>
                                            <th>Property Name</th>
                                            <th>Status</th>
                                            <th class=" no-link last"><span class="nobr">Action</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${subAssetDetails}" var="list">
                                            <tr class="even pointer">                                                                   
                                                <td class=" "style="text-align: left;">${list[3]}</td>
                                                <td class=" "style="text-align: left;">${list[4]}</td>
                                                <td class=" "style="text-align: left;">${list[0]}</td>
                                                <td class=" "style="text-align: left;">${list[1]}</td>
                                                <td class=" "style="text-align: left;">${list[5]}</td>
                                                <td class=" last">
                                                    <a href="../assets/subAssetsDetailsForm.htm?pk=${list[2]}&subAssetCode=${list[3]}&assetCode=${list[0]}&action=view" data-bs-toggle="tooltip" data-bs-placement="top" class="fa fa-eye fa-lg" title="View"></a>&nbsp;

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

<!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>-->
        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script>

                var table = $('#example').DataTable({
                    "lengthMenu": [
                        [10, 25, 50, 100, -1],
                        [10, 25, 50, 100, "All"]
                    ],
                    "dom": 'rtipS',
                    "deferRender": true,
                    initComplete: function () {
                        var column = this.api().column(3);

                        var select = $('<select class="filter form-select"><option value="">Show All</option></select>')
                                .appendTo('#selectTriggerFilter')
                                .on('change', function () {
                                    var val = $(this).val();
                                    column.search(val).draw()
                                });

                        var offices = [];
                        column.data().toArray().forEach(function (s) {
                            s = s.split(',');
                            s.forEach(function (d) {
                                if (!~offices.indexOf(d)) {
                                    offices.push(d)
                                    select.append('<option value="' + d + '">' + d + '</option>');
                                }
                            })
                        })

                    }
                });

        </script>
    </body>

</html>