<%-- 
    Document   : bookingDetailsList
    Created on : 10 Dec, 2018, 4:09:14 PM
    Author     : Lakshmi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <title>Arete Iconic</title> 
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">

        <style>

            *{
                margin: 0;
                padding: 0;
            }
            body{
                color: #333333;
            }
            .numberDiv{
                height: 120px;/*
                width: 170px;*/
                justify-content: center;
                align-items: center;
                display: flex;
                color: #ffffff;
                font-size: 14px;
                text-align: center;
                font-family:Verdana;
                margin-bottom: 0;
                border: 1px solid black;
            }
            .swal-footer{
                text-align: center !important;
            }
            #boxesContainer{
                display: grid;
                grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
            }
            @media (max-width: 500px){
                #boxesContainer{

                    grid-template-columns: 1fr 1fr 1fr;
                }    
            }
            #Occupied{
                background-color: #8dc63f;
                cursor: pointer;
            }
            #Vacant{
                background-color: #be1e2d; 
                cursor: pointer;
            }
            #Booked{
                background-color: #f7941d; 
                cursor: pointer;
            }
            .redClass{
                background-color: #be1e2d;
            }
            .greenClass{
                background-color: #8dc63f;
            }
            .yellowClass{
                background-color: #f7941d;
            }
            .text-end .btn{
                /*    display: none;*/
            }
            /* without horizontal scrollbar for mobiles*/
            @media only screen and (max-width: 720px){

                .numberDiv {
                    width: auto;
                }
                section{
                    flex-direction: column;
                    width: 100%;
                }
            }

            .swal2-radio{
                display: grid !important;
              }

        </style>
        <!-- Bootstrap core CSS -->
        <script>
            setTimeout(function () {
                $('#successMessage').fadeOut('fast');
            }, 5000);
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
                    <li class="nav-item"><a class="nav-link active" href="../tenant/bookingManagmentList.htm">Occupancy</a></li>
                    <li class="nav-item"><a class="nav-link" href="../tenant/newEnquiryList.htm">Enquiries</a></li>
                    <li class="nav-item"><a class="nav-link" href="../tenant/bookingDetailsList.htm">Quotations</a></li>
                    <li class="nav-item"><a class="nav-link" href="../tenant/bookingPropertyDetailsList.htm">Bookings</a></li>
                </ul>
                <br>
                <div class="text-end">
                    <!--                   <a class="btn btn-primary btn-sm " href="../tenant/bookingManagmentForm.htm">
                                            <i class="bi bi-plus"></i> Add Enquiry </a>-->

                    <a class="btn btn-primary btn-sm " href="../tenant/newEnquiryForm.htm">
                        <i class="bi bi-plus"></i> Add Enquiry </a>
                </div>
            </div>
            <!--                        <div class="mt-3">
            <%--<jsp:include page="../login/headerlink.htm?submodule=Booking Management&tab=Booking Management&pagetype=list"/>--%>
        </div>-->
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Booking Management List</h5>
                                </div>
                                <div class="clearfix">
                                    <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                    <c:remove var="message" scope="session" /> 
                                </div>


                                <div class="col-md-4 mb-3 form-floating col-lg-4 col-sm-12">
                                    <select class="form-select" name="clientType" placeholder="Category" id="doctype" maxlength="98" required>
                                        <option value="Select Property" disabled selected>Select Property</option>
                                        <c:forEach items="${propertyList}" var="type">  
                                            <option value="${type}">${type}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="groupname"><span style="color:red">*</span> Select Property</label>
                                </div>
                                <!--#68c499-green  416e9d-blue d9b95-yellow eb5e6c-red-->
                                <div class="col-lg-12">
                                    <div class="row" style="color:white;">
                                        <div class="col text-center border m-3 p-3" style="background-color:#2b3990; font-family: Verdana;" id="Property_count"><img title="Total Units" class="mt-4" src="../common/images/4.png"> <br></div>
                                        <div class="col text-center border m-3 p-3" style="background-color:#8dc63f; font-family: Verdana;" id="occupied_count"><img title="Occupied" class="mt-4" src="../common/images/1.png">  <br></div>
                                        <div class="col text-center border m-3 p-3" style="background-color:#f7941d; font-family: Verdana;" id="booked_count"><img title="Booked" class="mt-4" src="../common/images/3.png">  <br></div>
                                        <div class="col text-center border m-3 p-3" style="background-color:#be1e2d; font-family: Verdana;" id="Vacant_count"><img title="Vacant" class="mt-4" src="../common/images/5.png">  <br></div>
                                    </div>
                                </div> 

                                <div class="col-lg-12 mt-3">
                                    <div class="col-lg-4 mx-auto d-flex justify-content-between">
                                        <div>
                                            <span class="redClass" style="font-family: Verdana;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            Vacant
                                        </div>
                                        <div>
                                            <span class="greenClass" style="font-family: Verdana;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            Occupied
                                        </div>
                                        <div>
                                            <span class="yellowClass" style="font-family: Verdana;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            Booked
                                        </div>



                                    </div>
                                    <div class="col-lg-12 my-4" id="boxesContainer">

                                    </div> 
                                </div>
                            </div>
                        </div>
                        <!--                                <div class="row my-3" id="boxesData">
                                                            
                                                        </div>-->
                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
            tippy('#information', {
                content: '<p>Select Property with their options, View Total Units, Occupied, Booked and Vacant Properties with Red, Green and Orange color labels. </p>\n\
             ',
                allowHTML: true,
                hideOnClick: true,
                trigger: 'click',
                onShow: function (reference) {
                    setTimeout(function () {
                        reference.hide();
                        reference.reference.blur(); // for a second touch opening, lose focus
                    }, 30000);
                }
            });
        </script>
        <script>
            $('.datepicker1').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,

                //  container: '.pick1'
            }).datepicker('update', new Date());

