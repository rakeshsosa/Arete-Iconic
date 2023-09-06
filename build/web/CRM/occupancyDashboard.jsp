<%-- 
    Document   : recipeList
    Created on : 5 Apr, 2016, 12:01:07 PM
    Author     : ebs-sdl13
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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
        
            
 <style>
     .round-box{
            box-shadow: 0px 0 30px rgb(1 41 112 / 10%);
    background: #fff;
    width: 220px;
    height: 220px;
    border-radius: 50%;

     }
     .round-box div {
             display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    padding: 15px;
     }
     .graph-container {
          box-shadow: 0px 0 30px rgb(1 41 112 / 10%) !important;
    background: #fff !important;
    border-radius: 4px;
    padding: 10px !important;
     }
     .round-box span {
         font-size: 21px;
         font-weight: 500;
         text-align: center;
     }
            .h2, h2 {
    font-size: 1.5rem !important;
}
.graph-container {
    background-color: #f7f7f7;
    box-shadow: 0px 0px 10px 0px rgb(93 94 94 / 78%);
    padding: 5px;
}
        </style>

    </head>


     <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>
       
                <jsp:include page="../login/menu.htm"/>
               
                                
                                   <main id="main" class="main">
       <div>
           <jsp:include page="../login/headerlink.htm?submodule=Property Profile&tab=Property Profile&pagetype=form"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Occupancy Details</h5></div>
        
    <div class="container table-responsive print-wrap" id="ReportPdfDownload">
        <div class="row no-gutters d-print-none ignore" id="ignore">
<!--                                <div class="col-md-12" style="display: flex; justify-content: flex-end; margin: 15px 10px 5px 10px; padding-right: 21px;">
                                    <button class="btn btn-info mx-1 mt-3" id="printbtn" onclick="PrintDashboard()" style="background-color: #38414e !important; border: none; color: #ff;">Print</button>
                                    <button class="btn btn-danger mx-1 mt-3" id="downloadpdfbtn" onclick="download()" style="background-color: #fcd681 !important; border: none; color: #000;">Download</button>
                                </div>-->
                                <div class="col-md-12" style="display: flex; justify-content: flex-end; margin: 15px 10px 5px 10px; padding-right: 21px;"> 
                                    <a class="d-none" id="pdf-download-link" target="blank" title="Download PDF File">Download PDF file</a>
                                    <button class="btn btn-primary mx-1 mt-3" id="printbtn" onclick="generatePDF()">Print and download</button>
<!--                                    <button class="btn btn-info mx-1 mt-3" id="printbtn" onclick="PrintDashboard()" style="background-color: #38414e !important; border: none; color: #ff;">Print</button>
                                    <button class="btn btn-danger mx-1 mt-3" id="downloadpdfbtn" onclick="download()" style="background-color: #fcd681 !important; border: none; color: #000;">Download</button>-->
                                </div>
                            </div>
                                 

           <div class="row">
               <div class="col-lg-3 form-floating mb-3" >
<select class="form-select" name="clientType" placeholder="Category" id="doctype" maxlength="98" required="" aria-invalid="false">
                                                                        <option value="" selected="selected" disabled="">Select An Option</option>
                                                                        <option value="IT &amp; Services">IT &amp; Services</option>
                                                                        <option value="Manufacturing">Manufacturing</option>
                                                                        <option value="E-Commerce">E-Commerce</option>
                                                                    </select>              
                   <label for="groupname"><span style="color:red">*</span> Property Name</label>
            </div>
               <div class="col-md-3 form-floating mb-3 pick1">
                                                        <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker1"  name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> From Period</label>
                                                    </div>
               <div class="col-md-3 form-floating mb-3 pick2">
                                                        <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker2"  name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> To Period</label>
                                                    </div>
               
           </div>
        <div class="row">
            <h5>Occupancy Statistics</h5>
     <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <div class="">
                 <span>Total Units 400</span>
             </div>
         </div>
     </div>
           
                <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <div class="">
                 <span>Total Occupied Units 300</span>
             </div>
         </div>
     </div>
               
                <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <div class="">
                 <span>Total Vacant Units 80</span>
             </div>
         </div>
     </div>
                        <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <div class="">
                 <span>Total Booked Units 20</span>
             </div>
         </div>
     </div>                
                                 
                               
                                    </div>
                            <div class="row">
     <div class="col-lg-4 mt-2 mt-lg-0 p-3 " >
                                        <canvas id="complaintStatus"  class="graph-container chartjs-render-monitor" width="305" height="305" style="display: block; width: 305px; height: 305px;" ></canvas>
                                     </div>
                                  
                                   <div class="col-lg-4 mt-2 mt-lg-0 p-3 " >
                                        <canvas id="speedChart"  class="graph-container chartjs-render-monitor" width="305" height="305" style="display: block; width: 305px; height: 305px;" ></canvas>
                                     </div>
                                 <div class="col-lg-4 mt-2 mt-lg-0 p-3 " >    
                                               <canvas id="invoceschart" class="graph-container chartjs-render-monitor" width="305" height="305" style="display: block; width: 305px; height: 305px;" ></canvas>
                                        </div>
                                    </div>
                             
                                </div>              
                    </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
      
