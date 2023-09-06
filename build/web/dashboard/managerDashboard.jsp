<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <!-- Meta, title, CSS, favicons, etc. -->
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
                        <title>Arete Iconic</title>
                        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16"> 
                          <style>

.graph-container {
background-color: #ffff;
/*    box-shadow: 0px 0px 10px 0px rgb(93 94 94 / 78%);*/
border-radius:25px;
padding: 5px;
}

body{
overflow-x:hidden;
}
.numberDiv{
    height: 120px;/*
    width: 170px;*/
    justify-content: center;
    align-items: center;
    display: flex;
    color: #ffffff;
    font-size: 20px;
    text-align: center;
    font-family:Verdana, Geneva, Tahoma, sans-serif;
    margin-bottom: 0;
    border: 2px solid black;
}
#boxesContainer{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
}

#Occupied{
    background-color: #198754;
    cursor: pointer;
}
#Vacant{
    background-color: #dc3545; 
    cursor: pointer;
}
#Booked{
   background-color: #ffc107; 
   cursor: pointer;
}
.redClass{
    background-color: #dc3545;
}
.greenClass{
    background-color: #198754;
}
.yellowClass{
    background-color: #ffc107;
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
</style>


<style>
@media print {
#sidetest {
display:none;
width:0;
}
}
    .scrollabletable{
        height:180px; width:50%;
        overflow-y: auto;
        border:2px solid #444;
    }
    .boxes{
        margin: auto;
        width: 250px;
        text-align: center;
        border-radius: 10px;
        color: #37414d;
        margin-bottom: 30px;
    }
    .boxes p{
        font-size: 20px;
        font-weight: bold;
    }
    .boxes .number-round{
        border-radius: 50px;
        border: 1px solid #37414d;
        padding: 5px;
        text-size: 16px;
        position: relative;
        bottom: 40px;
    }
    .boxes .number-box{
        border-radius: 10px;
        border: 1px solid #37414d;
        padding: 5px;
        font-size: 20px;
        font-weight: bold;
    }
    .box-1{
        
        border: 4px solid #01a65a;
    }
    .box-2{
        border: 4px solid #e7da4d;
    }
    .box-3{
        border: 4px solid #f25c2a;
    }
    .box-4{
        border: 4px solid #c01f31;
    }
    .box-5{
        border: 4px solid #01c1ee;
    }
    .box-6{
        border: 4px solid #2796ce;
    }
    
    .chart-container {
        position: relative;
        margin: auto;
        height:30vh; 
        width:45vw
      }
      
      @media screen and (max-width: 600px){
          .height-fro-mobile{
        overflow-y: auto !important;
    }
          #allproperties{
      overflow-x: auto !important;
    
}
          .chart-container {
                position: relative;
                margin: auto;
                height:45vh; 
                width:100%;
              }
                .cardss {
           flex-wrap: wrap;
               justify-content: center !important;

        }
         .cardss div{
             margin : 10px 0;
         }
    
       
      }

.dashboard-container {
height: 179px;
width: 115%;
border-radius: 10px;
}

.top-block {
font-size: 14px;
text-align: center;
margin-bottom: 10px;
font-weight: bold;
position: relative;
display: block;
line-height: 22px;
border-radius: 15px;
text-shadow: 0 0 1px #ddd;
text-decoration: none;
-webkit-box-shadow: 0px 0px 10px 0px rgb(67 153 135 / 78%);
box-shadow: 0px 0px 10px 0px rgb(93 94 94 / 78%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#331e5799', endColorstr='#007db9e8', GradientType=0);
background-color: #F7F7F7;
color: black;
}
#container {

height: 564px;

}

.highcharts-figure, .highcharts-data-table table {
min-width: 360px; 
max-width: 600px;
margin: 1em auto;
}

