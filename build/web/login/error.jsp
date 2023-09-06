<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title></title>




        <link rel="stylesheet" href="../common/theme/css2/style.css">
        <!-- bjqs.css contains the *essential* css needed for the slider to work -->
        <link rel="stylesheet" href="../common/theme/css2/bjqs.css">

        <!-- some pretty fonts for this demo page - not required for the slider -->
        <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300' rel='stylesheet' type='text/css'> 

        <!-- demo.css contains additional styles used to set up this demo page - not required for the slider --> 
        <link rel="stylesheet" href="../common/theme/css2/demo.css">

        <!-- load jQuery and the plugin -->
        <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
        <script src="../common/theme/js2/bjqs-1.3.min.js"></script>

        <style>
            body{
                font-family:calibri,verdana,Arial, Helvetica, sans-serif;
                background: #F4F5FC;
            }
        </style>


    </head>

    <body>
        <div class="loginheader">
            <div style="margin-left: 31px; font-weight: bold; font-size: 17px;padding-top: 12px;">
                <span>Excel Business Solutions</span></div>
            <div>
                <img  style="float: right; margin-top:-24px; width:123px; height:27px; margin-right: 23px" src="../common/theme/images/arete-logo.png">
            </div>
        </div>



        <div id="container" style="margin-left:130px;">







            <!--  Outer wrapper for presentation only, this can be anything you like -->

            <!-- End outer wrapper -->

            <!-- attach the plug-in to the slider parent element and adjust the settings as required -->



            <!-- 
              The following script is not related to basic jQuery Slider 
              It's used to create the code snippets in the demo.
              https://github.com/maelstrom/SecretSource
            -->




            <div class="loginpanel"  style="width: 50%; height: 200px;margin-top: 20%;margin-left: 23%;background-color: white;padding: 10px; border: 2px solid gray;">
                <div style="width:100% ;height: 30% ;background-color:#0F5FCC;border: 2px solid gray;">

                    <p style="text-align: center;color: white">Session Expired </p>

                    <!--                <h1>Your login session has expired</h1>
                                    <p>Please Log in again<br>
                                        <a href="../login/login.htm"><span class="error"> Home</span></a>
                                    </p>-->


                </div>

                <p> <img src="../login/hazard.jpeg" style="width: 8%;margin-bottom: -2%">Your session time has expired! Please re-login to
                    continue.
                </p>
                <div>

                    <button id="login" onclick="window.location.href = '../login/login.htm'" style="margin-left: 35% ">Log in</button>
                </div> 
            </div>  



        </div>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    </body>
</html>
