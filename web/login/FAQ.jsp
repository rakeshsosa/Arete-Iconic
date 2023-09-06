<%-- 
    Document   : FAQ
    Created on : Jan 8, 2018, 1:12:51 PM
    Author     : EBS
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link href="../common/theme/css/custom.css" rel="stylesheet">-->
    <title>Arete Iconic</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    <style>
        .accordion-item {
border: 1px solid #ebeef4 !important;
}
    </style>
</head>
<body class="nav-md">
 <jsp:include page="../login/menu.htm" />
<main id="main" class="main">
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
    <div class="card-body">
        <div class="card-title text-center">
           
           <h2 style="text-decoration:underline">Frequently Asked Questions</h2>
        </div>
        <div class="accordian" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-landlord-parent">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-landlord" aria-expanded="false" aria-controls="flush-landlord">
                    Log In
                </button>
            </h2>
            <div id="flush-landlord" class="accordion-collapse collapse" aria-labelledby="flush-landlord-parent" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1">
                        How to log in to Property Management?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample1">
                                <div class="p-3">
                                    Enter the URL
                                    <a href="http://182.74.202.101:8099/Property_Management_Solution_Basic/login/login.htm">http://182.74.202.101:8099/Property_Management_Solution_Basic/login/login.htm.</a> Provide valid
                                    credentials and click login.
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">
                       I forgot my password. How to reset my password?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample2">
                                <div class="p-3">
                                   Click “Forgot Password” on the login page. It gives you the option to change or reset your password. Or go to the User sub-module under the User Management. There you can reset your password.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample3" aria-expanded="false" aria-controls="multiCollapseExample3">
                       How to create my profile?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample3">
                                <div class="p-3">
Click the My Profile option found in the upper right corner, click the Update button to enter, or change your details. Click Save to activate the profile.                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample4" aria-expanded="false" aria-controls="multiCollapseExample4">
                      How to logout securely?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample4">
                                <div class="p-3">
You can log out securely by clicking the Log out button in the right upper corner or the Arete icon.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample5" aria-expanded="false" aria-controls="multiCollapseExample5">
                       What is the use of the Notification Button, and how to access it?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample5">
                                <div class="p-3">
Notification Button or icon alerts you on the current happenings that require your immediate attention.                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="dashboard">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#dashboard1" aria-expanded="false" aria-controls="dashboard1">
                    Dashboard
                </button>
            </h2>
            <div id="dashboard1" class="accordion-collapse collapse" aria-labelledby="dashboard" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample6" aria-expanded="false" aria-controls="multiCollapseExample6">
                      What is the Dashboard and how can I use it?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample6">
                                <div class="p-3">
                                  The Dashboard is the first page you see when you log in to the Property Management software application. It gives you a glance at the many happenings of your business on a single page. It saves your time and effort. 
                                </div>
                            </div>
                        </div>
                    </div>

                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample7" aria-expanded="false" aria-controls="multiCollapseExample7">
                       What is Numeric and Pictorial Data?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample7">
                                <div class="p-3">
                                  For your convenience, you can select to see your business at a glance through Numbers or Pictures. Numeric and pictorial data are available. You need to select the format to access your business data in a single go. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample8" aria-expanded="false" aria-controls="multiCollapseExample8">
                      How do I use the Calendar in the Dashboard?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample8">
                                <div class="p-3">
The Calendar feature in the Dashboard allows you to see the data for a specific period. You can select from and to date to access the data.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                     
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample9" aria-expanded="false" aria-controls="multiCollapseExample9">
                     What is the Occupancy Portrayal?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample9">
                                <div class="p-3">
Occupancy Portrayal is available in the pictorial and the numeric dashboards. It gives you an idea of the number of properties occupied in detail. You can use the calendar to view a specific period of data with the type of property option.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample10" aria-expanded="false" aria-controls="multiCollapseExample10">
                      What are the hexagons shown on the Dashboard?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample10">
                                <div class="p-3">