.highcharts-data-table table {
font-family: Verdana, sans-serif;
border-collapse: collapse;
border: 1px solid #EBEBEB;
margin: 10px auto;
text-align: center;
width: 100%;
max-width: 500px;
}
.highcharts-data-table caption {
padding: 1em 0;
font-size: 1.2em;
color: #555;
}
.highcharts-data-table th {
font-weight: 600;
padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
background: #f1f1f1;
}
.highcharts-data-table tr:hover {
background: #f1f1f1;
}
.highcharts-credits, .highcharts-exporting-group {
display: none !important;
}
.highcharts-background {
background-color: #f1f1f1 !important;
}
.highcharts-title {
font-size: 20px !important;
font-weight: 700 !important;
font-family: "Roboto"
}

.highcharts-background {
fill: transparent !important;
}

.highcharts-a11y-proxy-container {
display: none !important;
}.top-block .top-block-1 {
background-color: #37414d !important;
height: 27px;
border-radius: 10px 10px 0 0;
}
.top-block .top-block-2{
            padding: 5px 5px;
            color:black;
            line-height: 2em;
            height:200px;
            width:320px;
            background:white !important;
            border-radius: 15px;
        }
.card {
-webkit-box-shadow: 0px 0px 10px 0px rgb(67 153 135 / 78%);
box-shadow: 0px 0px 10px 0px rgb(93 94 94 / 50%) !important;
}
@media print {
.right-sidebar {
margin-left: 0 !important;;
}

}
            @media screen and (max-width: 480px) {
            #mbresponsive {
                height: 350px;
                display: block;
            }
            }
                 @media screen and (max-width: 768px) {
            #mbresponsive {
                height: 190px;
                display: block;
            }
            #two{
                height: 190px;
                display: block; 
            }
            }
         
              @media screen and (max-width: 1140px) {
            #mbresponsive {
                height: 228px;
                display: block;
            }
            }
                @media screen and (max-width: 920px) {
            #mbresponsive {
                height: 200px;
            }
             #two{
                height: 200px;
            }
            }
.top-tiles{
border-radius: 15px !important;
width: 400px;
height: 200px;
background-color: #f2f2f2;
background-size: cover;
}
/* .top-tiles-heading{
font-size: 22px;
font-weight: bold;
}
.top-tiles-colon{
font-size: 21px; font-weight: 600; margin: 0 5px; margin-bottom: 0;
} */
.table {
border:none;
/* border-radius:10px !important; */
/* -webkit-box-shadow: 0px 0px 10px 0px rgb(67 153 135 / 78%);
box-shadow: 0px 0px 10px 0px rgb(93 94 94 / 50%); */
}
.roweach{
line-height: 2rem;
}

.fc-unthemed td.fc-today{
    background: #314c68 !important;
    color:white !important;
}
.fc-day-header{
    background : #7facdb !important;
    color:white !important;
}
#allproperties{
    height: 165px;
    width: 100%;
    
}
#Selectprop{
   height: 50px;
   width: 150px;
   margin: 0;
   padding: 0;
      border: 2px solid black;
}
</style>
<!--<style>
    h4 {
        font-size: 15px;
        font-weight: 200;
        font-family: 'Open Sans', sans-serif;
        text-shadow: 1px 0px #444444;
}

</style>-->
                    </head>
                    

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

        <jsp:include page="../login/footer.jsp" />

                          <main id="main" class="main" style="background-color:white;">
    <div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> <title>JSP Page</title>