<jsp:include page="../login/footer.jsp"/>

 <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js" integrity="sha512-/n/dTQBO8lHzqqgAQvy0ukBQ0qLmGzxKhn8xKrz4cn7XJkZzy+fAtzjnOQd5w55h4k1kUC+8oIe6WmrGUYwODA==" crossorigin="anonymous"></script>
        <script src="../common/theme/js/custom.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
        <script src="../common/theme/js/chart.js-2.9.3/package/dist/Chart.js"></script>
        <script src="../common/theme/js/chart.js-2.9.3/chartjs-plugin-datalabels.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js" integrity="sha512-/n/dTQBO8lHzqqgAQvy0ukBQ0qLmGzxKhn8xKrz4cn7XJkZzy+fAtzjnOQd5w55h4k1kUC+8oIe6WmrGUYwODA==" crossorigin="anonymous"></script>

       <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
      
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>

    <script>
    //Generate PDF
    function generatePDF() {   
        
    (async function loops() {
    var pages = $(".print-wrap");
      var pdf = new jsPDF("p", "pt", "a4");
      var widthtest = pdf.internal.pageSize.getWidth();
      var heighttest = pdf.internal.pageSize.getHeight();
var elementHandler = {
  '#ignore': function (element, renderer) {
    return true;
  }
};
//    pdf.setFontSize(40);
    for (var i = 0; i < pages.length; i++) {
      await new Promise(function(resolve) {
        html2canvas(pages[i], {useCors: true,scale: 2,backgroundColor:'#f2f2f2'}).then(function(canvas) {

          var img=canvas.toDataURL("image/png",1.0);
          if((i+1) == pages.length) {
      //  pdf.setFillColor(204, 204,204,0);
             pdf.addImage(img,'PNG', 0, 0,widthtest, 400,undefined,'FAST'); 
          } else {
            
               pdf.addImage(img,'PNG', 0, 0,widthtest,heighttest,undefined,'FAST'); 
          }
          
          
          
          if ((i+1) == pages.length) {
                var blob = pdf.output("blob");

                    //Getting URL of blob object
                    var blobURL = URL.createObjectURL(blob);


                    //Setting download link
                    var downloadLink = document.getElementById('pdf-download-link');
                    downloadLink.href = blobURL;
                    downloadLink.click();
          //  pdf.save('billing.pdf');
          } else {
            pdf.addPage();
          }
          resolve();
        });
      });
    }
})();

    };

    
          $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick1'
                }).datepicker('update', new Date());
                
                  $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                   container: '.pick2'
                }).datepicker('update', new Date());
   
                 function PrintDashboard () {
             $("#downloadpdfbtn").hide;
             $("#printbtn").hide;
             window.print();
         }