In each of the management pages, you will see several hexagons containing the property's total data. If you click the hexagon, it opens a separate page and reveals the appropriate data in detail.                                </div>
                            </div>
                        </div>
                    </div>
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample11" aria-expanded="false" aria-controls="multiCollapseExample11">
                     What is available in Property Management?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample11">
                                <div class="p-3">
Under Property Management, you can see the total number of properties, flats, accessories, and vacant flats your organization owns in numbers.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample12" aria-expanded="false" aria-controls="multiCollapseExample12">
                     What are the Management modules available in the Dashboard?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample12">
                                <div class="p-3">
There are six Management modules you can see in the Dashboard, and each of the modules has sub-modules. They are Property Management, Purchase Management, Inventory Management, Contract Management, Tenant Management, and Correspondence Management. Each of the management gives accurate data in hexagon labels.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample13" aria-expanded="false" aria-controls="multiCollapseExample13">
                     What are the Action Buttons? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample13">
                                <div class="p-3">
Action buttons are placed in the last column from right to left. Normally, you have the option to view, edit, or cancel, but some pages have more action buttons to modify the data.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                       <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample14" aria-expanded="false" aria-controls="multiCollapseExample14">
What is the +Create option?
                       </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample14">
                                <div class="p-3">
On all the pages you visit, you have the option to edit or add details. Clicking the Create button redirects you to a new page where you may enter the relevant details and save them. Once you enter the data, it can be added to the list. The previous page can be accessed by clicking on the "Show Record" link on the Create page.                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="splDashboard">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#splDashboard1" aria-expanded="false" aria-controls="splDashboard1">
                   Special Dashboards
                </button>
            </h2>
            <div id="splDashboard1" class="accordion-collapse collapse" aria-labelledby="splDashboard" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample15" aria-expanded="false" aria-controls="multiCollapseExample15">
                      Who can access the Manager Dashboard?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample15">
                                <div class="p-3">
                                  The Admin, the Managers, and the Property Owners can access the Manager Dashboard to glance at the number of Total Property, Total Rental Units, Occupied, Booked, and Vacant. The numbers are in circle shapes. You can also view the properties by selecting common or shared ones. The Six graphic pictures represent Property Category, Aging Payables, Aging Receivables, Utilities Tracking, Expiring Contracts, Rent Tracking, and a calendar with reminders. The information is auto-updated. 
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample16" aria-expanded="false" aria-controls="multiCollapseExample16">
                      What is the Accountant Dashboard contain? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample16">
                                <div class="p-3">
Access all your Accounts-related information on the Accountant Dashboard. 
Accurate data shows through graphs, columns, and charts for your convenience. You can predict your expenses and Income quickly. The Number of Receivable Invoices, Booked Expenses, Paid Expenses, Petty Cash on Hand, and Received Income. Graphic charts represent Total Income and Expenses, Accounts Receivable and Payable Summary, Invoice Break up, Aging Payable, Aging Receivables, Rent Cheque Summary, Upcoming Property Dues, Tax Graph for the last six months, and Cheque Tracking. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                  
                    
                    
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="masters">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#masters1" aria-expanded="false" aria-controls="masters1">
                  Masters
                </button>
            </h2>
            <div id="masters1" class="accordion-collapse collapse" aria-labelledby="masters" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample17" aria-expanded="false" aria-controls="multiCollapseExample17">
                    What is a Master Page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample17">
                                <div class="p-3">
A Master page stores and distributes the data to other modules. It saves you from repeating the data numerous times. All data are auto-filled or usable once you enter them on the Master page.                                 </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample18" aria-expanded="false" aria-controls="multiCollapseExample18">
                     Is the Master feature applicable in all categories? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample18">
                                <div class="p-3">
                              Yes. Each of the departments has various categories and types. You can create masters for them once for all or as the necessity comes. Master has many pages as each one is related to specific management.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                         <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample19" aria-expanded="false" aria-controls="multiCollapseExample19">
                    What are the names of the sub-modules in Masters?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample19">
                                <div class="p-3">