<!--        <div class="row landingHeading">
            <div class="py-2 mx-auto" style="background-color: #314c68; color: #fff; border-radius: 10px;width:98%;">
                <h3 class="text-center mb-0">DASHBOARD OF MANAGER / EXECUTIVE USER</h3>
            </div>
        </div>
        <br />-->
        <!-- <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../NiceAdmin2/amcManagementForm.html"><i class="bi bi-plus"></i>Create New Record</a>
        </div> -->

    </div>

    <section class="section mt-3">
        <div class="container-fluid salesDownload" id="salesDownload" >
            <div class=" ml-1 mb-2 mr-3 pt-1"style="">
                 <h3>All Properties</h3>
                <div class="row mt-2 mx-auto p-2 card" id="allproperties">
                   
                       <div class="text-center bg-body p-2 rounded mx-2 mb-2" data-toggle="tooltip" style="height:150px !important;width:173px !important;border-radius:50% !important;border:4px solid #314c68 !important;">
                           <a data-toggle="tooltip" title="Total Properties"><img class="mt-4" src="../common/theme/images/total-properties.png"></a>
                           <h5 class="mt-3">5</h5>
                       </div>
                       <div class="text-center bg-body p-2 rounded mx-2 mb-2" data-toggle="tooltip" style="height:150px !important;width:173px !important;border-radius:50% !important;border:4px solid #314c68 !important;" >
                           <a data-toggle="tooltip" title="Total Rental Units"><img class="mt-4" src="../common/theme/images/total-rental.png"></a>
                           <h5 class="mt-3">250</h5>
                       </div>
                       <div class="text-center bg-body p-2 rounded mx-2 mb-2" data-toggle="tooltip" style="height:150px !important;width:173px !important;border-radius:50% !important;border:4px solid #314c68 !important;">
                           <a data-toggle="tooltip" title="Occupied"><img class="mt-4" src="../common/theme/images/occupied.png"></a>
                           <h5 class="mt-3">170</h5>
                       </div>
                       <div class="text-center bg-body p-2 rounded mx-2 mb-2" data-toggle="tooltip" style="height:150px !important;width:173px !important;border-radius:50% !important;border:4px solid #314c68 !important;">
                           <a data-toggle="tooltip" title="Booked"><img class="mt-4" src="../common/theme/images/booked.png"></a>
                           <h5 class="mt-3">20</h5>
                       </div>
                       <div class="text-center bg-body p-2 rounded mx-2 mb-2" data-toggle="tooltip" style="height:150px !important;width:173px !important;border-radius:50% !important;border:4px solid #314c68 !important;">
                           <a data-toggle="tooltip" title="Vacant"><img class="mt-4" src="../common/theme/images/vacancy.png"></a>
                           <h5 class="mt-3">10</h5>
                       </div>

                       
                       <!-- <div class="bg-body shadow p-2 rounded mx-3" data-toggle="tooltip" style="height:150px !important;width:343px !important" title="Task Reminder">
                           <a class="btn btn-outline-primary btn-sm ms-1 border-0 mt-5 mx-5" data-toggle="tooltip" data-placement="top" title="Task Reminder" href="#"> <i class="fa fa-bell fa-3x"></i></a>
                           <a class="btn btn-outline-primary btn-sm ms-1 border-0 mt-5 mx-5" data-toggle="tooltip" data-placement="top" title="Allocate Task" href="#"> <i class="fa fa-bars fa-3x"></i></a>
                           <a class="btn btn-outline-primary btn-sm ms-1 border-0 mt-5 mx-5" data-toggle="tooltip" data-placement="top" title="Add Task" href="#"> <i class="fa fa-plus-circle fa-3x"></i></a>
                       </div> -->
                   </div>
                
      <div class="modal fade modal-md" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Unit Dashboard</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="col-lg-4 mx-auto d-flex justify-content-between">
                                                <div>
                                                    <span class="redClass">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    Vacant
                                                </div>
                                                <div>
                                                    <span class="greenClass">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    Occupied
                                                </div>
                                                <div>
                                                    <span class="yellowClass">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                    Vacant
                                                </div>
                                               
                                        </div>
                                        <div class="col-lg-12 my-4" id="boxesContainer">
                                            
                                        </div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>          
                
                <div class="modal fade modal-md" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Unit Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <ul class="list-group">
            <li class="list-group-item">Al raid Boulevard</li>
            <li class="list-group-item">Flat no 121</li>
            <li class="list-group-item">First Floor</li>
            <li class="list-group-item">Status- Occupied</li>
            <li class="list-group-item">Tenant Name - Riaz Mohammed</li>
            <li class="list-group-item">Total Rental Area - 1000 SQM</li>
            <li class="list-group-item">Utilities - Electricity, Water and Gas</li>
            <li class="list-group-item">Rent - 400 (OMR)</li>
          </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>          