function download() {
             
		var HTML_Width = $(".salesDownload").width();
		var HTML_Height = $(".salesDownload").height();
		var top_left_margin = 20;
		var PDF_Width = HTML_Width+(top_left_margin*2);
		var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
		var canvas_image_width = HTML_Width;
		var canvas_image_height = HTML_Height;
		
		var totalPDFPages = Math.ceil(HTML_Height/PDF_Height)-1;
		

		html2canvas($(".salesDownload")[0],{allowTaint: true,useCORS:true, backgroundColor: '#f2f2f2',pageSplit:'true',},).then(function(canvas) {
			canvas.getContext('2d');
			
			console.log(canvas.height+"  "+canvas.width);
			
			
			var imgData = canvas.toDataURL("image/jpeg", 1.0);
			var pdf = new jsPDF('p', 'pt',  [PDF_Width, PDF_Height]);
		    pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin,canvas_image_width,canvas_image_height);
			
			
			for (var i = 1; i <= totalPDFPages; i++) { 
				pdf.addPage(PDF_Width, PDF_Height);
                              
				pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
			}
			
		    pdf.save("occupany-details.pdf");
                 
        });
	
}

                Chart.defaults.global.defaultFontColor = '#000000';
           var day1 = Date.today().addDays(-5).toString("MMM d");
                    var day2 = Date.today().addDays(-4).toString("MMM d");
                    var day3 = Date.today().addDays(-3).toString("MMM d");
                    var day4 = Date.today().addDays(-2).toString("MMM d");
                    var day5 = Date.today().addDays(-1).toString("MMM d");
                    var day6 = Date.today().addDays(0).toString("MMM d");
                    
                    var month1 = Date.today().addMonths(-5).toString("MMMM");
                    var month2 = Date.today().addMonths(-4).toString("MMMM");
                    var month3 = Date.today().addMonths(-3).toString("MMMM");
                    var month4 = Date.today().addMonths(-2).toString("MMMM");
                    var month5 = Date.today().addMonths(-1).toString("MMMM");
                    var month6 = Date.today().addMonths(0).toString("MMMM");      

        var yearNow = Date.today().addMonths(0).toString("yyyy");
        
                var speedCanvas = document.getElementById("speedChart");

                var dataFirst = {
                    label: "2021",
                    data: [2,6,9,67,23,59],
                    lineTension: 0,
                    fill: false,             
                    borderColor: '#4155c6',
                    pointRadius: 2,
                     borderWidth: 1.5,
                    pointBackgroundColor: '#4155c6'
                }; 
                   var dataSecond =  {
                    label: "2022",
                    data: [4,6,15,3,45,2],
                    lineTension: 0,
                    fill: false,
                    borderColor: '#ff7e79',
                    pointRadius: 2,
                     borderWidth: 1.5,
                    pointBackgroundColor: '#ff7e79'
                };  
                 



                var speedData = {
                    labels: [month1, month2, month3, month4, month5, month6],
                    datasets: [dataFirst,dataSecond]
                };

                var chartOptions = {
                    title: {
                        display: true,
                        text: 'Occupancy Trends ( Given Period )',
                        fontSize: 20
                    },
                    legend: {
                        display: true,
                        position: 'bottom',
                        labels: {
                            boxWidth: 20,
                            fontColor: 'black'
                        }
                    },
                    scales: {
                        yAxes: [{
                                scaleLabel: {
                                    display: false,
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
                                    display: false,
                                    labelString: 'Months ('+yearNow+')',
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
     
      


        Chart.defaults.global.defaultFontFamily = "'Roboto', sans-serif";

        var month1 = Date.today().addMonths(-5).toString("MMM") + "-" + Date.today().addMonths(-5).toString("yyyy");
        var month2 = Date.today().addMonths(-4).toString("MMM") + "-" + Date.today().addMonths(-4).toString("yyyy");
        var month3 = Date.today().addMonths(-3).toString("MMM") + "-" + Date.today().addMonths(-3).toString("yyyy");
        var month4 = Date.today().addMonths(-2).toString("MMM") + "-" + Date.today().addMonths(-2).toString("yyyy");
        var month5 = Date.today().addMonths(-1).toString("MMM") + "-" + Date.today().addMonths(-1).toString("yyyy");
        var month6 = Date.today().addMonths(0).toString("MMM") + "-" + Date.today().addMonths(0).toString("yyyy");


        var barChartData = {

            labels: ["< 15 days", "15 - 30 days","30 - 60 days","60 - 90 days", "> 90 days"],
            datasets: [{
                    label: 'Vacant Units',
                    backgroundColor: ['#4155c6','#4155c6','#4155c6','#4155c6','#4155c6'],
                   // stack: 'Stack 1',
                   // hovertemplate: 'Price: %{y:$.2f}<extra></extra>',
                    data: [
                        250,
                        500,
                        750,
                        800,
                        900
                        
                    ]
                }]

        };
        var ctx = document.getElementById('invoceschart');
        var myChartHr1 = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
                
                maintainAspectRatio: false,
                plugins: {
                    datalabels: {
                        display: false,
                    },
                },
                scales: {
                    yAxes: [{
                            stacked: true,
                            scaleLabel: {
                                display: true,
                                labelString: '',
                                fontSize: 16
                            },
                            gridLines: {
                                drawOnChartArea: false
                            },
                       
                            ticks: {
                                            stepSize: 250,

                                maxTicksLimit: 5,
                                beginAtZero: true,
                                

                            }

                        }],
                    xAxes: [{
                            stacked: true,
                            scaleLabel: {
                                display: true,
                                labelString: '',
                                fontSize: 16
                            },
                            gridLines: {
                                drawOnChartArea: false
                            },
                            categoryPercentage: 1.0,
                                    barPercentage: 0.5,

                        }]
                      
                },
                title: {
                             display: true,
                              text: 'Vacancy Units Trends',
                           fontSize: 20
             },
             


                                    legend: {
                                                    display: true,
                                                    position: 'bottom',
                                                }
         
            }
        });


    var ctx1 = document.getElementById('complaintStatus');
    var myChartHr6 = new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: ['Residential', 'Office Use','Shops','Others'],
            datasets: [{
            label: '# no. of employees',
            data: [25,15,40,10],
            backgroundColor: [
                '#4155c6',
                '#ff7e79',
                '#fecc53',
                '#8dc0ff'

                
            ],
            borderColor: [
                '#4155c6',
                '#ff7e79',
                '#fecc53',
                '#8dc0ff'

                
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
                                                    text: 'Occupancy Break-up',
                                                    fontSize: 20
                                                },
                                                legend: {
                                                    display: true,
                                                    position: 'bottom', 
                                                }
    }
});
        </script>
 
    </body>

</html>