The Sub-modules: Masters, Accessory details, Service Request Type, Penalty Type, Store Master, Location Master, Terms and Conditions, Utility Master, Document Category, Document Type, and AMC Maintenance. Some sub-modules have some more sub-modules under them.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample20" aria-expanded="false" aria-controls="multiCollapseExample20">
                    I have many insurances related to property and other departments. Where can I Store them for my reference? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample20">
                                <div class="p-3">
You can enter and access all the insurance-related information on the Insurance Master. You can add, edit and search relevant data whenever required.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample21" aria-expanded="false" aria-controls="multiCollapseExample21">
                   Do I have a page that highlights the Contracts Information? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample21">
                                <div class="p-3">
Yes. There is a unique page that includes only the Contracts' information. You can save any of your contract agreements of your tenants, properties, employee, or vendors. Contract Category is the page entitled to store data related to all contracts in Property Management. View, edit, add, and search options are available.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample22" aria-expanded="false" aria-controls="multiCollapseExample22">
                   What does the Contract Type page do?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample22">
                                <div class="p-3">
It helps you add all your contracts of various sources in one place. Depending on the requirement, the Contract Types can be short, long, and monthly. Use the action buttons to know more.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample23" aria-expanded="false" aria-controls="multiCollapseExample23">
                   Where to store the data of my landlords? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample23">
                                <div class="p-3">
On the Landlord Master page, you can add the basic information: Landlord Code, Category, Name, and Contact Number. Use Action buttons to add and edit.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample24" aria-expanded="false" aria-controls="multiCollapseExample24">
                    What is Tenant Category, and where can I access it?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample24">
                                <div class="p-3">
Tenant Category deals with all types of tenants you currently have. The details can be added and accessed in the Masters of Tenant Category, Tenant Management module, and the Dashboard.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample25" aria-expanded="false" aria-controls="multiCollapseExample25">
                    What is Property/Flat/ Tenant Type?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample25">
                                <div class="p-3">
Property/ Flat/ Tenant Type carries the information about the tenants and their usage: Commercial, Residential, Agricultural, etc. The occupants’ data can be saved and maintained on this page.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample26" aria-expanded="false" aria-controls="multiCollapseExample26">
                   What is the benefit of the Vendor Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample26">
                                <div class="p-3">
The Vendor Master keeps track of your material and service supplies with supplier code, name, and other bank details. Use the action buttons in the Action column to know more.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample27" aria-expanded="false" aria-controls="multiCollapseExample27">
                   What is Complaint Type Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample27">
                                <div class="p-3">
The Complaint Type Master deals with complaints from various sources: water, swimming pool, gym, electricity, maintenance, etc. You can track all complaints from a single place.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample28" aria-expanded="false" aria-controls="multiCollapseExample28">
                   What is Service Request Type?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample28">
                                <div class="p-3">
Your tenants require services like water, electricity, or anything in residential and commercial spaces. This master helps to record the service requested names and their costs. Action buttons help in modifying the data as to the requirement.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample29" aria-expanded="false" aria-controls="multiCollapseExample29">
                  What is the use of Penalty Type?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample29">
                                <div class="p-3">
Penalty Type contains the penalty information of your occupants or tenants. Long-term use or negligence may cause damage to your accessories in such situations. To compensate for the broken or damaged goods, they must pay a fee.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample30" aria-expanded="false" aria-controls="multiCollapseExample30">
                   How to use the Store Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample30">
                                <div class="p-3">
Using the Store Master is easy. Use the action buttons in the Action column or Click the Create a new record tab in the upper right corner to add new data. It helps you to track the items you own or in stock store-wise.                                  </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample31" aria-expanded="false" aria-controls="multiCollapseExample31">
                   What are the benefits of Location Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample31">
                                <div class="p-3">
Contact details are of two types: Bill to Location and Delivery Location. Bill to location is for the billing address, and the delivery location is for the shipping address.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample32" aria-expanded="false" aria-controls="multiCollapseExample32">
                    What are the terms in the Term Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample32">
                                <div class="p-3">