//            let arr = [
//                {units: 1, unitName: 'First Unit', unitAvailable: "Occupied"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//                {units: 1, unitName: 'First Unit', unitAvailable: "Occupied"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//                {units: 1, unitName: 'First Unit', unitAvailable: "Occupied"},
//                {units: 1, unitName: 'First Unit', unitAvailable: "Occupied"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 1, unitName: 'First Unit', unitAvailable: "Occupied"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
//                {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
//            ];
//            arr.forEach((el) => {
//                var newEl = document.createElement('p');
//                newEl.className = 'numberDiv';
//                newEl.id = el.unitAvailable;
//                newEl.innerHTML = '<span>' + el.unitName + ' ' + el.units + '</span>';
////                document.getElementById("boxesContainer").append(newEl);
//            })

            //            $(function () {
//                $(".numberDiv").on('click', function ($this) {
//                    if ($(this).attr('id') == 'Vacant') {
//                        swal({
//                            title: "Do you wish to continue booking this unit?",
//                            icon: "warning",
//                            buttons: true,
//                            dangerMode: true,
//                        })
//                                .then((willDelete) => {
//                                    window.location.href = '../tenant/bookingManagmentForm.htm';
//                                });
//
//                    }
//                    if ($(this).attr('id') == 'Occupied') {
//                        swal({
//                            title: "Currently this unit is occupied.",
//                            text: "The current contract ends on 19/02/2022. Do you wish to continue booking ?",
//                            icon: "warning",
//                            buttons: true,
//                            dangerMode: true,
//                        })
//                                .then((willDelete) => {
//                                    if (willDelete) {
//                                        window.location.href = '../tenant/bookingManagmentForm.htm';
//                                    } else {
//
//                                    }
//                                });
//
//                    }
//                })
//            })