<div class="row mt-2 mx-auto">
<div class="col-md-4 px-2" >
<div class="card col-md-12" style="background-color: #fff;border-radius:10px; height: 310px;">
   
    <i style="color:#314c68;" class="fa fa-building fa-2x mt-2 px-2" onclick="showDashboard(event)" tooltip="Click here to view units"></i>
     <div class="col-md-12 px-2 mt-2" style="height: 203px !important;">
          <div class="row">
                    <div class="form-floating mb-1">
                        <select id="utilityArea" name="utilityArea" required="" class="form-select">
                            <option value="" disabled="" selected="">Select your option</option>
                            <option value="Common">Common</option>
                            <option value="Shared">Shared</option>
                        </select>
                        <label class="control-label">Select Property</label>
                    </div>
                   </div>
   <table id="example" class="table table-bordered"  cellspacing="0">
       <tbody style="color:black;">
           <tr>
               <td class="center roweach">Total Units<span style="float:right;">50</span></td>
           </tr>
           <tr>
               <td class="center roweach">Occupied<span style="float:right;">45</span></td>
           </tr>
           <tr>
            <td class="center roweach">Booked<span style="float:right;">24</span></td>
        </tr>
        <tr>
            <td class="center roweach">Vacant<span style="float:right;">10</span></td>
        </tr>
       </tbody>
   </table>
        </div>
</div>
</div>  
           
<div class="col-md-4 px-2">
    <div class="card col-md-12" style="background-color: #fff;border-radius:10px; height: 310px;">
        <a data-toggle="tooltip" title="DASHBOARD">
                <div class="top-block-2" style="height:200px !important;">
                    <div class="text-center mt-5">
                        <h5 class="text-center mt-2" style="font-size:20px;color:#737373 !important;"><b>Net Income</b></h5>
                    </div>
                    <div class="text-center mt-4">
                        <h6>Revenue : OMR 500000</h6>
                    </div>
                    <div class="text-center">
                        <h6>Total Cost : OMR 500000</h6>
                    </div>
                    
                </div>
        </a>
    </div>
</div>    

<div class="col-md-4 px-2">
    <div class="card col-md-12" style="background-color: #fff;border-radius:10px; height: 310px;">
    <h5  class="text-center mt-4" style="font-size:20px;color:#737373 !important;"><b>Property Document Status</b></h5>
    <div  class="col-md-12 px-1" style="overflow-y:scroll;overflow-x:scroll; max-height: 195px !important;">
   <table id="example" class="table table-bordered" cellspacing="0">
       <thead>
           <tr class="headings">
               <th>Property Name</th>
               <th>Document/ License Name</th>
               <th>Expiry Date</th>

           </tr>
       </thead>
       <tbody>
           <tr>
               <td class="center roweach">Al raid</td>
               <td class="center roweach">Fire safety</td>
               <td class="center roweach">10/02/2022</td>
           </tr>
           <tr>
               <td class="center roweach">Al raid</td>
               <td class="center roweach">Fire safety</td>
               <td class="center roweach">10/02/2022</td>
           </tr>
       </tbody>
   </table>
   
</div>
    </div>
</div>  

</div>

                 <div class="row mt-3 mx-auto" >
    <div class="px-2 col-md-4" >
        <div class="col-md-12" >
                                <div class="card graph-container" style="border-radius:10px;"id="mbresponsive" >   
                                    <h5 class="text-center mt-2" style="font-size:20px;color:#737373 !important;"><b>Property Category</b></h5>
                             <div class="row mt-2 mx-3 height-fro-mobile" style="height: 150px;">
                                <div class="col-md-6">
                                    <div class="row">
                                     <div class="col-md-12 text-white text-center my-auto" style="background-color: #05192e;height: 90px;display: flex;  justify-content: center; align-items: center;flex-direction: column;">
                                         <p style="margin-top: 15px;">50<br>
                                         <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Residential</p>
                                    </div>
                                    <div class="col-md-12 text-white  text-center my-auto" style="background-color:#314c68;height: 50px;display: flex;  justify-content: center; align-items: center;">
                                      <p style="margin-top: 10px;">30<br> 
                                       <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Commercial</p>
                                    </div>
                                    </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12 text-white text-center my-auto" style="background-color:#7facdb;height: 140px;display: flex;  justify-content: center; align-items: center;">
                                                    <p>20<br> 
                                                  <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Residential-Commercial</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> </div>
    </div>
    <div class="px-2 col-md-4">  
        <div id="two" class="card col-md-12 mx-1" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="mobileAppDownloadsss" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="px-2 col-md-4">  
        <div id="two" class="card col-md-12 mx-2" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="mobileAppDownloads" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