The Term Master contains two types of Terms: the Payment Terms and the Delivery Terms. The Payment and the Delivery can be monthly, quarterly, half-yearly, or yearly.                                </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample33" aria-expanded="false" aria-controls="multiCollapseExample33">
                 What is the Utility Master?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample33">
                                <div class="p-3">
Utility Master deals with various utilities used in the Properties. Utility details: Code, Name, Type, and Bill, and you can add them to track from them here.                                  </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample34" aria-expanded="false" aria-controls="multiCollapseExample34">
                    What is AMC maintenance?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample34">
                                <div class="p-3">
Annual Maintenance Contract helps to maintain the goods and services without any damages. It prevents repairs with regular care maintenance.                                  </div>
                            </div>
                        </div>
                    </div>
                    
                           <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample35" aria-expanded="false" aria-controls="multiCollapseExample35">
                  How can I use the Document category and Document Type page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample35">
                                <div class="p-3">
Document Category page helps you categorize your documents into various categories and Document Type lets you define the various types of documents maintained by the user.                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="usermanagement">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#usermanagement1" aria-expanded="false" aria-controls="usermanagement1">
                    User Management
                </button>
            </h2>
            <div id="usermanagement1" class="accordion-collapse collapse" aria-labelledby="usermanagement" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample40" aria-expanded="false" aria-controls="multiCollapseExample40">
                      What are the details are to be entered in Organisation Details?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample40">
                                <div class="p-3">
                                    You can enter Organization Code, Name, and Address. Use the Action buttons in the Action column. 
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample41" aria-expanded="false" aria-controls="multiCollapseExample41">
                      What the Department Module contains?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample41">
                                <div class="p-3">
The list contains the names of the organizations and departments. Click the + icon in the upper right corner to add new data.                                 </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample42" aria-expanded="false" aria-controls="multiCollapseExample42">
                     What are the sub-modules located in the User Role Module?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample42">
                                <div class="p-3">
The User Role Module has three sub-modules: Department Roles, Department Modules, and Role Permissions. All have Organisation and Department Names, Roles, Modules, and Codes.                             </div>
                        </div>
                    </div></div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample43" aria-expanded="false" aria-controls="multiCollapseExample43">
                     What is the use of the User Module?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample43">
                                <div class="p-3">
The User Module contains the data of Organizations, Department, Role Name, User IDs, and User Name. The action buttons allow you to reset the password.                            </div>
                        </div>
                    </div>
                     </div>
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample44" aria-expanded="false" aria-controls="multiCollapseExample44">
                      What information is to add to the Workflow page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample44">
                                <div class="p-3">
As the name suggests, it helps you track the workflow by identifying which work front and which specific work tab name. It helps to identify what field and when to.                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="pms">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pms1" aria-expanded="false" aria-controls="pms1">
                 Property Management
                </button>
            </h2>
            <div id="pms1" class="accordion-collapse collapse" aria-labelledby="pms" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample50" aria-expanded="false" aria-controls="multiCollapseExample50">
                     What data can I enter to use the Property Profile?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample50">
                                <div class="p-3">
Enter Property Code, Property Name, and Property Building Number. Use the Actions and Special buttons to add or modify the data.                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample51" aria-expanded="false" aria-controls="multiCollapseExample51">
                     Why is the Property Area Management page required?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample51">
                                <div class="p-3">
Because you can store all your properties on a single page with their details like Area Code, Property Code, and Name. Add properties using the create button and edit the details using the action buttons.                             </div>
                        </div>
                    </div></div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample52" aria-expanded="false" aria-controls="multiCollapseExample52">
                   What are the Property Segments?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample52">
                                <div class="p-3">
Property Segments deal with Flat Code, Name, Number, Property Code, Name, and Status. To edit the details, select the Edit option in the Action column.                   
                                </div></div>
                    </div></div>
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample53" aria-expanded="false" aria-controls="multiCollapseExample53">
                    What is Utility Tagging?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample53">
                                <div class="p-3">