//            $(function () {
//                $(".numberDiv").on('click', function ($this) {
//                    if ($(this).attr('id') == 'Vacant') {
//
//                        swal({
//                            text: "Do You Wish to Create?",
//                            //icon: "warning",
//                            input: 'radio',
//                            buttons: true,
//                            buttons: {
//
//                                Enquiry: {
//                                    text: "Enquiry"
//                                },
//                                Quotation: {
//                                    text: "Quotation"
//                                },
//
//                                Booking: {
//                                    text: "Booking"
//                                },
//                                cancel: "Cancel",
//                            },
//                            dangerMode: true,
//                        }).then((value) => {
//                            switch (value) {
//
//                                case "Enquiry":
//                                    location.href = "../tenant/newEnquiryForm.jsp";
//                                    break;
//
//                                case "Quotation":
//                                    location.href = "../tenant/bookingDetailsForm.htm";
//                                    break;
//
//                                case "Booking":
//                                    location.href = "../tenant/bookingManagmentForm.htm";
//                                    break;
//                                default:
//
//                            }
//                        });
//
//
//
//                    }
//                    if ($(this).attr('id') == 'Occupied') {
//                        swal({
//                            title: "This unit is already Occupied/Booked.",
//                            text: "Do you wish to Continue Enquiry?",
//                            icon: "warning",
//                            buttons: true,
//                            dangerMode: true,
//                        })
//                                .then((willDelete) => {
//                                    if (willDelete) {
//                                        window.location.href = '../tenant/newEnquiryForm.jsp';
//                                    } else {
//
//                                    }
//                                });
//
//                    }
//
//                    if ($(this).attr('id') == 'Booked') {
//                        swal({
//                            title: "This unit is already Occupied/Booked.",
//                            text: "Do you wish to Continue Enquiry?",
//                            icon: "warning",
//                            buttons: true,
//                            dangerMode: true,
//                        })
//                                .then((willDelete) => {
//                                    if (willDelete) {
//                                        window.location.href = '../tenant/newEnquiryForm.jsp';
//                                    } else {
//
//                                    }
//                                });
//
//                    }
//                })
//            })




        </script>
        <script>
            function sendEmail(tC, Mail) {
                alert(tC);
                alert(Mail);
                window.location.href = "../tenant/sendBookingEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
            }

            function sendSMS(tC, Sms) {
                alert(tC);
                alert(Sms);
                window.location.href = "../tenant/bookingSendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
            }

            NProgress.done();

//            $("#doctype").change(function () {
//                var budgetCategory = document.getElementById('doctype').value;
//
//                // Clear previous data in the boxesData container
//                $("#boxesContainer").empty();
//
//                $.ajax({
//                    type: "POST",
//                    url: '../tenant/fetchPropertyDetails.htm',
//                    data: {
//                        budgetCategory: budgetCategory
//                    },
//                    success: function (data) {
//                        console.log(data);
//                        data = data.split("/@");
//                        var len = data.length - 1; // Subtract 1 to exclude the count value itself
//
//                        // Create a new HTML content for the Property_count div element
//                        var newContent = '<img title="Total Units" class="mt-4" src="../common/images/4.png"><br>' + len;
//
//                        // Update the content of the Property_count div element
//                        $("#Property_count").html(newContent);
//                    },
//                    error: function (xhr, status, error) {
//                        // Handle the error if the AJAX request fails
//                        console.error(error);
//                    }
//                });
//
//                $("#Vacant_count").empty();
//                $.ajax({
//                    type: "POST",
//                    url: '../tenant/fetchVacantPropertyDetails.htm',
//                    data: {
//                        budgetCategory: budgetCategory
//                    },
//                    success: function (data) {
//                        console.log(data);
//                        data = data.split("/@");
//                        var vacantlen = data.length - 1; // Subtract 1 to exclude the count value itself
//
//                        var boxesData = document.getElementById("boxesContainer");
//                        for (var i = 0; i < vacantlen; i++) {
//                            // Red color - vacant
//                            var vacantDetails = document.createElement("div");
//                            //vacantDetails.classList.add("col-lg-3");
//                            vacantDetails.innerHTML = "<div class='numberDiv' id='Vacant'>" + data[i] + "</div>";
//
//                            boxesData.appendChild(vacantDetails);
//                        }
//
//                        // Create a new HTML content for the Vacant_count div element
//                        var newVacant = '<img title="Total Units" class="mt-4" src="../common/images/1.png"><br>' + vacantlen;
//
//                        // Update the content of the Vacant_count div element
//                        $("#Vacant_count").html(newVacant);
//                    },
//                    error: function (xhr, status, error) {
//                        // Handle the error if the AJAX request fails
//                        console.error(error);
//                    }
//                });
//
//                $("#booked_count").empty();
//                $.ajax({
//                    type: "POST",
//                    url: '../tenant/fetchBookedPropertyDetails.htm',
//                    data: {
//                        budgetCategory: budgetCategory
//                    },
//                    success: function (data) {
//                        console.log(data);
//                        data = data.split("/@");
//                        var bookedlen = data.length - 1; // Subtract 1 to exclude the count value itself
//
//                        var boxesData = document.getElementById("boxesContainer");
//                        for (var i = 0; i < bookedlen; i++) {
//                            // Yellow color - booked
//                            var bookedDetails = document.createElement("div");
//                            //bookedDetails.classList.add("col-lg-3");
//                            bookedDetails.innerHTML = "<div class='numberDiv' id='Booked'>" + data[i] + "</div>";
//
//                            boxesData.appendChild(bookedDetails);
//                        }
//
//                        // Create a new HTML content for the booked_count div element
//                        var newBooked = '<img title="Total Units" class="mt-4" src="../common/images/3.png"><br>' + bookedlen;
//
//                        // Update the content of the booked_count div element
//                        $("#booked_count").html(newBooked);
//                    },
//                    error: function (xhr, status, error) {
//                        // Handle the error if the AJAX request fails
//                        console.error(error);
//                    }
//                });
//
//
//
//                $("#occupied_count").empty();
//                $.ajax({
//                    type: "POST",
//                    url: '../tenant/fetchOccupiedPropertyDetails.htm',
//                    data: {
//                        budgetCategory: budgetCategory
//                    },
//                    success: function (data) {
//                        console.log(data);
//                        data = data.split("/@");
//                        var occupiedlen = data.length - 1; // Subtract 1 to exclude the count value itself
//
//                        var boxesData = document.getElementById("boxesContainer");
//                        for (var i = 0; i < occupiedlen; i++) {
//                            // Yellow color - Occupied
//                            var occupiedDetails = document.createElement("div");
//                            //OccupiedDetails.classList.add("col-lg-3");
//                            occupiedDetails.innerHTML = "<div class='numberDiv' id='Occupied'>" + data[i] + "</div>";
//
//                            boxesData.appendChild(occupiedDetails);
//                        }
//
//                        // Create a new HTML content for the occupied_count div element
//                        var newoccupied = '<img title="Total Units" class="mt-4" src="../common/images/1.png"><br>' + occupiedlen;
//
//                        // Update the content of the occupied_count div element
//                        $("#occupied_count").html(newoccupied);
//                    },
//                    error: function (xhr, status, error) {
//                        // Handle the error if the AJAX request fails
//                        console.error(error);
//                    }
//                });
//            });



