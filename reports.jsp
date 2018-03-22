<%-- 
    Document   : resource_management
    Created on : 20 Jul 2017, 11:56:56 AM
    Author     : MaremaM
--%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
                  
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@include file="navigation_menu_inner.jsp"%>
                <div class="right_col" role="main">
                    <%@include file="top_navigation_inner.jsp" %>
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Reports</h3>
                        </div>
                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Capex Reports</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="searchResourcesDiv" class="x_content">
                                    <div col-md-12 col-sm-12 col-xs-12 form-group pull-right top_search>
                                        <div class="form-group">
                                            <div id="fromDateDiv" class="col-md-12 col-sm-12 col-xs-12 pull-left">
                                                <label class="col-sm-3 control-label">Date:</label>
                                                <div class="col-md-8">
                                                    <fieldset>
                                                        <div class="control-group">
                                                            <div class="controls">
                                                                <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                                                    <input type="text" class="form-control has-feedback-left" id="fromDate" aria-describedby="inputSuccess2Status3" style="margin-left:-10px;">
                                                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="false"></span>
                                                                    <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                                                                    <input id="toDate" value="" type="hidden">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2 pull-right">
                                            <div class="input-group col-md-12 col-sm-12 col-xs-12">
                                                <span class="input-group-btn">
                                                    <button id="btnTimesheetSearch" class="btn btn-default" type="button">Search</button>
                                                    <button id="btnTimesheetClear" class="btn btn-default" type="button">Clear</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div >Toggle column: <a class="toggle-vis" data-column="0">#</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="1" data-name='Project' data-hide=false>Project</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="2" data-name='SubProject' data-hide=false>SubProject</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="3"data-name='Task' data-hide=false>Task</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="4"data-name='Resource' data-hide=false>Resource</a>
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="5"data-name='Role' data-hide=false>Role</a>
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="6" data-name='Status' data-hide=false>Status</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="7" data-name='Priority' data-hide=false>Priority</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="8" data-name='TimeSpent' data-hide=false>Time Spent</a>
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="9" data-name='TimeEstimated' data-hide=false>Time Estimated</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="10" data-name='ExpectedDate' data-hide=false>Expected Date</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="11" data-name='Capex' data-hide=false>Capex</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="12" data-name='Opex' data-hide=false>Opex</a> 
                                    - <a style="color: green; background-color: #ffff42" class="toggle-vis" data-column="13" data-name='Comments' data-hide=false>Comments</a>
                                </div>
								<div id="projectTimesheetsDiv" style="display: none">
									<h2><b><div id="projectTableDesc"/></b></h2>
                                    <table id="projectTable"  cellpadding="0" cellspacing="0" border="1">
                                        <thead id="projectHeaders">
                                        <tbody id="projectContentBody">                                           
                                    </table>
                                </div>
                                <div id="allTimesheetsDiv" class="x_content" style="display: none">
                                    <h2><b><div id="duration"/></b></h2>
                                    <table id="allTimesheetsTable"  cellpadding="0" cellspacing="0" border="1">
                                        <thead id="timesheetHeaders">
                                        <tbody id="timesheetContentBody">                                           
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>      
        <%@include file="updateCapexOpex.jsp"%>
        
        <script type="text/javascript">
            $(document).ready(function () {
                loadDailyReports();
              //  mergeColumns();
                var previousDate = new Date();
                $("#fromDate").datepicker({
                    dateFormat: 'yy/mm/dd',
                    singleDatePicker: true,
                    singleClasses: "picker_3",
                    locale: {
                      format: 'yy/mm/dd'
                    }
                  }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                  });
 
            $('a.toggle-vis').on( 'click', function (e) {          
                var name= $(e.target).data('name');          
                var h=$(e.target).data('hide');          
                if(!h){              
                    $('.' + name).hide();
                    $(e.target).data('hide',true);
                }
                else{              
                      $('.' + name).show();
                       $(e.target).data('hide',false);              
                }  
            }); 
      
            
            $('#btnTimesheetClear').click(function (event) {
                location.reload();
            });
            $("#btnTimesheetSearch").click(function (event) {
                        event.preventDefault();
                        $.ajax({
                            Accept: "application/json",
                            contentType: "application/json",
                            method: "POST",
                            url: "../project/reports",
                            data: JSON.stringify({fromDate : $('#fromDate').val(),
                                                  toDate: $('#fromDate').val()}),
                            dataType: 'json',
                            success: function (data) {
                                console.log(data);
                                var queryTblHeaders = '';
                                var queryTblRows = '';
                                $('#timesheetHeaders').empty();
                                $('#timesheetContentBody').empty();
                                $('#duration').empty();
                                if(data.projects.length === 0){
                                    $('#duration').append('No data found...');
                                } else{
                                $('#duration').append('Monthly Report');
                                queryTblHeaders+="<tr>" +
                                    "<th style=\"width: 3%\">#</th>" +
                                    "<th  style=\"width: 7%\">Project</th>" +
                                    "<th  style=\"width: 7%\">SubProject</th>" +
                                    "<th style=\"width: 10%\">Task</th>" +
                                    "<th  style=\"width: 10%\">Developer</th>" +
                                    "<th  style=\"width: 10%\">Owner</th>" +
                                    "<th  style=\"width: 10%\">Manager</th>"+
                                    "<th  style=\"width: 10%\">Status</th>"+
                                    "<th  style=\"width: 10%\">Priority</th>"+
                                    "<th  style=\"width: 10%\">Time Spent</th>"+
                                    "<th  style=\"width: 10%\">Time Estimated</th>"+
                                    "<th  style=\"width: 10%\">Comments</th>";
                                queryTblHeaders+="</tr>";                            
                                for(p = 0; p < data.projects.length; p++){
                                    var table1 = '';
                                    var table2 = '';
                                    var table3 = '';
                                    var table4 = '';
                                    var table5 = '';
                                    var projectId = p+1;
                                    queryTblRows += "<tr style=\"outline: thin solid\"><td>" + projectId + "</td>" +
                                                    "<td><b>" + data.projects[p].parentName + "</b></td>"+
                                                     "<td><b>" + data.projects[p].name + "</b></td>";
                                    table1 += "<table style=\"width: -webkit-fill-available\">";
                                    table2 += "<table style=\"width: -webkit-fill-available\">";
                                    table3 += '<table style=\"width: -webkit-fill-available\">';
                                    table4 += '<table style=\"width: -webkit-fill-available\">';
                                    table5 += '<table style=\"width: -webkit-fill-available\">';
                                    for(d=0; d<data.projects[p].tasks.length; d++){
                                        table1 +="<tr style=\"outline: thin solid\"><td><b>" + data.projects[p].tasks[d].name + "</b></td></tr>";
                                        table2+="<tr style=\"outline: thin solid\"><td><b>" + data.projects[p].tasks[d].assignedTo.fullNames + "</b></td></tr>";
                                        table3+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].timeSpent + "</td></tr>";
                                        table4+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].estimateHours + "</td></tr>";
                                        table5+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].comments[0].comment + "</td></tr>";
                                    }    
                                        queryTblRows += "<td>" + table1 + "</table></td>";
                                        queryTblRows += "<td>" + table2 + "</table></td>";
                                        queryTblRows += "<td>" + data.projects[p].projectOwner.fullNames + "</td>";
                                        queryTblRows += "<td>" + data.projects[p].projectManager.fullNames + "</td>";
                                        queryTblRows += "<td>" + statusAsString(data.projects[p].status) + "</td>";
                                        queryTblRows += "<td>" + data.projects[p].priority + "</td>";
                                        queryTblRows += "<td>" + table3 + "</table></td>";
                                        queryTblRows += "<td>" + table4 + "</table></td>";
                                        queryTblRows += "<td>" + table5 + "</table></td>";
                                        queryTblRows += "</tr>";
                                }
    //                            $('#searchResourcesDiv').hide();
                                $('#timesheetHeaders').append(queryTblHeaders);
                                $('#timesheetContentBody').append(queryTblRows);                            
                                }
                                $('#allTimesheetsDiv').toggle();
                            },
                            error: function (data) {
                                alert("An error occured trying upload file: \n" + JSON.parse(data));
                                $.loader.close(true);
                            }
                        });
                    });
                    
            $('#cancelUpdateTaskBtn').click(function(event) {
                location.reload();
            });
                    
            $('#updateBtn').click(function(event) {
                //$('#projectDetailsForm').loader($data);

                console.log('timespent: '+sessionStorage.getItem("timeSpent"));
                console.log('taskId '+sessionStorage.getItem("taskId"));
                console.log('projectId '+sessionStorage.getItem("projectId"));
                console.log('devName '+sessionStorage.getItem("devName"));
                var randVal = $('#randValueTxt').val();
                console.log('RandVal: '+randVal);
                console.log('capex: '+(randVal*sessionStorage.getItem("timeSpent")));
                console.log('billingoption selected: '+$( 'input[name=billingRadios]:checked' ).val());

                $.ajax({                    
                    Accept : "application/json",
                    contentType: "application/json",
                    method: "POST",
                    url: "../project/updateCapexOpex",
                    data:JSON.stringify({
                        capex:$('#resCapexVal').text(),
                        opex:$('#resOpexVal').text(),
                        id:sessionStorage.getItem("projectId"),
                        taskId:sessionStorage.getItem("taskId"),
                        randVal:sessionStorage.getItem("randVal"),
                        timeSpent:sessionStorage.getItem("timeSpent"),
                        devName:sessionStorage.getItem("devName"),
                        billingOption:$( 'input[name=billingRadios]:checked' ).val()
                    }),
                    dataType:'json',
                    success: function(data) {
                        alert('Capex/opex successfully updated...');
                           location.reload();
                    },
                    error: function(data){
                        alert("An error occured trying to update capex opex: \n");
                        $.loader.close(true);
                    }

            });
        });
        
        $('[name=billingRadios]').change(function(event){
            var billingOpt = $( 'input[name=billingRadios]:checked' ).val();
            if(billingOpt == 'Capex'){
                $('#splitDiv').hide();
            }else if(billingOpt == 'Opex'){
                $('#splitDiv').show();
            }
            calculateCapexOpex();
        });
        
        $('#randValueTxt').change(function(){
           
           calculateCapexOpex();
        
        });
        
        $('#splitPercent').change(function(){
           
           calculateCapexOpex();
        
        });
        
    });
    
            function calculateCapexOpex(){
                var randVal = $('#randValueTxt').val();
                var timeSpent = $('#timeSpent').text();
                var capexVal = 0;
                var opexVal = 0;

                var billingOpt = $( 'input[name=billingRadios]:checked' ).val();

                // check if randVal is not a number, if yes throw error 

                if(billingOpt == 'Capex'){
                    capexVal = randVal*timeSpent;
                }else if(billingOpt == 'Opex'){
                    var splitBy = $('#splitPercent').val();
                    opexVal = ((randVal*timeSpent)*splitBy)/100;
                    capexVal = ((randVal*timeSpent)*(100 - splitBy))/100;
                }

                $('#resCapexVal').text(capexVal);
                $('#resOpexVal').text(opexVal);
            }
            // updateCapexOpex
            //$('.task').on('click', function(event) {
            function showPopUp(timeSpent, taskId, projectId, devName, parentProjName, subProjName, taskName){
               console.log('task cked');
               sessionStorage.setItem('timeSpent',timeSpent);
               sessionStorage.setItem('taskId',taskId);
               sessionStorage.setItem('taskName',taskName);
               sessionStorage.setItem('projectId',projectId);
               sessionStorage.setItem('projectName',parentProjName);
               sessionStorage.setItem('subProjName',subProjName);
               sessionStorage.setItem('devName',devName);
               
               $('#updateCapexOpexDialog').dialog({
                    height: 410,
                    width: 750,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function(event, ui) { 
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                          .removeClass("ui-icon-closethick")
                          .removeClass("ui-icon")
                          .addClass("ui-icon-closedia");
                    }
                }); 
                
                $('#projectName').text(parentProjName);
                $('#subProjectName').text(subProjName);
                $('#taskName').text(taskName);
                $('#resourceName').text(devName);
                $('#timeSpent').text(timeSpent);
                
            }
    
    
                
    function statusAsString(status) {
                var val;
                switch (status) {
                    case 0:
                        val = 'New';
                        break;
                    case 1:
                        val = 'In Progress';
                        break;
                    case 2:
                        val = 'Completed';
                        break;
                    default:
                        val = 'N/A';
                        break;
                }
                return val;
            }
            
    function loadDailyReports(){
        $(document).ready(function() {
            var table = $('#allTimesheetsTable.timesheetHeaders').DataTable();

        $('a.toggle-vis').on( 'click', function (e) {
            e.preventDefault(); 
                // Get the column API object
                var column = table.column( $(this).attr('data-column') );          
                // Toggle the visibility
                column.visible( ! column.visible() );
            } );   
            
            
        });
        $.ajax({
            Accept: "application/json",
            contentType: "application/json",
            method: "POST",
            url: "../project/reports",
            data: JSON.stringify({fromDate : $('#fromDate').val(),
                                  toDate: $('#fromDate').val()}),
            dataType: 'json',
            success: function (data) {
                console.log("--> Report" + JSON.stringify(data));
                var queryTblHeaders = '';
                var queryTblRows = '';
                $('#timesheetHeaders').empty();
                $('#timesheetContentBody').empty();
                $('#duration').empty();
                if(data.projects.length === 0){
                    $('#duration').append('No data found...');
                } else{
                $('#duration').append('Capex Report');
                queryTblHeaders+="<tr>" +
                    "<th style=\"width: 3%\">#</th>" +
                    "<th class='Project' style=\"width: 15%\">Project</th>" +
                    "<th class='SubProject'  style=\"width: 15%\">SubProject</th>" +
                    "<th class='Task' style=\"width: 15%\">Task</th>" +
                    "<th class='Resource' style=\"width: 10%\">Resource</th>"+
                    "<th class='Role' style=\"width: 10%\">Role</th>"+
                    "<th class='Status' style=\"width: 3%\">Status</th>"+
                    "<th class='Priority' style=\"width: 3%\">Priority</th>"+
                    "<th class='TimeSpent' style=\"width: 5%\">Time Spent</th>"+
                    "<th class='TimeEstimated' style=\"width: 5%\">Time Estimated</th>"+                                
                    "<th class='ExpectedDate' style=\"width: 5%\">Expected Date</th>"+ 
                    "<th class='Capex' style=\"width: 3%\">Capex</th>"+ 
                    "<th class='Opex' style=\"width: 3%\">Opex</th>"+ 
                    "<th class='Comments' style=\"width: 5%\">Comments</th>";
                queryTblHeaders+="</tr>";

                for(p = 0; p < data.projects.length; p++){
                    var table1 = '';
                    var table2 = '';
                    var table3 = '';
                    var table4 = '';
                    var table5 = '';
                    var table6 = '';
                    var table7 = '';
                    var table8 = ''; 
                    var table9 = '';
                    var projectId = p;                                
                    queryTblRows += "<tr  ><td>" + projectId + "</td>" +
                                   "<td class='Project'>" + data.projects[p].parentName + "</td>"+
                                     "<td class='SubProject'><b>" + data.projects[p].name + "</b></td>";
                            
                    table1 += "<table style=\"width: -webkit-fill-available\">";
                    table2 += "<table style=\"width: -webkit-fill-available\">";
                    table3 += '<table style=\"width: -webkit-fill-available\">';
                    table4 += '<table style=\"width: -webkit-fill-available\">';
                    table5 += '<table style=\"width: -webkit-fill-available\">';
                    table6 += '<table style=\"width: -webkit-fill-available\">';
                    table7 += '<table style=\"width: -webkit-fill-available\">';
                    table8 += '<table style=\"width: -webkit-fill-available\">';                    
                    table9 += '<table style=\"width: -webkit-fill-available\">';
                    
                    var selTaskData = {};
                    var devName = '';
                    var username = '<%=loginData.getUsername()%>';
                    var role = '<%=loginData.getRole().getId()%>';
                    
                    for(d=0; d<data.projects[p].tasks.length; d++){

                        devName = data.projects[p].tasks[d].developer;
                        console.log("DevName: "+devName);
                        selTaskData.devName = devName;
                        
                        //table1 +="<tr style=\"outline: thin solid\"><td><b>" + data.projects[p].tasks[d].name + "</b></td></tr>";if (role === '46' || role === '6' || role === '45' || role === '44' || role === '5' || role === '61' || role === '62') {
                        if (role === '61' || role === '62') {
                            table1 +="<tr id=\"task"+data.projects[p].tasks[d].id+"\" style=\"outline: thin solid\"><td><b><a class=\"task\" href=\"#\" "+
                                    "onclick=\"showPopUp("
                                    +data.projects[p].tasks[d].timeSpent+","
                                    +data.projects[p].tasks[d].id+","
                                    +data.projects[p].id+",'"
                                    +devName+"','"
                                    +data.projects[p].parentName+"','"
                                    +data.projects[p].name+"','"
                                    +data.projects[p].tasks[d].name+"')\">" 
                                    +data.projects[p].tasks[d].name + "</a></b></td></tr>";
                        
                            table2 +="<tr style=\"outline: thin solid\"><td> <b><a class=\"task\" href=\"#\" "+
                                    "onclick=\"showPopUp("
                                    +data.projects[p].tasks[d].timeSpent+","
                                    +data.projects[p].tasks[d].id+","
                                    +data.projects[p].id+",'"
                                    +devName+"','"
                                    +data.projects[p].parentName+"','"
                                    +data.projects[p].name+"','"
                                    +data.projects[p].tasks[d].name+"')\">" 
                                    + data.projects[p].tasks[d].developer + "</a></b></td> </tr>";
                        } else {
                        
                            table1 +="<tr id=\"task"+data.projects[p].tasks[d].id+"\" style=\"outline: thin solid\"><td><b>"
                                + data.projects[p].tasks[d].name + "</b></td></tr>";
                        
                            table2 +="<tr style=\"outline: thin solid\"><td> <b>"
                                + data.projects[p].tasks[d].developer + "</b></td> </tr>";
                        }
                        //table2 +="<tr style=\"outline: thin solid\"><td>" + data.projects[p].owner + "</td> </tr>";
                        //table2 +="<tr style=\"outline: thin solid\"><td>" + data.projects[p].manager + "</td> </tr>"; 
                        table3+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].timeSpent + "</td></tr>";
                        table4+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].estimateHours + "</td></tr>";
                        table5+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].expectedDate + "</td></tr>";
                        table6+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].capex + "</td></tr>";
                        table7+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].opex + "</td></tr>";
                        table8+="<tr style=\"outline: thin solid\"><td>" + data.projects[p].tasks[d].comments[0].comment + "</td></tr>";                        
                        table9 +="<tr style=\"outline: thin solid\"><td> <b>" + data.projects[p].tasks[d].devRole + "</b></td> </tr>";
                        //table9 +="<tr style=\"outline: thin solid\"><td>" + data.projects[p].ownerRole + "</td> </tr>";
                        //table9 +="<tr style=\"outline: thin solid\"><td>" + data.projects[p].mngrRole + "</td> </tr>"; 
                    }    
                        queryTblRows += "<td class='Task'>" + table1 + "</table></td>";
                        queryTblRows += "<td class='Resource'>" + table2 + "</table></td>";
                        queryTblRows += "<td class='Role'>" + table9 + "</table></td>";
                        queryTblRows += "<td class='Status'>" + statusAsString(data.projects[p].status) + "</td>";
                        queryTblRows += "<td class='Priority'>" + data.projects[p].priority + "</td>";
                        queryTblRows += "<td class='TimeSpent'>" + table3 + "</table></td>";
                        queryTblRows += "<td class='TimeEstimated'>" + table4 + "</table></td>";
                        queryTblRows += "<td class='ExpectedDate'>" + table5 + "</table></td>";
                        queryTblRows += "<td class='Capex'>" + table6 + "</table></td>";
                        queryTblRows += "<td class='Opex'>" + table7 + "</table></td>";
                        queryTblRows += "<td class='Comments'>" + table8 + "</table></td>";
                        queryTblRows += "</tr>";
                }
                $('#timesheetHeaders').append(queryTblHeaders);
                $('#timesheetContentBody').append(queryTblRows);                            
                }
                $('#allTimesheetsDiv').toggle();
                
                $('#timesheetContentBody > tr').each(function () {
                        //var Column_number_to_Merge = 2;
                        var Previous_TD = null;
                        var i = 1;
                        $('.Project').each(function () {                            
                            if (Previous_TD === null) {
                                Previous_TD = $(this);
                                i = 1;
                            }
                            else if(Previous_TD.html()==$(this).html()){
                                $(this).empty();                           
                                $(this).css('border-top','solid 1px #FFF');
                            }
                            else{                                
                                Previous_TD = $(this);                                
                            }                                 
                        });
                    }); 
            },
            error: function (data) {
                alert("An error occured trying upload file: \n" + JSON.parse(data));
                $.loader.close(true);
            }
        });
 
    }
        </script>
    </body>
</html>