You can track your utilities used in various properties. You can tag all and follow.                         </div>
                    </div>
                     </div></div>
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample54" aria-expanded="false" aria-controls="multiCollapseExample54">
                     What are the Documents Tracking?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample54">
                                <div class="p-3">
Documents Tracking helps you to save and track the status of all the documents related to your properties and your tenants or customers.                        </div>
                    </div>
                </div>
            </div>
                         <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample55" aria-expanded="false" aria-controls="multiCollapseExample55">
                   What is Building History Management?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample55">
                                <div class="p-3">
When you build your flats or houses, you enter their details here. This page saves all the details related to the buildings, and it helps in maintenance.                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="pmc">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pmc1" aria-expanded="false" aria-controls="pmc1">
                  Property Maintenance
                </button>
            </h2>
            <div id="pmc1" class="accordion-collapse collapse" aria-labelledby="pmc" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample60" aria-expanded="false" aria-controls="multiCollapseExample60">
                       What is AMC Management?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample60">
                                <div class="p-3">
                                  Once you have a property, you have to set up the Annual Maintenance Contract (AMC) that includes the Type, Schedule, and Vendor details. To maintain it, you may need the help of suppliers and workers on different periods.  This page has the record of the AMCs are done at various periods varies from weekly to yearly by different vendors. 
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample61" aria-expanded="false" aria-controls="multiCollapseExample61">
                      What are AMC jobs?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample61">
                                <div class="p-3">
AMC jobs refer to the Maintenance jobs available on your properties. It includes maintaining and repairing or servicing. AMC jobs page has priority, cost rates, due dates and status. It helps you determine the priority and also update the status of the AMC jobs with the actual cost. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample62" aria-expanded="false" aria-controls="multiCollapseExample62">
                      How to use the General Maintenance Management feature?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample62">
                                <div class="p-3">
General Maintenance Management is the common maintenance for applicable for the different areas in the property and also set a deadline. You can track the status of the general maintenance items ad update them accordingly. There is also one level of approval process for the created service requests.


                                </div>
                        </div>
                    </div>  </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample63" aria-expanded="false" aria-controls="multiCollapseExample63">
                      What are the details available in AMC Job Tracking?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample63">
                                <div class="p-3">There are four pages entitled to Pending Jobs, Closed Jobs, On hold Jobs, and Cancelled Jobs. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample64" aria-expanded="false" aria-controls="multiCollapseExample64">
                      What is the use of the Pending Jobs Page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample64">
                                <div class="p-3">Pending Jobs Page shows the AMC jobs is yet to start or incomplete in your property. It requires your attention. You can either cancel it or fix it with a solution.  This page helps you track the status and priority of the service required for your clients or tenants.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="purchase">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#purchase1" aria-expanded="false" aria-controls="purchase1">
                 Purchase Management
                </button>
            </h2>
            <div id="purchase1" class="accordion-collapse collapse" aria-labelledby="purchase" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample70" aria-expanded="false" aria-controls="multiCollapseExample70">
                    What is the Purchase Order?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample70">
                                <div class="p-3">
The materials purchases for your property’s requirements can be added to the purchase order. Maintain the vendor details for swift communication and future transaction. Purchase Order is a list that contains Purchase Order number, date, supplier name, prepared by, status, and the total. The data can be sent via email, edited, and viewed using the action buttons found in the action column.
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample71" aria-expanded="false" aria-controls="multiCollapseExample71">
                     What are the Vendor Details?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample71">
                                <div class="p-3">
                                    Vendors are your suppliers for various maintenance/inventory purposes for your properties. Fill in the Supplier details as the supply happens. Click the + icon in the upper right corner to add or create a new supplier list. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                  
                    
                    
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="sales">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sales1" aria-expanded="false" aria-controls="sales1">
                Sales and CRM
                </button>
            </h2>
            <div id="sales1" class="accordion-collapse collapse" aria-labelledby="sales" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample80" aria-expanded="false" aria-controls="multiCollapseExample80">
                      What is the Rent Quote?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample80">
                                <div class="p-3">
                                   The Rent quote is a sample quotation giving to an interested customer regarding the unit in a property. It captures the rent details, security deposit, other customer and property details. If the potential customer is proceeding with the next process, he/she can be directly converted to a tenant using the action button.
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample81" aria-expanded="false" aria-controls="multiCollapseExample81">
                     What is the purpose of the Complaint List?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample81">
                                <div class="p-3">