$(function () {
   $(".numberDiv").on('click', function () {
    if ($(this).attr('id') == 'Vacant') {
      swal({
        text: "Do You Wish to Create?",
        input: 'radio',
        buttons: {
          Enquiry: { text: "Enquiry" },
          Quotation: { text: "Quotation" },
          Booking: { text: "Booking" },
          cancel: "Cancel"
        },
        dangerMode: true,
      }).then((value) => {
        switch (value) {
          case "Enquiry":
            location.href = "../tenant/newEnquiryForm.jsp";
            break;
          case "Quotation":
            location.href = "../tenant/bookingDetailsForm.htm";
            break;
          case "Booking":
            location.href = "../tenant/bookingManagmentForm.htm";
            break;
          default:
            break;
        }
      });
    }

    if ($(this).attr('id') == 'occupied' || $(this).attr('id') == 'Booked') {
      swal({
        title: "This unit is already Occupied/Booked.",
        text: "Do you wish to Continue Enquiry?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willDelete) => {
        if (willDelete) {
          window.location.href = '../tenant/newEnquiryForm.jsp';
        } else {
          // Handle the cancellation
        }
      });
    }
  }); // <-- Missing closing parenthesis for .on('click', function () {
});


$("#doctype").change(function () {
  var budgetCategory = document.getElementById('doctype').value;

  $("#boxesContainer").empty();

  $.ajax({
    type: "POST",
    url: '../tenant/fetchPropertyDetails.htm',
    data: {
      budgetCategory: budgetCategory
    },
    success: function (data) {
      console.log(data);
      data = data.split("/@");
      var len = data.length - 1;

      var newContent = '<img title="Total Units" class="mt-4" src="../common/images/4.png"><br>' + len;
      $("#Property_count").html(newContent);
    },
    error: function (xhr, status, error) {
      console.error(error);
    }
  });
$("#Vacant_count").empty();
$.ajax({
  type: "POST",
  url: '../tenant/fetchVacantPropertyDetails.htm',
  data: {
    budgetCategory: budgetCategory
  },
  success: function (data) {
    console.log(data);
    data = data.split("/@");
    var vacantlen = data.length - 1;

    var boxesData = document.getElementById("boxesContainer");
    for (var i = 0; i < vacantlen; i++) {
      var vacantDetails = document.createElement("div");
      vacantDetails.innerHTML = "<div class='numberDiv' onClick='navigateToProp(event)' id='Vacant'>" + data[i] + "</div>";
      boxesData.appendChild(vacantDetails);
    }

    var newVacant = '<img title="Total Units" class="mt-4" src="../common/images/1.png"><br>' + vacantlen;
    $("#Vacant_count").html(newVacant);

    // Display an alert
//    alert("AJAX request succeeded!");
  },
  error: function (xhr, status, error) {
    console.error(error);
  }
});


  $("#booked_count").empty();
  $.ajax({
    type: "POST",
    url: '../tenant/fetchBookedPropertyDetails.htm',
    data: {
      budgetCategory: budgetCategory
    },
    success: function (data) {
      console.log(data);
      data = data.split("/@");
      var bookedlen = data.length - 1;

      var boxesData = document.getElementById("boxesContainer");
      for (var i = 0; i < bookedlen; i++) {
        var bookedDetails = document.createElement("div");
        bookedDetails.innerHTML = "<div class='numberDiv' onClick='navigateToProp(event)' id='Booked'>" + data[i] + "</div>";
        boxesData.appendChild(bookedDetails);
      }

      var newBooked = '<img title="Total Units" class="mt-4" src="../common/images/3.png"><br>' + bookedlen;
      $("#booked_count").html(newBooked);
    },
    error: function (xhr, status, error) {
      console.error(error);
    }
  });

  $("#occupied_count").empty();
  $.ajax({
    type: "POST",
    url: '../tenant/fetchOccupiedPropertyDetails.htm',
    data: {
      budgetCategory: budgetCategory
    },
    success: function (data) {
      console.log(data);
      data = data.split("/@");
      var occupiedlen = data.length - 1;

      var boxesData = document.getElementById("boxesContainer");
      for (var i = 0; i < occupiedlen; i++) {
        var occupiedDetails = document.createElement("div");
        occupiedDetails.innerHTML = "<div class='numberDiv' onClick='navigateToProp(event)' id='Occupied'>" + data[i] + "</div>";
        boxesData.appendChild(occupiedDetails);
      }

      var newoccupied = '<img title="Total Units" class="mt-4" src="../common/images/1.png"><br>' + occupiedlen;
      $("#occupied_count").html(newoccupied);
    },
    error: function (xhr, status, error) {
      console.error(error);
    }
  });
});