</div>

<div class="row mt-2 mx-auto">
    <div class="px-2 col-md-4">  
        <div class="card col-md-12" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="speedChart" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="px-2 col-md-4">  
        <div class="card col-md-12 mx-1" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="speedChart1" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="px-2 col-md-4">  
        <div class="card col-md-12 mx-2" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="speedChart2" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
</div>
<div class="row mt-2 mx-auto">
    <div class="col-md-5 px-0 calendar_container">
        <div class="card col-md-9 mx-2" style="border-radius:10px;" >
            <h5 class="text-center mt-2" style="font-size:15px;color:#737373 !important;"><b>Upcoming AMC</b></h5>
            <div class="mt-2 mx-1 card" id="calendar" style="font-size: 13px;"> 
            
        </div>
        </div> 
    </div>
</div>  
</div>
                

</div>
</div>
    </section>
</main>

        
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/3.0.20/autosize.min.js" integrity="sha512-EAEoidLzhKrfVg7qX8xZFEAebhmBMsXrIcI0h7VPx2CyAyFHuDvOAUs9CEATB2Ou2/kuWEDtluEVrQcjXBy9yw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta1/html2canvas.svg.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js" integrity="sha512-/n/dTQBO8lHzqqgAQvy0ukBQ0qLmGzxKhn8xKrz4cn7XJkZzy+fAtzjnOQd5w55h4k1kUC+8oIe6WmrGUYwODA==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/funnel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" integrity="sha512-KXkS7cFeWpYwcoXxyfOumLyRGXMp7BTMTjwrgjMg0+hls4thG2JGzRgQtRfnAuKTn2KWTDZX4UdPg+xTs8k80Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery.min.js'></script>
<script src="http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
<script>
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    
    var cal = $('#calendar').fullCalendar({
        dayClick: function(date, allDay, jsEvent, view) {
            if (allDay) {
                alert('Clicked on the entire day: ' + date);
            }else{
                alert('Clicked on the slot: ' + date);
            }
            
            // change the day's background to highlight the fact that its been clicked
            $(this).css('background-color', 'red');
            
            // Now create a new event for this clicked day
            var myEvent = {
              title:"my new event",
              allDay: true,
              start: date,
              end: date
            };
            cal.fullCalendar( 'renderEvent', myEvent );
            
        },
        events: [
    //        {
    //            title: 'All Day Event',
    //            start: new Date(y, m, 1)
    //        },
    //        {
    //            title: 'Long Event',
    //            start: new Date(y, m, d-5),
    //            end: new Date(y, m, d-2)
    //        },
    //        {
    //            id: 999,
    //            title: 'Repeating Event',
    //            start: new Date(y, m, d-3, 16, 0),
    //            allDay: false
    //        },
            {
                id: 999,
                title: 'boulevard garden',
                //start: new Date(y, m, d+4, 16, 0),
                start: new Date(y, m, d+3, 16, 0),
                allDay: false
            },
            {
                title: 'power check',
                start: new Date(y, m, d+6),
                allDay: false
            },
    //        {
    //            title: 'Lunch',
    //            start: new Date(y, m, d, 12, 0),
    //            end: new Date(y, m, d, 14, 0),
    //            allDay: false
    //        },
    //        {
    //            title: 'Birthday Party',
    //            start: new Date(y, m, d+1, 19, 0),
    //            end: new Date(y, m, d+1, 22, 30),
    //            allDay: false
    //        },
    //        {
    //            title: 'Click for Google',
    //            start: new Date(y, m, 28),
    //            end: new Date(y, m, 29),
    //            url: 'http://google.com/'
    //        }
        ]
    });