This features captures the complaints from tenants or by the user themselves to raise new requests to track and resolve them. It could also be related to any recent maintenance activity done and the complaint can be linked to the maintenance Service Request Number. The complaint list includes Complaint Number, Tenant Name, Property Name, Unit Name/ Number, and Record status.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample82" aria-expanded="false" aria-controls="multiCollapseExample82">
                      How do I use the Booking Record and Booking Management Page? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample82">
                                <div class="p-3">
When you potential customer is interested to become a tenant, he/she books the unit in the property. If the unit is vacant, you can creating a new booking by entering the necessary details like Customer Details, Property Details, Rent Details and if any, additional details. You can create a new record and send emails & SMS to add and share the data. 
<br><br>Identify which of your property is vacant or occupied with its number, location, and address. The colors green, red and yellow alert you to the much happening on your property.

                                </div>
                        </div>
                    </div>  </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample83" aria-expanded="false" aria-controls="multiCollapseExample83">
                    How do I use the Notices and Reminders page? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample83">
                                <div class="p-3">
All the reminders and notices are listed here pertaining to the property ensuring that no deadlines are missed.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample84" aria-expanded="false" aria-controls="multiCollapseExample84">
                      Where can I enter the details of the commission percentage, Referrals, Agents, etc.?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample84">
                                <div class="p-3">
You can enter the percentage of the commission to be given for the agents, their details, and referrals on the Commission Calculation page.                       
                                </div>
                            </div>
                        </div>
                    </div>
                        
                          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample85" aria-expanded="false" aria-controls="multiCollapseExample85">
                     How do I search for a specific Property detail quickly? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample85">
                                <div class="p-3">
Go to the Sales and CRM and click Occupancy Chart. Choose from and to dates and select a specific property name or number or address using the drop-down menu, and the Print and download option is available in the upper right corner.                                  </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="contracts">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#contracts1" aria-expanded="false" aria-controls="contracts1">
                 Contract Management
                </button>
            </h2>
            <div id="contracts1" class="accordion-collapse collapse" aria-labelledby="contracts" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample90" aria-expanded="false" aria-controls="multiCollapseExample90">
                   Insurance Creation and Insurance Tagging?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample90">
                                <div class="p-3">
Whenever you buy insurance for any of your properties, you can tag it here for reference and maintenance, so you do not miss the premiums to be paid and maintain it. Create entries for any insurance on your properties, buildings, accessories, and goods. The details must contain Insurance Policy Number, Insurance for, Company, Category, Validity, and Type.
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample91" aria-expanded="false" aria-controls="multiCollapseExample91">
                      Where can I enter and maintain government or municipal agreement details of Properties?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample91">
                                <div class="p-3">
                                On the Contracts Creation page, the system captures all the details of the landlord and the 2nd party Customer in detail with details of the agreed contract terms and conditions, rent details and other miscellaneous charges. You also should input the Municipal Agreement Number, and document for reference purposes.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                   <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample92" aria-expanded="false" aria-controls="multiCollapseExample92">
                     Units Contract Template?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample92">
                                <div class="p-3">
All your contracts differ in their categories and period, so you may need to create new contract templates that match the requirements. This page deals with it efficiently. Click Create Contract Template and proceed with details. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            </div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="tenant">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#tenant1" aria-expanded="false" aria-controls="tenant1">
               Tenant Management
                </button>
            </h2>
            <div id="tenant1" class="accordion-collapse collapse" aria-labelledby="tenant" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample100" aria-expanded="false" aria-controls="multiCollapseExample100">
                    What are the details I can enter in the Tenant Services?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample100">
                                <div class="p-3">