function navigateToProp(event){
//.000

/* inputOptions can be an object or Promise */

    console.log("event", event.target.id);
    const propertyVal = event.target.id;
    
    if (propertyVal == 'Vacant') {
      const inputOptions = new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            'Enquiry': 'Enquiry',
            'Quotation': 'Quotation',
            'Booking': 'Booking'
          })
        }, 1000)
      })

      Swal.fire({
        title: 'Do You Wish to Create',
        input: 'radio',
        inputOptions: inputOptions,
        showCancelButton: true,
        inputValidator: function(result) {
          return new Promise(function(resolve, reject) {
              console.log("result", result)
            if (result) {
              resolve();
            } else {
              reject('You need to select something!');
            }
          });
        },
        inputValidator: (value) => {
        if (!value) {
          return 'You need to choose something!'
        }
      }
      }).then(function(result) {
//          console.log(result);
          const value = result.value;
        switch (value) {
          case "Enquiry":
            location.href = "../tenant/newEnquiryForm.jsp";
            break;
          case "Quotation":
            location.href = "../tenant/bookingDetailsForm.htm";
            break;
          case "Booking":
            location.href = "../tenant/bookingManagmentForm.htm";
            break;
          default:
            break;
        }
      });
    }
    
    if (propertyVal == 'Occupied' || propertyVal == 'Booked') {
      Swal.fire({
        title: "This unit is already Occupied/Booked.",
        text: "Do you wish to Continue Enquiry?",
        icon: "warning",
        showDenyButton: true,
  confirmButtonText: 'Yes',
  denyButtonText: `No`,
        dangerMode: true,
      }).then((willDelete) => {
          console.log("willDelete", willDelete)
        if (willDelete.isConfirmed) {
          window.location.href = '../tenant/newEnquiryForm.jsp';
        } else if (willDelete.isDenied) {
          // Handle the cancellation
        }
      });
    }

}

        </script>
        
<!--          <script src="../common/theme/js/custom.js"></script>-->
          
            <!-- SweetAlert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">

    </body>

</html>