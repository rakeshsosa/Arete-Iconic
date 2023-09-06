<%-- 
    Document   : empEducQualification1
    Created on : 30 Mar, 2016, 11:37:50 AM
    Author     : ebs-sdd26
--%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            jQuery(document).ready(function () {
                $('#grade1').keyup(function () {
                    this.value = this.value.toUpperCase();
                });
            });
            $(document).on('click', '#deleteRowedu', function () {

                var $itemRow = $(this).closest('tr');
                var discount = $itemRow.find('#eduSNo').val();
//                 alert(discount);
                var s = $('#sSavesnoedu').val();
                if (s == '') {
                    $('#sSavesnoedu').val(discount);
                }
                else
                {
                    $('#sSavesnoedu').val(s + '//' + discount);
                }
                deleteRowedu(this);
            });

            function deleteRowedu(row) {

                var rowCount = $('#currencytableedu tr').length;
//                if( rowCount > 1) {

                $(row).parents('.item-row').remove();
                return true;
//                }
//                else {
//                    alert("Grid Cannot be Empty");
//                    return false;
//                }    


            }

            var yr1 = 0;
            function yrSelector()
            {
                var startyear = 1900;
                var endyear = new Date().getFullYear();

                if (parseInt(yr1) == 0) {
                    for (var i = startyear; i <= endyear; i++) {
                        node = document.createElement("Option");
                        textnode = document.createTextNode(i);
                        node.appendChild(textnode);
                        document.getElementById("yearOfPassing").appendChild(node);
                    }
                    yr1 = 1;
                }
            }
            function chkeduyr() {
                var dob = $('#dob').val();
                var dtdob = dob.split("-");
                var yr = dtdob[2];
                var yop = $('#yearOfPassing').val();
//                alert(yr);
                if (dob == '' || dob == null) {
                    alert("Enter first Date of birth in Personal Details Tab!!!");
                    $('#yearOfPassing').val("");
                    $('#yearOfPassing').focus();
                }
                else {
                    if (yop < yr) {
                        alert("Enter Correct Year Of Passing");
                        $('#yearOfPassing').val("");
                        $('#yearOfPassing').focus();
                    }
                }
            }
            function dec() {
                var val = $("#percentage").val();
                var incmper = val.split(".");
                var abc = incmper[1];

                if (abc.length >= 3) {
                    alert("Please enter 2 decimals");
                    $("#percentage").val("");
                }
            }
            function discountChange() {
                var val = $("#percentage").val();
                if (val >= 0 && val < 100) {
                    dec();
                    return true;
                }
                else {
                    alert("Enter Numeric value & Less Than 100");
                    $("#percentage").val("");
                }


            }
            function dec1() {
                var val = $("#percentage1").val();
                var incmper = val.split(".");
                var abc = incmper[1];

                if (abc.length >= 3) {
                    alert("Please enter 2 decimals");
                    $("#percentage1").val("");
                }
            }
            function discountChange1() {
                var val = $("#percentage1").val();
                if (val >= 0 && val < 100) {
                    dec1();
                    return true;
                }
                else {
                    alert("Enter Numeric value & Less Than 100");
                    $("#percentage1").val("");
                }


            }
            function clreduedit() {
                $('#nameOfSchool').val("");
                $('#percentage').val("");
                $('#grade').val("");
                $('#yearOfPassing').val("");
                $('#majorSubjects').val("");
                $('#specialization').val("");
                $('#otherProfessQualif').val("");
                $('#specialisedCourseAttended').val("");
                $('#skills').val("");
            }
            function check_digit(e, obj, intsize, deczize) {
                var keycode;

                if (window.event)
                    keycode = window.event.keyCode;
                else if (e) {
                    keycode = e.which;
                }
                else {
                    return true;
                }

                var fieldval = (obj.value),
                        dots = fieldval.split(".").length;

                if (keycode == 46) {
                    return dots <= 1;
                }
                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
                    // back space, tab, delete, enter
                    return true;
                }
                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                    return false;
                }
                if (fieldval == "0" && keycode == 48) {
                    return false;
                }
                if (fieldval.indexOf(".") != -1) {
                    if (keycode == 46) {
                        return false;
                    }
                    var splitfield = fieldval.split(".");
                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                        return false;
                } else if (fieldval.length >= intsize && keycode != 46) {
                    return false;
                } else {
                    return true;
                }
            }
        </script>

    </head>
    <body>
        <hr>
        <div style="padding-left: 3%;text-align: center;text-decoration-color: #008000;text-decoration-line: underline;"><h4>Education Qualification</h4></div>
        <hr>
        <br/>
        <c:if test="${action eq 'edit'}">
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Name of School/College/Institution</label>
                <div class="controls" >
                    <input class="input-xlarge alphaonly" id="nameOfSchool" autocomplete="off" type="text" maxlength="30" value="" onkeypress="return isNumberKey3(event)">
                </div>
            </div>
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Percentage</label>
                <div class="controls" >
                    <input class="input-xlarge" id="percentage" autocomplete="off" type="text" maxlength="30" value="" onkeypress="return check_digit(event, this, 2, 2);">
                </div>
            </div>
            <br/><br/><br/><br/>
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Grade</label>
                <div class="controls" >
                    <input class="input-xlarge alphaonly" id="grade" autocomplete="off" type="text" maxlength="1" value="" onkeypress="return isNumberKey3(event)">
                </div>
            </div>
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Year Of Passing</label>
                <div class="controls" >
                    <select id="yearOfPassing" class="form-control" onclick="yrSelector();" onchange="chkeduyr()">
                        <option disabled="" selected="">Select Your Option</option>
                    </select>
                </div>
            </div>
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Major Subjects</label>
                <div class="controls" >
                    <input class="input-xlarge" id="majorSubjects" autocomplete="off" type="text" maxlength="30" value="">

                </div>
            </div>
            <div class="control-group" style="float: left;" >
                <label class="control-label"><a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a>Specialization</label>
                <div class="controls" >
                    <input class="input-xlarge" id="specialization" autocomplete="off" type="text" maxlength="30" value="">
                </div>
            </div>

            <c:forEach items="${empedulist}" var="edu">
                <c:set var="otherProfessQualif" value="${edu.otherProfessQualif}"/>
                <c:set var="specialisedCourseAttended" value="${edu.specialisedCourseAttended}"/>
                <c:set var="skills" value="${edu.skills}"/>
                <c:set var="empId" value="${edu.empId}"/>
            </c:forEach>


            <div class="control-group" style="float: left;" >
                <label class="control-label">Other Professional Qualifications (including IT)</label>
                <div class="controls" >
                    <input class="input-xlarge" id="otherProfessQualif" name="otherProfessQualif" autocomplete="off" type="text" maxlength="30" value="${otherProfessQualif}">
                </div>
            </div>
            <div class="control-group" style="float: left;" >
                <label class="control-label">Specialised Courses Attended</label>
                <div class="controls" >
                    <input class="input-xlarge" id="specialisedCourseAttended" name="specialisedCourseAttended" autocomplete="off" type="text" maxlength="30" value="${specialisedCourseAttended}">
                </div>
            </div>
            <br/><br/><br/><br/><br/><br/><br/><br/>
            <div class="control-group" style="float: left;" >
                <label class="control-label">Skills</label>
                <div class="controls" >
                    <input class="input-xlarge" id="skills" name="skills" autocomplete="off" type="text" maxlength="30" value="${skills}">     
                </div>
            </div>
            <br/><br/><br/>


            <div class="control-group" style="float: left;">
                <ul style="list-style-type:none;">
                    <li style="float: left"><a href="#" class="button add" onclick="addOrderRow_test();">Add</a><button type="button" class="btn" onclick="clreduedit()">Clear</button>&nbsp&nbsp
                    </li>
                </ul>
            </div>



            <script>
                function nextpage3() {

                    $("#tag1").hide();
                    $("#tag").hide();
                    $("#tag2").hide();
                    $("#tag3").hide();
                    $("#tag4").toggle();
                    $("#tag5").hide();
                    $("#tag6").hide();
                    $("#tag7").hide();
                    $("#tag8").hide();
                    $("#tag9").hide();
                    $("#tag10").hide();
                    $("#tag11").hide();
                    $("#tag12").hide();
                    $("#tag13").hide();

                }

                function previouspage3() {
                    $("#tag1").hide();
                    $("#tag").hide();
                    $("#tag2").toggle();
                    $("#tag3").hide();
                    $("#tag4").hide();
                    $("#tag5").hide();
                    $("#tag6").hide();
                    $("#tag7").hide();
                    $("#tag8").hide();
                    $("#tag9").hide();
                    $("#tag10").hide();
                    $("#tag11").hide();
                    $("#tag12").hide();
                    $("#tag13").hide();
                }

                var count = 0;


                ///-----------The function to add data in grid----
                function addOrderRow_test() {

                    var x = document.getElementById('nameOfSchool').value &&
                            document.getElementById('percentage').value &&
                            document.getElementById('grade').value &&
                            document.getElementById('yearOfPassing').value &&
                            document.getElementById('majorSubjects').value &&
                            document.getElementById('specialization').value;


                    if (x == null || x == "")
                    {
                        alert("Mandatory Fields Should not be Empty");
                        return false;
                    }


                    else
                    {
                        var nameOfSchool = document.getElementById('nameOfSchool').value;

                        var percentage = document.getElementById('percentage').value;
                        //  alert(percentage);
                        var grade = document.getElementById('grade').value;
                        // alert(grade);
                        var yearOfPassing = document.getElementById('yearOfPassing').value;
                        // alert(yearOfPassing);
                        var majorSubjects = document.getElementById('majorSubjects').value;
                        // alert(majorSubjects);
                        var specialization = document.getElementById('specialization').value;
                        $('#currencytableedu tr').each(function () {
                            $(this).find('td').each(function () {
                                var a = $(this).find('#yearOfPassing1').val();
                                if (a == yearOfPassing) {
                                    alert('Year of Passing Already Exist');
                                    document.getElementById('td').value = "";
                                    return false;
                                } else {
                                    return true;
                                }
                            })
                        })
                        var table = document.getElementById("currencytableedu");
                        var slNo = table.rows.length;
                        // alert(slNo);
                        var tr = table.insertRow(slNo - 1);
                        tr.id = 'list_tr_' + slNo;
                        tr.innerHTML = '<td class="tinput"><img src="../common/images/cross.png" onclick="removeRow('
                                + slNo + ')" style="border: none;text-align: center;"> </td><td class="tinput"><input  type="text" readonly name="nameOfSchool"  value="' + nameOfSchool +
                                '" style="border: none;text-align: center;"></td><td><input class="input-xlarge" type="text" readonly  name="percentage" value="' + percentage +
                                '" style="border: none;text-align: center;"></td><td><input class="input-xlarge" type="text" readonly name="grade" value="' + grade +
                                '" style="border: none;text-align: center;"></td><td><input class="input-xlarge" type="text" readonly name="yearOfPassing" value="' + yearOfPassing +
                                '" style="border: none;text-align: center;"></td><td><input class="input-xlarge" type="text" readonly name="majorSubjects" value="' + majorSubjects +
                                '" style="border: none;text-align: center;"></td><td><input class="input-xlarge" type="text" readonly name="specialization" value="' + specialization +
                                '" style="border: none;text-align: center;"> </td>';
                        count++;
                    }
                }


                function removeRow(id, $this) {
                    count--;
                    var $itemRow = $($this).closest('tr');
                    var table = document.getElementById("currencytableedu");

                    for (var i = 0; i < table.rows.length; i++) {



                        var lr = table.rows[i];
                        if (lr.id == 'list_tr_' + id) {
                            table.deleteRow(i);
                            return;
                        }

                    }

                }
            </script>



            <div style="overflow: scroll;height: 200px;width: 950px;border: 1px solid grey;margin-bottom:  50px;margin-left: 50px;">
                <table class="gridtable">
                    <thead>
                        <tr>
                            <th class="theader">Delete</th>
                            <th class="theader">Name of Institution</th>
                            <th class="theader">Percentage</th>
                            <th class="theader">Grade</th>
                            <th class="theader">Year Of Passing</th>
                            <th class="theader">Major Subjects</th>
                            <th class="theader">Specialization</th>
                        </tr>
                    </thead>
                    <tbody id="currencytableedu">
                        <c:forEach items="${empedulist}" var="type">
                            <tr class="item-row"> 
                                <td><img src="../common/images/cross.png" id="deleteRowedu"><input type="hidden" id="eduSNo"  name="eduSNo" value="${type.SNo}"/> </td>
                                <td><input class="input-xlarge validate[required]" id="nameOfSchool1" name="nameOfSchool" autocomplete="off" type="text" maxlength="30" value="${type.nameOfSchool}" onkeypress="return onlyAlphabets(event, this)"></td>
                                <td><input class="input-xlarge validate[required]" id="percentage1" name="percentage" autocomplete="off" type="text" maxlength="8" value="${type.percentage}" onkeypress="return check_digit(event, this, 2, 2);"></td>
                                <td><input class="input-xlarge validate[required]" id="grade1" name="grade" autocomplete="off" type="text" maxlength="1" value="${type.grade}" onkeypress="return onlyAlphabets(event, this)"></td>
                                <td><input class="input-xlarge" id="yearOfPassing1" name="yearOfPassing" autocomplete="off" type="text" readonly="" value="${type.yearOfPassing}"></td>
                                <td><input class="input-xlarge validate[required]" id="majorSubjects1" name="majorSubjects" autocomplete="off" type="text" maxlength="30" value="${type.majorSubjects}"></td>
                                <td><input class="input-xlarge validate[required]" id="specialization1" name="specialization" autocomplete="off" type="text" maxlength="30" value="${type.specialization}"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--<input id="sSavesnoedu" type="text" name="sSavesnoedu" value="">-->
        </c:if>
        <c:if test="${action eq 'view'}">
            <div style="overflow: scroll;height: 200px;width: 950px;border: 1px solid grey;margin-bottom:  50px;margin-left: 50px;">
                <table class="gridtable">
                    <thead>
                        <tr>
                            <th class="theader">Name of Institution</th>
                            <th class="theader">Percentage</th>
                            <th class="theader">Grade</th>
                            <th class="theader">Year Of Passing</th>
                            <th class="theader">Major Subjects</th>
                            <th class="theader">Specialization</th>
                        </tr>
                    </thead>
                    <c:forEach items="${empedulist}" var="type">
                        <tr> 
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.nameOfSchool}"></td>
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.percentage}"></td>
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.grade}"></td>
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.yearOfPassing}"></td>
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.majorSubjects}"></td>
                            <td><input class="input-xlarge" type="text" readonly="" value="${type.specialization}"></td>
                        </tr>
                    </c:forEach>
                    <tbody id="currencytableedu">

                    </tbody>
                </table>
            </div>
        </c:if>
        <div style="padding-left: 400px;">
            <button type="button" class="btn btn-succ btn-round btn-small" style="padding-right: 30px;padding-left: 30px; " onclick="return previouspage3();" ><< Previous</button>
            <button type="button" class="btn btn-succ btn-round btn-small" style="padding-right: 30px;padding-left: 30px; " onclick="return nextpage3();" >Next >></button>
        </div>
        <br/>
    </body>
</html>
