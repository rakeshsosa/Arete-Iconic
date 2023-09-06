<%-- 
    Document   : form1
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Sudhanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="page-title">
                            <div class="title_left">
                                <h3>Form Elements</h3>
                            </div>
                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                    <!--<div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
                                        </span>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>





                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Requisition</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>

                                    </ul>
                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />


                                    <form class="form-inline">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Requisition Name</label>

                                            <input type="text" id="requiredAtLoc" class="form-control">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Requisition Date
                                            </label>                          

                                            <input type="text" placeholder="" id="datepic" class="form-control">


                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Required For
                                            </label>
                                            <input readOnlytype="text"  placeholder="12/3/2016" class="form-control">
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Project Name</label>
                                            <input type="text" placeholder="" class="form-control">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Project Code
                                            </label>
                                            <input type="text" placeholder="" class="form-control">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Project Description
                                            </label>
                                            <input type="text" placeholder="" class="form-control">
                                        </div>








                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">* Name</label>

                                            <input type="text" placeholder="" class="form-control">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Description</label>

                                            <input type="text" placeholder="" class="form-control">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*Required Before
                                            </label>

                                            <input type="text" placeholder="" class="form-control">
                                        </div>
                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">*To Be Delivered At</label>
                                            <input type="password" class="form-control" value="passwordonetwo">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label"> Password</label>
                                            <input type="password" class="form-control" value="passwordonetwo">
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Password</label>
                                            <input type="password" class="form-control" value="passwordonetwo">
                                        </div>	




                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Priority
                                            </label>

                                            <select class="form-control">
                                                <option>Choose option</option>
                                                <option>Option one</option>
                                                <option>Option two</option>
                                                <option>Option three</option>
                                                <option>Option four</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Select</label>

                                            <select class="form-control">
                                                <option>Choose option</option>
                                                <option>Option one</option>
                                                <option>Option two</option>
                                                <option>Option three</option>
                                                <option>Option four</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Select </label>

                                            <select class="form-control">
                                                <option>Choose option</option>
                                                <option>Option one</option>
                                                <option>Option two</option>
                                                <option>Option three</option>
                                                <option>Option four</option>
                                            </select>
                                        </div>

                                        <p>&nbsp;</p>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Checkboxes 
                                            </label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label style="margin-left:30px; width:231px">
                                                        <input type="checkbox" value=""> Please select atleast more than one 
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label style="margin-left:30px; width:231px">
                                                        <input type="checkbox" value=""> Option two.Please select atleast one 
                                                    </label>
                                                </div>
                                                <p></p>


                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Checkboxes</label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value=""> Select atleast more than one
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value=""> Select atleast more than one
                                                    </label>
                                                </div>
                                                <p></p>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios"> Option one
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios"> Option two
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Checkboxes 

                                            </label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value=""> Option one
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value=""> Option two
                                                    </label>
                                                </div>
                                                <p></p>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios"> Option one
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios"> Option two
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Radios

                                            </label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat" checked="checked"> Checked
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat"> Unchecked
                                                    </label>
                                                </div>

                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" checked name="iCheck"> Checked
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" name="iCheck"> Unchecked
                                                    </label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Radios

                                            </label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat" checked="checked"> Checked
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat"> Unchecked
                                                    </label>
                                                </div>

                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" checked name="iCheck"> Checked
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" name="iCheck"> Unchecked
                                                    </label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Radios

                                            </label>

                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat" checked="checked"> Checked
                                                    </label>
                                                </div>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" class="flat"> Unchecked
                                                    </label>
                                                </div>

                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" checked name="iCheck"> Checked
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" class="flat" name="iCheck"> Unchecked
                                                    </label>
                                                </div>

                                            </div>
                                        </div>

                                        <p>&nbsp;</p>


                                        <div class="clearfix"></div>
                                </div> 

                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="submit" class="btn btn-danger" style="">ADD</button>

                                    </div>
                                </div>

                                </form>

                            </div>
                        </div>
                    </div>










                    <div class="clearfix"></div>









                    <div style="overflow: scroll;height: 300px;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                        <table id="example" class="table table-striped responsive-utilities">
                            <thead>
                                <tr>
                                    <th style="background:#425567;color:#fff;">Req name</th>

                                    <th style="background:#425567;color:#fff;">Required Date</th>
                                    <th style="background:#425567;color:#fff;">Required for</th>
                                    <th style="background:#425567;color:#fff;">Project name</th>
                                    <th style="background:#425567;color:#fff;">Required Before</th>
                                    <th style="background:#425567;color:#fff;">Delivered At</th>
                                    <th style="background:#425567;color:#fff;">Priority</th>
                                    <th style="background:#425567;color:#fff;">Action/Remarks</th>

                                </tr>

                                <tr>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td><td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td><td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td><td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td><td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td><td> <input type="text" placeholder="" class="form-control"></td>
                                    <td> <input type="text" placeholder="" class="form-control"></td>
                                </tr>

                            </thead>
                            <tbody id="resourcetable">

                            </tbody>

                        </table>
                    </div>

                    <br/>


                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                            <button type="submit" class="btn btn-primary" style="">SAVE</button>
                            <button type="submit" class="btn btn-danger" style="">CANCEL</button>
                        </div>
                    </div>      







                    <div class="clearfix"></div>

                    <div class="clearfix"></div>                

                    <!-- /page content -->



                </div>

            </div>
        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