Once the tenant occupies your property, their tenancy starts. Maintain their data to track the list of services active for a particular tenant as agreed upon the contract. There is also a provision to add new services to the tenants. The details can be viewed, edited, and shared via email & SMS, Renewed, and Added.  
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample101" aria-expanded="false" aria-controls="multiCollapseExample101">
                    What is the Purpose of Utility Management? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample101">
                                <div class="p-3">
You can enter various utilities used by your tenants. It helps you with easy billing according to their monthly usage of utilities available in your property. The utilities can be categorized as individual and common, and enter the appropriate monthly readings to create monthly bills for the tenants and track them.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample102" aria-expanded="false" aria-controls="multiCollapseExample102">
                    How to create the Utility Invoices? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample102">
                                <div class="p-3">
                                Along with Rental Invoice, you can create the Utility Invoices towards Maintenance month-wise using the Utility Invoices option under the Tenant Management. Create Utility Invoices with the details of Consumption, Billing Period, Utility Name and Type, and Property Name.
                                </div>
                        </div>
                    </div>  </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample103" aria-expanded="false" aria-controls="multiCollapseExample103">
                   What is the purpose of Charges Tracking?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample103">
                                <div class="p-3">
This page includes pending and received payments. When an amount is due from the tenant, it is seen in the Pending Dues list. Once it is cleared, the system moves it to Received Dues list for easy tracking. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample104" aria-expanded="false" aria-controls="multiCollapseExample104">
                   A few of my tenants want to vacate my property. Where can I add the data for reference? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample104">
                                <div class="p-3">
                                In the Tenant Profiling, there is option for Vacate Notice. Once the vacate notice form page is filled with the necessary information, the vacate period is triggered for the tenant in the Tenant Exit Process. At any time, the tenant can cancel the notice. But if the vacancy is confirmed, then the Process Handover happens with a checklist of the inspection of the unit, if any outstanding dues, etc. Once the unit is approved for handover, the unit becomes vacant and open for next booking.
                                </div>
                            </div>
                        </div>
                    </div>
                        
                          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample105" aria-expanded="false" aria-controls="multiCollapseExample105">
                     What is Tenant Profiling?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample105">
                                <div class="p-3">
It would be ideal to have all your Tenants' details on a single page. The Tenant Profiling Page does just that. Their name, contract period, billing cycle, renewal date, etc. can be seen for reference. It comes in handy when they occupy or vacate your property.                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
</div>
            
        <div class="accordion-item">
            <h2 class="accordion-header" id="finance">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#finance1" aria-expanded="false" aria-controls="finance1">
             Finance and Billing
                </button>
            </h2>
            <div id="finance1" class="accordion-collapse collapse" aria-labelledby="finance" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample110" aria-expanded="false" aria-controls="multiCollapseExample110">
                    When to use the ledger page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample110">
                                <div class="p-3">
The outstanding balance is maintained in the Ledger page. To fulfill finance-related requirements, you can use the ledger page. To check the rental data of your tenants, and to track who has paid the rent and who else is long due. Etc. can be seen separately on the ledger page. Create a new ledger by filing the details like Account Group, code, account name, description, and opening balance and also you can modify the data by “edit” option.
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample111" aria-expanded="false" aria-controls="multiCollapseExample111">
                   What is the use of the Calendar Period?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample111">
                                <div class="p-3">
It helps to define the general calendar period, financial period and the accounting period.
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample112" aria-expanded="false" aria-controls="multiCollapseExample112">
                   Where can I enter my bank details? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample112">
                                <div class="p-3">
You may have many bank accounts from various banks, so this page helps you maintain all your bank records in a single place with their account name, number, address, and other details like swift code. 
                                </div>
                        </div>
                    </div>  </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample113" aria-expanded="false" aria-controls="multiCollapseExample113">
       What is the use of the Earning Deduction page?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample113">
                                <div class="p-3">