</script>

<script>
    var ctx = document.getElementById('mobileAppDownloadsss');
    var myChartHr1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["0 - 30", "30 - 60", "60 - 90", "90 - 120", "120 - 180"],
            datasets: [
                {
                    label: "Amount",
                    type: "bar",
                    backgroundColor: ['#05192e', '#0f2740', '#314c68', '#4d7299', '#7facdb'],
                    backgroundColorHover: "#3e95cd",
                    data: [20, 10, 40, 60, 100],
                },
            ],
        },
        options: {
            plugins: {
                datalabels: {
                    display: false,
                },
                labels: [
                    {
                        render: '',
                        fontColor: '#fff',
                        arc: true,
                        position: 'border'
                    },
//    {

                ]
            },
            scales: {
                yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Amount ( OMR )',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            maxTicksLimit: 5,
                            beginAtZero: true

                        }

                    }],
                xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Days',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        barPercentage: 0.8

                    }]
            },
            title: {
                display: true,
                text: 'Aging Payables',
                 fontFamily: "'Nunito', sans-serif",
                fontSize: 20
            },
            legend: {
                display: false
            }
        }
    });
</script>
<script>
    var ctx = document.getElementById('mobileAppDownloads');
    var myChartHr1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["0 - 30", "30 - 60", "60 - 90", "90 - 120", "120 - 180"],
            datasets: [
                {
                    label: "Amount",
                    type: "bar",
                    backgroundColor: ['#05192e', '#0f2740', '#314c68', '#4d7299', '#7facdb'],
                    backgroundColorHover: "#3e95cd",
                    data: [80, 100, 40, 60, 50],
                },
            ],
        },
        options: {
            plugins: {
                datalabels: {
                    display: false,
                },
                labels: [
                    {
                        render: '',
                        fontColor: '#fff',
                        arc: true,
                        position: 'border'
                    },
//    {

                ]
            },
            scales: {
                yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Amount ( OMR )',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            maxTicksLimit: 5,
                            beginAtZero: true

                        }

                    }],
                xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Days',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        barPercentage: 0.8

                    }]
            },
            title: {
                display: true,
                text: 'Aging Receivables',
                 fontFamily: "'Nunito', sans-serif",
                fontSize: 20
            },
            legend: {
                display: false
            }
        }
    });
</script>
<script>
    var config = {
      type: 'horizontalBar',
      data: {
        labels: ["Property 3", "Property 2", "Property 1"],
        datasets: [{
          label: "Invoice Amount",
          backgroundColor: '#05192e',
          data: [7, 3, 10]
        }, {
          label: "Service Charges",
          backgroundColor: '#7facdb',
          data: [3, 9, 20]
        }]
      },
      options: {
        scales: {
          xAxes: [{
            stacked: false,
              gridLines: {
                                drawOnChartArea: false
                            },
                            ticks: {
                            beginAtZero: true

                        }
          }],
          yAxes: [{
            stacked: false,
              gridLines: {
                                drawOnChartArea: false
                            },
                           
          }]
        },
          title: {
                             display: true,
                              text: 'Utilities Tracking',
                               fontFamily: "'Nunito', sans-serif",
                           fontSize: 20
             },
               legend: {
                    display: false,
                    labels: {
                        // This more specific font property overrides the global property
                        defaultFontFamily: "'Nunito', sans-serif"}
                }
      }
    };

    var ctxPayment = document.getElementById("speedChart");
    new Chart(ctxPayment, config);
