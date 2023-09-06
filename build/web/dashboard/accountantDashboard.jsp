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
max-height: 240px !important;
min-height: 240px !important;
}
@media print {
.right-sidebar {
margin-left: 0 !important;;
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
.table>:not(caption)>*>*{
  padding: 0.2rem 0.2rem !important;
}
.roweach{
line-height: 2rem;
}

.fc-unthemed td.fc-today{
    background: #314c68 !important;
    color:white !important;
}
@media screen and (max-width: 600px){
    .table>:not(caption)>*>* {
    padding: 0.02rem 0.2rem !important;
}
    .height-fro-mobile{
       overflow-y: auto !important;
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
                .width-fro-mobile {
                    width: 100% !important;
                    padding : 0 0 0 0 !important;
                }
                 .height-fro-mobile {
                    height: fit-content !important;
                }
                .invoicecard-mobileview{
                    display: block !important;
                }
               
            }
               .invoicecard-mobileview{
                    display: flex;
                }
            .topBlock{
                width: 100%;
                height: 128px;
                background-size: cover;
                border: none;
                background-color: #f2f2f2;
            }
            .topBlock h4{
                font-weight: bold;
                color: #000000;
            }
            .block-1{
                background-image: url(../common/theme/assets/img/expenseicon/1.png);
            }
            .block-2{
                background-image: url(../common/theme/assets/img/expenseicon/2.png);
            }
            .block-3{
                background-image: url(../common/theme/assets/img/expenseicon/3.png);
            }
            .block-4{
                background-image: url(../common/theme/assets/img/expenseicon/4.png);
            }
/*            .row>*{
                width: 173px !important;
            }*/
</style>
                    </head>
                    

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
<jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main" style="background-color:white;">
    <div>
<!--        <div class="landingHeading">
            <div class="py-2 mx-auto" style="background-color: #314c68; color: #fff; border-radius: 10px;width:98%;">
                <h3 class="text-center mb-0">DASHBOARD OF ACCOUNTANT</h3>
            </div>
        </div>
        <br />
         <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../NiceAdmin2/amcManagementForm.html"><i class="bi bi-plus"></i>Create New Record</a>
        </div> -->    
    </div>

    <section class="section mt-3">
        <div class="container-fluid salesDownload" id="salesDownload" >
           
            <div class="mb-2 pt-1">
              <div class="mt-3 cards mx-auto p-2 invoicecard-mobileview">
                <div class="d-flex align-items-center flex-column p-2 rounded mx-2 mb-2  justify-content-center topBlock block-1 text-center">

                    <h6 style="font-size: 20px;" class="mb-3 mt-2"><b>Total Invoice</b></h6>
                    <div class="row justify-content-center text-center currencyDiv">
                        <!-- <span class="currency"> OMR</span> -->
                        <h4><b><fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" /></b>150</h4>
                    </div>

                </div>
                <div class="d-flex align-items-center flex-column p-2 rounded mx-2 mb-2 justify-content-center topBlock block-2 text-center" >

                    <h6 style="font-size: 20px;" class="mb-3 mt-2"><b>Booked Expenses</b></h6>
                    <div class="row justify-content-center text-center currencyDiv">
                        <h4><b><fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" /></b>OMR 16262</h4>
                    </div>

                </div>
                <div class="d-flex align-items-center flex-column p-2 rounded mx-2 mb-2 justify-content-center topBlock block-3 text-center" >

                    <h6 style="font-size: 20px;" class="mb-4 mt-4"><b>Paid Expenses</b></h6>
                    <div class="row justify-content-center text-center currencyDiv">
                        <h4 style="white-space: nowrap;"><b><fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" /></b>OMR 16262</h4>
                    </div>

                </div>
                <div class="d-flex align-items-center flex-column p-2 rounded mx-2 mb-2 justify-content-center topBlock block-4 text-center">

                    <h6 style="font-size: 20px;" class="mb-3 mt-2"><b>Petty Cash On Hand</b></h6>
                    <div class="row justify-content-center text-center currencyDiv">
                     <h4><b><fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" /></b>OMR 16262</h4>
                    </div>

                </div>
                <div class="d-flex align-items-center flex-column p-2 rounded mx-2 mb-2 justify-content-center topBlock block-2 text-center">

                    <h6 style="font-size: 20px;" class="mb-3 mt-4"><b>Received Payment</b></h6>
                    <div class="row justify-content-center text-center currencyDiv">
                        <h4><b><fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" /> </b>OMR 16262</h4>                                           
                    </div>
                </div>
            </div>

                   <div class="row mt-2 mx-auto">
                    <div class="col-md-4 form-floating mb-3">
                        <select id="utilityArea" name="utilityArea" required="" class="form-select">
                            <option value="" disabled="" selected="">Select your option</option>
                            <option value="Common">Common</option>
                            <option value="Shared">Shared</option>
                        </select>
                        <label class="control-label">Select Property</label>
                    </div>
                   </div>
                
                   <div class="row mt-4 mx-auto">
                    
                    <div class="px-2 col-md-4">  
                        <div class="card col-md-12 d-flex justify-content-center" style="background-color: #fff;border-radius:10px;">                                     
                            <canvas id="newlinechart" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
                        </div>
                    </div>
                 <div class="px-2 col-md-4">  
                       <div class="card col-md-12" style="background-color: #fff;border-radius:10px;">         
                           <h5 class="text-center mt-1" style="font-size:20px;color:#737373 !important;"><b>Accounts Receivables/Payable Summary</b></h5>
         <div class="col-md-12 px-2" style="max-height: 200px">
       <table id="example" class="table table-bordered">
           <thead>
               <tr class="headings">
                   <th>Month</th>
                   <th>Accounts Receivables</th>
                   <th>Accounts Payable</th>
    
               </tr>
           </thead>
           <tbody>
               <tr>
                   <td class="center roweach">Jan</td>
                   <td class="center roweach">1000</td>
                   <td class="center roweach">800</td>
               </tr>
              <tr>
                   <td class="center roweach">Feb</td>
                   <td class="center roweach">1000</td>
                   <td class="center roweach">800</td>
               </tr>
                <tr>
                   <td class="center roweach">Mar</td>
                   <td class="center roweach">1000</td>
                   <td class="center roweach">800</td>
               </tr>
           </tbody>
       </table>
       
    </div>   </div>
    </div>
                    <div class="px-2 col-md-4">
                      <div class="col-md-12">
                                              <div class="card graph-container" style="border-radius:10px;" >   
                                                  <h5 class="text-center mt-3" style="font-size:20px;color:#737373 !important;"><b>Invoice Breakup</b></h5>
                                           <div class="row mt-2 mx-3 height-fro-mobile" style="height: 180px;">
                                              <div class="col-md-6">
                                                  <div class="row">
                                                   <div class="col-md-12 text-white text-center my-auto" style="background-color: #05192e;height: 80px;display: flex;  justify-content: center; align-items: center;flex-direction: column;">
                                                       <p style="font-size: 14px;" class="mt-3">
                                                       <fmt:formatNumber  pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Rent Invoice Raised
                                                       <br> 200
                                                       </p>
                                                  </div>
                                                  <div class="col-md-12 text-white  text-center my-auto" style="background-color:#314c68;height: 85px;display: flex;  justify-content: center; align-items: center;">
                                                      <p class="text-nowrap mt-3" style="font-size: 14px;" >
                                                     <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Service Charge of<br>Invoice Raised
                                                     <br> 200
                                                    </p>
                                                  </div>
                                                  </div>
                                                      </div>
                                                      <div class="col-md-6">
                                                        <div class="row">
                                                         <div class="col-md-12 text-white text-center my-auto" style="background-color: #4d7299;height: 80px;display: flex;  justify-content: center; align-items: center;flex-direction: column;">
                                                             <p style="font-size: 14px;">
                                                             <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Value Of Invoice
                                                             <br>OMR 16000
                                                             </p>
                                                        </div>
                                                        <div class="col-md-12 text-white  text-center my-auto" style="background-color:#7facdb;height: 85px;display: flex;  justify-content: center; align-items: center;">
                                                          <p style="font-size: 14px;">
                                                           <fmt:formatNumber pattern= "#0.000" type="number" maxFractionDigits = "3" value="" />Value Of Invoice
                                                          <br>OMR 16000
                                                          </p>
                                                        </div>
                                                        </div>
                                                            </div>
                                                  </div>
                                              </div> </div>
                  </div>
                </div>

<div class="row mt-2 mx-auto">
    <div class="px-2 col-md-4">  
        <div class="card col-md-12 d-flex justify-content-center" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="mobileAppDownloadsss" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="px-2 col-md-4">  
        <div class="card col-md-12 d-flex justify-content-center" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="mobileAppDownloads" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="px-2 col-md-4">  
      <div class="card col-md-12 d-flex justify-content-center" style="background-color: #fff;border-radius:10px;">    
          <h5 class="text-center mt-3" style="font-size:20px;color:#737373 !important;"><b>Rent Cheque Summary</b></h5>
          <div class="col-md-12 px-3">
            
              <select class="form-select">
                  <option selected="" disabled="">Select Month</option>
                  <option value="Jan">Jan</option>
                    <option value="Feb">Feb</option>  
                    <option value="Mar">Mar</option>
                    
              </select>
          </div>
          <canvas id="mobileAppUsage" class="graph-container commonchartwidthforprint" width="900" height="400"></canvas>     
      </div>
  </div>
</div>

<div class="row mt-2 mx-auto">
  <div class="col-md-4 px-2">
        <div class="card col-md-12" style="background-color: #fff;border-radius:10px;">      
            <h5 class="text-center mt-4" style="font-size:20px;color:#737373 !important;"><b>Upcoming Property Dues</b></h5>
    <div class="col-md-12 px-2" style="min-height: 200px;">
        
       <table id="example" class="table table-bordered">
           <thead>
               <tr class="headings">
                   <th>Property Name</th>
                   <th>Document</th>
                   <th>Due Date</th>
    
               </tr>
           </thead>
           <tbody>
               <tr>
                   <td class="center roweach">Verify Doc</td>
                   <td class="center roweach">Critical</td>
                   <td class="center roweach">10/02/2022</td>
               </tr>
               <tr>
                <td class="center roweach">Verify Doc</td>
                <td class="center roweach">Critical</td>
                <td class="center roweach">10/02/2022</td>
               </tr>
           </tbody>
       </table>
       
    </div>
        </div>
    </div>
    <div class="px-2 col-md-4">  
        <div class="card col-md-12 d-flex justify-content-center" style="background-color: #fff;border-radius:10px;">                                     
            <canvas id="speedChart1" class="graph-container commonchartwidthforprint" width="600" height="400"></canvas>     
        </div>
    </div>
    <div class="col-md-4 px-2">
          <div class="card col-md-12" style="background-color: #fff;border-radius:10px;">      
              <h5 class="text-center mt-4" style="font-size:20px;color:#737373 !important;"><b>Cheque Tracking</b></h5>
      <div class="col-md-12 px-2" style="overflow-y:scroll;overflow-x:scroll;max-height: 200px">
         <table id="example" class="table table-bordered">
             <thead>
                 <tr class="headings">
                     <th>Checque No</th>
                     <th>Description</th>
                     <th>Transation Date</th>
                     <th>Status</th>
                 </tr>
             </thead>
             <tbody>
                 <tr>
                     <td class="center roweach">Verify</td>
                     <td class="center roweach">Unit 435</td>
                     <td class="center roweach">10/02/2022</td>
                     <td class="center roweach">Open</td>
                 </tr>
                 <tr>
                     <td class="center roweach">Verify</td>
                     <td class="center roweach">Unit 435</td>
                     <td class="center roweach">10/02/2022</td>
                     <td class="center roweach">Open</td>
                 </tr>
             </tbody>
         </table>
         
      </div> </div>
      </div>
</div>

</div>
                

</div>

    </section>
    </main>
                       
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
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Glance through Receivable Invoice, Booked Expenses, Paid Expenses, Petty Cash on hand, and Receivable Income in exact numbers. Select common or shared properties to view them in detail. Access data on Total Income & Expenses, Account Receivable & Payable Summary, Property Category, Aging Payables, Aging Receivables, Rent Cheque Summary, Upcoming Property Dues, Tax Graph, and Cheque Tracking in separate columns. </p>\n\
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
<script>
        var month1 = Date.today().addMonths(-5).toString("MMM")
        var month2 = Date.today().addMonths(-4).toString("MMM")
        var month3 = Date.today().addMonths(-3).toString("MMM")
        var month4 = Date.today().addMonths(-2).toString("MMM")
        var month5 = Date.today().addMonths(-1).toString("MMM")
        var month6 = Date.today().addMonths(0).toString("MMM")
        var yearNow = Date.today().addMonths(0).toString("yyyy");
</script>
<script> 
     var speedCanvas = document.getElementById("newlinechart");
     var countArray = document.getElementById("valArray");
        var mon1Arr = [];
        var mon2Arr = [];
       
                      mon1Arr.push(10,20,30,40)
                      mon2Arr.push(15,27,37,48)
                    

var productFirst = {
label: "Expenses",
data: [mon1Arr[3], mon1Arr[2], mon1Arr[1], mon1Arr[0]],
lineTension: 0,
fill: false,
borderColor: '#05192e',
borderWidth: 1.5,
pointRadius: 1,
};
var productSecond = {
label: "Income",
data: [mon2Arr[3], mon2Arr[2], mon2Arr[1], mon2Arr[0]],
lineTension: 0,
fill: false,
borderColor: '#7facdb',
borderWidth: 1.5,
pointRadius: 1,
};

var speedData = {
  labels: ["Property 1", "Property 2", "Property 3", "Property 4"],
datasets: [productFirst,productSecond]
};

var chartOptions = {
title: {
                      display: true,
                      text: 'Total Income and Expenses',
                      fontSize: 20
                  },
legend: {
              display: true,
              position: 'bottom', 
              labels: {boxWidth: 30, fontColor: 'black', defaultFontFamily: "'Roboto', sans-serif"}
          },
scales: {
                          yAxes: [{
                                    scaleLabel: {
                                  display: true,
                                  labelString: 'Value',
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
                                 fontSize: 15,
                                      fontStyle: 'bold'
                              },
                                  gridLines: {
                                      drawOnChartArea: false
                                  },
                                 

                              }]
                      },
};

var lineChart = new Chart(speedCanvas, {
type: 'line',
data: speedData,
options: chartOptions
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
        labels: ["Bounced", "Void", "Processed","Open"],
        datasets: [{
          backgroundColor: ['#05192e', '#314c68', '#4d7299', '#7facdb'],
          data: [7,5,10,3]
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
                              text: 'Rent Posting Tracking',
                           fontSize: 20
             },
               legend: {
                    display: false,
                    labels: {
                        // This more specific font property overrides the global property
                        defaultFontFamily: "'Roboto', sans-serif"}
                }
      }
    };

    var ctxPayment = document.getElementById("speedChart");
    new Chart(ctxPayment, config);
</script>

<script>
  var config = {
    type: 'bar',
    data: {
      labels: [month1, month2, month3,month4,month5,month6],
      datasets: [{
        label: "Invoice Amount",
        backgroundColor: '#05192e',
        data: [90, 80, 90, 50, 30, 20]
      }, {
        label: "Service Charges",
        backgroundColor: '#7facdb',
        data: [70, 60, 20, 40, 10, 30]
      }]
    },
    options: {
      scales: {
        xAxes: [{
          stacked: false,
          scaleLabel: {
            display: true,
            labelString: 'Months ('+yearNow+')',
            fontSize: 16
          },
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
                            text: 'Tax Graph (last 6 months)',
                         fontSize: 20
           },
             legend: {
                  display: false,
                  labels: {
                      // This more specific font property overrides the global property
                      defaultFontFamily: "'Roboto', sans-serif"}
              }
    }
  };

  var ctxPayment = document.getElementById("speedChart1");
  new Chart(ctxPayment, config);
</script>
 <script>
             var ctx1 = document.getElementById('mobileAppUsage');
                                        var myChartHr6 = new Chart(ctx1, {
                                            type: 'pie',
                                            data: {
                                                labels: ['Open Cheques', 'Bounced Cheques','Cleared Cheques','Re-deposit Cheques'],
                                                datasets: [{
                                                        label: '# no. of employees',
                                                        data: [12,4,7,3],
                                                        backgroundColor: [
                                                            '#05192e',
                                                            '#314c68',
                                                            '#4d7299',
                                                            '#7facdb'
                                                            
                                                        ],
                                                        borderColor: [
                                                            '#05192e',
                                                             '#314c68',
                                                            '#4d7299',
                                                           
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
                                       tooltips: {
                                            enabled: false
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
                                                    display: false,
                                                    text: 'Payments Due VS Payments Received',
                                                    fontSize: 20
                                                },
                                                legend: {
                                                    display: true,
                                                    position: 'right',
                                                    align: "center"    
                                                }
                                            }
                                        });


        </script>
</body>

</html>