The Earnings Deduction page helps you with unique codes and descriptions to bring clarity on deductions in employees' payroll.   
                                </div>
                            </div>
                        </div>
                    </div>
                    
                      <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample114" aria-expanded="false" aria-controls="multiCollapseExample114">
                What are Assets and Liabilities?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample114">
                                <div class="p-3">
Assets are your gain, and the liabilities are your expenses, so you can define the assets and liabilities here in the finance masters. 
                                </div>
                            </div>
                        </div>
                    </div>
                        
                          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample115" aria-expanded="false" aria-controls="multiCollapseExample115">
                    How do I create a new invoice?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample115">
                                <div class="p-3">
Every month to collect the rent from your tenants, you can create invoices in the finance and billing section. You have the option to create a rental invoice and a standard invoice. Click on the appropriate option to proceed. It brings up more options till you get the correct invoice. You can print or download them. 
                                </div>
                    </div>
                </div>  </div>
                    
                         <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample116" aria-expanded="false" aria-controls="multiCollapseExample116">
                   Do I have an option for bulk posting? 
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample116">
                                <div class="p-3">
Yes, you can bulk post your Rent invoices to your various tenants on a single go using the details of Invoice Date, Number, PD Cheque, Property Name, Unit Number, Status, etc. Include action buttons to modify it. 
                                </div>
                    </div>
                </div>
                    </div>
                                 <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample117" aria-expanded="false" aria-controls="multiCollapseExample117">
                    What are the Other Invoice options available?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample117">
                                <div class="p-3">
You have Rent Invoices PDC, General Rent Invoices, Service Invoices, and Other Invoice. Use the Other Invoices for miscellaneous requests if they do not fall into the other invoice category.
                                </div>
                    </div>
                </div>
            </div>
                         <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample118" aria-expanded="false" aria-controls="multiCollapseExample118">
                  What does the Account Receivable page contain?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample118">
                                <div class="p-3">
 You will get the details of Process Invoices, Aging Invoices, Canceled Invoices, and Booked Invoices. Each highlights its features with various details, and action buttons to edit them. Add all Receivable invoices here with different categories.
                                </div>
                    </div>
                </div>
                    
                
            </div>
</div>
</div>
       </div>
            
             <div class="accordion-item">
            <h2 class="accordion-header" id="reports">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#reports1" aria-expanded="false" aria-controls="reports1">
                 Reports and MIS
                </button>
            </h2>
            <div id="reports1" class="accordion-collapse collapse" aria-labelledby="reports" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body row">
                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample150" aria-expanded="false" aria-controls="multiCollapseExample150">
                     How do I download a Tenant Report?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample150">
                                <div class="p-3">
Click on the Generate button, select the format you require, and choose the Tenant Report. Once you click on an option, it brings more options according to your requirements and you can select them and get them generated. 
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample151" aria-expanded="false" aria-controls="multiCollapseExample151">
                     What formats are available for download?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample151">
                                <div class="p-3">
                                You can download your reports in PDF, HTML, EXCEL and CSV. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample152" aria-expanded="false" aria-controls="multiCollapseExample152">
                   Which are the reports I can download?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample152">
                                <div class="p-3">
                                Tenant Report, Correspondence Report, Inventory, and Purchase. You can select the report and a format, and click the “Generate” button. 
 

                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample153" aria-expanded="false" aria-controls="multiCollapseExample153">
                    What is the Report Name?
                    </button>
                    <div class="row">
                        <div class="col">
                            <div class="collapse" id="multiCollapseExample153">
                                <div class="p-3">
                                Report Name involves various reports, and you can choose the one required. Once you select the option, it will bring more options for your convenience and help you find the exact one for your requirement. 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
            </div>
                  
 
           </section>
</main>

  <jsp:include page="../login/footer.jsp" />
    </body>
</html>