</script>
<script>
    var ctx = document.getElementById('speedChart1');
    var myChartHr1 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["0 - 30", "30 - 60", "60 - 90", "90 - 120"],
            datasets: [
                {
                    label: "Amount",
                    type: "bar",
                    backgroundColor: ['#05192e', '#314c68', '#4d7299', '#7facdb'],
                    backgroundColorHover: "#3e95cd",
                    data: [80, 100, 40, 60],
                },
            ],
        },
        options: {
            plugins: {
                datalabels: {
                    display: false,
                },
                labels: [
                    {
                        render: '',
                        fontColor: '#fff',
                        arc: true,
                        position: 'border'
                    },
//    {

                ]
            },
            scales: {
                yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Amount ( OMR )',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        ticks: {
                            maxTicksLimit: 5,
                            beginAtZero: true

                        }

                    }],
                xAxes: [{
                        scaleLabel: {
                            display: true,
//                            labelString: 'Expiring Contracts',
                            fontSize: 15,
                            fontStyle: 'bold'
                        },
                        gridLines: {
                            drawOnChartArea: false
                        },
                        barPercentage: 0.8

                    }]
            },
            title: {
                display: true,
                text: 'Expiring Contracts',
                fontFamily: "'Nunito', sans-serif",
                fontSize: 20
            },
            legend: {
                display: false
            }
        }
    });
</script>
<script>
    var ctx1 = document.getElementById('speedChart2');
    var myChartHr6 = new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: ['Rent paid on time', 'With Penalty','Default'],
            datasets: [{
            label: 'rent',
            data: [3,3,2],
            backgroundColor: [
                '#05192e',
                '#314c68',
                '#7facdb'
                
            ],
            borderColor: [
                '#05192e',
                '#314c68',
                '#7facdb'
                
            ],
            borderWidth: 1
        },
    ],
},
options: {
tooltips: {
callbacks: {
label: function (tooltipItem, data) {
    var allData = data.datasets[tooltipItem.datasetIndex].data;
    var tooltipLabel = data.labels[tooltipItem.index];
    var tooltipData = allData[tooltipItem.index];
    var total = 0;
    for (var i in allData) {
        total += allData[i];
    }
    var tooltipPercentage = Math.round((tooltipData / total) * 100);
    return tooltipLabel + ': ' + tooltipData + ' (' + tooltipPercentage + '%)';
    }
    }
},
plugins: {
datalabels: {
        formatter: (value, ctx) => {
            let sum = 0;
            let dataArr = ctx.chart.data.datasets[0].data;
            dataArr.map(data => {
                sum += data;
            });
            let percentage = (value * 100 / sum).toFixed(2) + "%";
            return percentage;
        },
        color: '#fff',
    }
},
        title: {
            display: true,
            text: 'Rent Tracking',
             fontFamily: "'Nunito', sans-serif",
            fontSize: 20
        },
        legend: {
            display: true,
            position: 'right',
            align: "start"    
        }
    }
});

//grid units boxes code starts
let arr = [
                            {units: 1, unitName: 'First floor', unitAvailable: "Occupied"}, 
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"}, 
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"}, 
                            {units: 1, unitName: 'First floor', unitAvailable: "Occupied"}, 
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
                            {units: 1, unitName: 'First floor', unitAvailable: "Occupied"}, 
                            {units: 1, unitName: 'First floor', unitAvailable: "Occupied"}, 
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 1, unitName: 'First floor', unitAvailable: "Occupied"},
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 23, unitName: 'Test Unit', unitAvailable: "Booked"},
                            {units: 12, unitName: 'Test Unit', unitAvailable: "Vacant"},
                        ];
                arr.forEach((el) => {
                    var newEl = document.createElement('p');
                    newEl.className = 'numberDiv';
                    newEl.id = el.unitAvailable;
                    newEl.innerHTML= '<span onclick="showDashboardDetils(event)">'+el.unitName+'<br>'+el.units+'</span>';
                    document.getElementById("boxesContainer").append(newEl);
                })
                
                function showDashboard(event){
                    var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
                                        
                                          myModal.show();
                }
                
                function showDashboardDetils(event){
                    var myModal2 = new bootstrap.Modal(document.getElementById("exampleModal2"), {});
                                        
                                          myModal2.show();
                }
</script>

 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Access information related to Total Properties, Total Rental Units, Occupied, Booked and Vacant Properties. Select Common or Shared Properties to view them in detail. Glance through Property Document Status, Property Category, Aging Payables, Aging Receivables, Utilities Tracking, Contract Expiry, Rent Tracking, and Upcoming AMCs  month wise. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        </script>
</body>

</html>