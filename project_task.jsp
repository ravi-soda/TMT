<%-- 
    Document   : project_task
    Created on : 07 Aug 2017, 10:27:01 AM
    Author     : MaremaM
--%>
<%@page import="za.co.trudon.tmt.data.type.response.ProjectTask"%>
<%@page import="za.co.trudon.tmt.data.type.request.LoginData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Bootstrap -->
        <link href="../../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Select2 -->
        <link href="../../../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="../../../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
        <!-- starrr -->
        <link href="../../../vendors/starrr/dist/starrr.css" rel="stylesheet">

        <!-- iCheck -->
        <link href="../../../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="../../../css/jquery-comments.css">
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">

                <%@include file="navigation_menu_inner.jsp"%>

                <!-- /top navigation -->

                <!-- page content -->
                <!-- page content -->
                <div class="right_col" role="main">
                    <%@include file="top_navigation_inner.jsp" %>
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>Tasks Management</h3>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12">
                                    <div class="input-group">
                                        <label id="msg"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2><label id="taskName"></label></h2>                   
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="x_content">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <!-- Start of Tabs -->

                                            <div class="x_panel" style="overflow-y: scroll">
                                                <div class="x_content">

                                                    <!-- start task list -->
                                                    <table class="table table-striped projects">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 10%">Daily Update</th>
                                                                <th style="width: 10%">Delete</th>
                                                                <th style="width: 10%">Task Name</th>
                                                                <th style="width: 10%">Owner</th>
                                                                <th style="width: 10%">Creation Date</th>
                                                                <th style="width: 10%">Assigned To</th>
                                                                <th style="width: 10%">Last Modified Date</th>
                                                                <th style="width: 10%">Status</th>
                                                                <th style="width: 10%">Priority</th>
                                                                <th style="width: 10%">Timeline</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="taskBody">

                                                        </tbody>
                                                    </table>
                                                    <p><p/>
                                                    <div class="row">
                                                        <div class="col-sm-8 col-sm-offset-4 pull-left">
                                                            <div class="btn-toolbar">
                                                                <div id="backButton"></div>
                                                                <div id="addSubTaskButton"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="x_panel" style="overflow-y: scroll">
                                                <div class="row">
                                                    <label class="col-sm-3 control-label">Comments</label>

                                                    <div id="comments-container"></div>
                                                </div>
                                            </div>

                                        </div> 

                                    </div>      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <!-- /page content -->


                <%@include file="task_comment_modal.jsp"%>
                <%@include file="project_resource_modal.jsp"%>
                <%@include file="update_task_modal.jsp"%>
                <%@include file="add_sub_task_modal.jsp"%>
                <%@include file="add_sub_task_comment_modal.jsp"%>
                <%@include file="daily_task_update_modal.jsp" %>


            </div>
        </div>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.textcomplete/1.8.0/jquery.textcomplete.js"></script>
        <script type="text/javascript" src="../../../js/comments-data.js"></script>
        <script type="text/javascript" src="../../../js/jquery-comments.js"></script>

        <script type="text/javascript">

            var newResourceWindow = true;
           var jsProject = ${resourceProject};
           var taskStatus = JSON.stringify(${taskStatuses});
            $.each(JSON.parse(taskStatus), function (idx, val) {
                $("#addSubTaskStatusSelect").append("<option value='" + idx + "'>" + val + "</option>");
            });
           var severities = JSON.stringify(${severities});
            $.each(JSON.parse(severities), function (idx, val) {
                $("#addSubTaskSeverity").append("<option value='" + idx + "'>" + val + "</option>");
            });
           var priorities = JSON.stringify(${priorities});
            $.each(JSON.parse(priorities), function (idx, val) {
                $("#addSubTaskPriority").append("<option value='" + idx + "'>" + val + "</option>");
            });
           var task = ${projectTask};
           var username = '<%=loginData.getUsername()%>';
           var role = '<%=loginData.getRole().getId()%>';

            $('#taskName').text(task.description + ' - ' + task.assignedTo.fullNames + " - " + jsProject.name);

            for (i = 0; i < jsProject.tasks.length; i++) {
                if (jsProject.tasks[i].parentId === task.id) {
                    if (role === '46' || role === '6' || role === '45' || role === '44' || role === '5' || role === '61' || role === '62') {
                        $('#taskBody').append("<tr><td><button id=\"UpdateTaskBtn\" onclick=\"onDailyUpdate(" + jsProject.tasks[i].id + ")\" class=\"btn-primary btn\">Update</button></td>" +
                        "<td><button id=\"DeleteTaskBtn\" class=\"btn-danger btn\">Delete</button></td><td><a style=\"cursor:pointer\" href=\"#\" onclick=\"updateTask(" + jsProject.tasks[i].id + ")\"><b>" + jsProject.tasks[i].name + "</b></a></td><td>" + jsProject.tasks[i].createdby.fullNames + "</td><td>" +
                            jsProject.tasks[i].createdDate + "</td><td>" + jsProject.tasks[i].assignedTo.fullNames + "</td><td>" + jsProject.tasks[i].updatedDate + "</td><td>" +
                            statusAsString(jsProject.tasks[i].status) + "</td><td>" + jsProject.tasks[i].priority + "</td><td>" + jsProject.tasks[i].estimateDays + "</td></tr>");
                    } else {
                        $('#taskBody').append("<tr><td></td><td></td>");
                    }
                    
                }
            }

            if (role === '46' || role === '6' || role === '45' || role === '44' || role === '5' || role === '61' || role === '62') {
                $('#backButton').append("<a class=\"btn-primary btn\" href=\"../../tasks\">Back</a>");
                $('#addSubTaskButton').append('<button id=\"addSubTask\" class=\"btn-primary btn\">Add Task</button>');
            } else {
                $('#backButton').append("<a class=\"btn-primary btn\" href=\"../id/" + task.projectId + "\">Back</a>");
            }
            var previousDate = new Date();

            
            $('#dailyUpdateDate').daterangepicker({
                
                }, function(start, end, label) {
                    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                    
                    var currDate = moment(start).startOf('day');
                    var lastDate = moment(end).startOf('day');

                   
                    var tblHeaders = '';
                    var tblRows = '';
                    
                    tblHeaders+="<tr>";
                    tblRows+="<tr>";
                    $('#taskTimesheetHeaders').empty();
                    $('#taskTimesheetContentBody').empty();
                    
                    while(currDate.diff(lastDate) <= 0) {
                        console.log(currDate.toDate());
                        tblHeaders+="<th style=\"width: 3%\">"+currDate.format('DD/MM/YYYY')+"</th>";
                        tblRows+="<td  data-date="+currDate.format('DD/MM/YYYY')+"><input type=\"text\" class=\"form-control hrsWorked\"></td>";
                        currDate = currDate.add(1, 'days');
                    }
                    tblHeaders+="</tr>";
                    tblRows+="</tr>";
                    
                    $('#taskTimesheetHeaders').append(tblHeaders);
                    $('#taskTimesheetContentBody').append(tblRows); 
                });

            $("#fromDate").datepicker({
                showWeek: true,
                singleDatePicker: true,
                singleClasses: "picker_3",
                maxDate: new Date(),
                locale: {
                  format: 'DD/MM/YYYY'
                }
              }, function(start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
              });
            $("#toDate").datepicker({
                showWeek: true,
                singleDatePicker: true,
                singleClasses: "picker_3",
                maxDate: new Date(),
                locale: {
                  format: 'DD/MM/YYYY'
                }
              }, function(start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
              });  
            $('#assigneeTxt').devbridgeAutocomplete({
                minChars: 2,
                serviceUrl: '../search_resource',
                preventBadQueries: false,
                zIndex: 2147483647,
                type: 'POST',
                showNoSuggestionNotice: true,
                noSuggestionNotice: 'No Matching Names - Please use ask admistrator to add user"',
                success: function (data) {
                    var out = $.parseJSON(data);
                    response($.each(out, function (i, item) {

                        return {

                            label: item.value,
                            value: item.data
                        };
                    }));
                },
                onSelect: function (suggestion) {
                    $('#assigneeTxtHidden').val(suggestion.data);
                    $('#assigneeEmailHidden').val(suggestion.email);
                }
            });

            $('#updateAssigneeTxt').devbridgeAutocomplete({
                minChars: 2,
                serviceUrl: '../search_resource',
                preventBadQueries: false,
                zIndex: 2147483647,
                type: 'POST',
                showNoSuggestionNotice: true,
                noSuggestionNotice: 'No Matching Names - Please use ask admistrator to add user"',
                success: function (data) {
                    var out = $.parseJSON(data);
                    response($.each(out, function (i, item) {

                        return {

                            label: item.value,
                            value: item.data
                        };
                    }));
                },
                onSelect: function (suggestion) {
                    $('#updateAssigneeTxtHidden').val(suggestion.data);
                }
            });

            function onDailyUpdate(selectedTaskId) {
                for (i = 0; i < jsProject.tasks.length; i++) {
                    if (jsProject.tasks[i].id === selectedTaskId) {
                        $("#dailyUpdateTaskNameTxt").prop('disabled', true);
                        $("#dailyUpdateTaskDescTxt").prop('disabled', true);
                        $("#dailyUpdateTaskStatusSelect").empty();
                        $('#dailyUpdateTaskNameTxt').val(jsProject.tasks[i].name);
                        $('#dailyUpdateTaskDescTxt').val(jsProject.tasks[i].description);
                        $.each(JSON.parse(taskStatus), function (idx, val) {
                            if (idx === jsProject.tasks[i].status) {
                                console.log("status " + val + " " + idx);
                                $("#dailyUpdateTaskStatusSelect").append("<option value='" + idx + "' selected = 'selected'>" + val + "</option>");
                            } else {
                                $("#dailyUpdateTaskStatusSelect").append("<option value='" + idx + "'>" + val + "</option>");
                            }
                        });
                    }
                }
                $('#dailyTaskUpdateDialog').dialog({
                    height: 530,
                    width: 700,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function (event, ui) {
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                                .removeClass("ui-icon-closethick")
                                .removeClass("ui-icon")
                                .addClass("ui-icon-closedia");
                    }
                });
                $('#cancelDailyUpdateBtn').click(function (event) {
                    //clear the form
                    $('#dailyTaskUpdateDialog').dialog("close");
                });
                $("#dailyUpdateForm").submit(function (event) {
                    event.preventDefault();
                    validateDailyUpdate();
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        Accept: "application/json",
                        contentType: "application/json",
                        method: "POST",
                        url: "../../tasks/subtask/daily/update/" + username + "/" + $('#dailyUpdateCommentTxt').val(),
                        data: JSON.stringify({projectId: jsProject.id,
                            taskId: selectedTaskId,
                            hoursWorked: $('#hoursWorkedTxt').val(),
                            fromDate: $('#fromDate').val(),
                            toDate: $('#toDate').val(),
                            taskStatus: $("#dailyUpdateTaskStatusSelect").val(),
                            timeSheets: getHrsWorked()
                        }),
                        dataType: 'json',
                        success: function (data) {
                           alert('Task successfully updated...');
                           location.reload();
                        },
                        error: function (data) {
                            alert("An error occured trying to update task: \n" + JSON.parse(data));
                        }
                    });
                });
            }

            function getHrsWorked(){
                var tds = $('#taskTimesheetContentBody').find('tr').find('td');
                var timeSheets = {};
                var timeSheetData = {};
                tds.each(function(){
                   var hrs = $(this).find('.hrsWorked').val();
                   var date = $(this).data('date');
                   
                   timeSheetData.date = date;
                   timeSheetData.hrs = hrs;
                   timeSheets.push(timeSheetData);
                   timeSheetData = {};
                   console.log(date+': '+hrs);
                });
                return timeSheets;
            }

            function updateTask(selectedTaskId) {
                for (i = 0; i < jsProject.tasks.length; i++) {
                    if (jsProject.tasks[i].id === selectedTaskId) {
                        $("#updateSubTaskSeverity").empty();
                        $("#updateSubTaskStatusSelect").empty();
                        $("#updateSubTaskPriority").empty();
                        $('#updateSubTaskNameTxt').val(jsProject.tasks[i].name);
                        $('#updateSubTaskParentHidden').val(jsProject.tasks[i].parentId)
                        $('#updateSubTaskDescTxt').val(jsProject.tasks[i].description);
                        $('#updateAssigneeTxt').val(jsProject.tasks[i].assignedTo.fullNames);
                        $('#updateAssigneeTxtHidden').val(jsProject.tasks[i].assignedTo.userName);
                        $('#updateSubTaskEstimateDays').val(jsProject.tasks[i].estimateDays);
                        $('#updateSubTaskEstimateHours').val(jsProject.tasks[i].estimateHours);
                        $.each(JSON.parse(taskStatus), function (idx, val) {
                            if (idx === jsProject.tasks[i].status) {
                                console.log("status " + val + " " + idx);
                                $("#updateSubTaskStatusSelect").append("<option value='" + idx + "' selected = 'selected'>" + val + "</option>");
                            } else {
                                $("#updateSubTaskStatusSelect").append("<option value='" + idx + "'>" + val + "</option>");
                            }
                        });
                        $.each(JSON.parse(severities), function (idx, val) {
                            if (idx === jsProject.tasks[i].severity) {
                                console.log("severity " + val + " " + idx);
                                $("#updateSubTaskSeverity").append("<option value='" + idx + "' selected = 'selected'>" + val + "</option>");
                            } else {
                                $("#updateSubTaskSeverity").append("<option value='" + idx + "'>" + val + "</option>");
                            }
                        });
                        $.each(JSON.parse(priorities), function (idx, val) {
                            if ((++idx) === jsProject.tasks[i].priority) {
                                console.log("priority " + val + " " + idx);
                                $("#updateSubTaskPriority").append("<option value='" + idx + "' selected = 'selected'>" + val + "</option>");
                            } else {
                                $("#updateSubTaskPriority").append("<option value='" + idx + "'>" + val + "</option>");
                            }
                        });
                    }
                }
                $('#subTaskDialog').dialog({
                    height: 700,
                    width: 700,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function (event, ui) {
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                                .removeClass("ui-icon-closethick")
                                .removeClass("ui-icon")
                                .addClass("ui-icon-closedia");
                    }
                });
                $('#cancelSubTaskUpdateBtn').click(function (event) {
                    //clear the form
                    $('#subTaskDialog').dialog("close");
                });
                $('#updateSubTaskBtn').click(function (event) {
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        Accept: "application/json",
                        contentType: "application/json",
                        method: "POST",
                        url: "../../tasks/subtask/update",
                        data: JSON.stringify({projectId: jsProject.id,
                            id: selectedTaskId,
                            description: $('#updateSubTaskDescTxt').val(),
                            parentId : $('#updateSubTaskParentHidden').val(),
                            assignedTo: {userName: $('#updateAssigneeTxtHidden').val(), fullNames: $('#updateAssigneeTxt').val(), email: ''},
                            updateBy: {userName: username, fullNames: '', email: ''},
                            name: $('#updateSubTaskNameTxt').val(),
                            estimateDays: $('#addSubTaskEstimateDay').val(),
                            estimateHours: $('#addSubTaskEstimateHour').val(),
                            severity: $('#updateSubTaskSeverity  option:selected').val(),
                            status: $('#updateSubTaskStatusSelect option:selected').val(),
                            priority: $('#updateSubTaskPriority option:selected').val(),
                            comments: [{comment: $('#updateSubTaskComment').val(), taskId: selectedTaskId, username: username}]
                        }),
                        dataType: 'json',
                        success: function (data) {
                            alert('Task successfully updated...');
                            location.reload();
                        },
                        error: function (data) {
                            alert("An error occured trying to save project: \n" + JSON.parse(data));
                        }
                    });
                });
            }

            function addComment(taskId) {
                $('#subTaskCommentDialog').dialog({
                    height: 300,
                    width: 700,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function (event, ui) {
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                                .removeClass("ui-icon-closethick")
                                .removeClass("ui-icon")
                                .addClass("ui-icon-closedia");
                        //alert("call resource list");
                    }
                });
                $('#cancelSubTaskCommentBtn').click(function (event) {
                    //clear the form
                    $('#subTaskCommentDialog').dialog("close");
                });

                $('#saveSubTaskCommentBtn').click(function (event) {
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        Accept: "application/json",
                        contentType: "application/json",
                        method: "POST",
                        url: "../../tasks/comment",
                        data: JSON.stringify({comment: $('#subTaskComment').val(),
                            taskId: taskId,
                            username: username
                        }),
                        dataType: 'json',
                        success: function (data) {
                            alert('Comment added...');
                            $('#subTaskCommentDialog').dialog("close");
                            location.reload();
                        },
                        error: function (data) {
                            alert("An error occured trying to save comment: \n" + JSON.parse(data));
                        }
                    });
                });

            }

            $('#addSubTask').click(function (event) {
                $('#parentTaskNameTxt:disabled').val(task.name);
                event.preventDefault();
                $('#updateTaskDialog').dialog({
                    height: 700,
                    width: 700,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function (event, ui) {
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                                .removeClass("ui-icon-closethick")
                                .removeClass("ui-icon")
                                .addClass("ui-icon-closedia");
                        //alert("call resource list");
                        $('#assigneeTxt').val(task.assignedTo.fullNames);
                        $('#assigneeTxtHidden').val(username);
                        $('#assigneeEmailHidden').val(task.assignedTo.email);
                    }
                });
                $('#cancelSubTaskBtn').click(function (event) {
                    //clear the form
                    $('#updateTaskDialog').dialog("close");
                });

            });
            $('#saveSubTaskBtn').click(function (event) {
                var assignedUser = $('#assigneeTxtHidden').val();
                var assignedName = $('#assigneeTxt').val();
                var assignedEmail = $('#assigneeEmailHidden').val();
                $.ajax({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    Accept: "application/json",
                    contentType: "application/json",
                    method: "POST",
                    url: "../../projects/add/task",
                    data: JSON.stringify({projectId: jsProject.id,
                        id: $('#updateSubTaskId').val(),
                        description: $('#addSubTaskDescTxt').val(),
                        assignedTo: {userName: $('#assigneeTxtHidden').val(), fullNames: $('#assigneeTxt').val(), email: ''},
                        createdby: username,
                        updateBy: {userName: username, fullNames: '', email: ''},
                        name: $('#addSubTaskNameTxt').val(),
                        parentId: task.id,
                        estimateDays: $('#addSubTaskEstimateDay').val(),
                        estimateHours: $('#addSubTaskEstimateHour').val(),
                        comments: [{comment: $('#addSubTaskComment').val(), taskId: '', username: username}]
                    }),
                    dataType: 'json',
                    success: function (data) {
                        //alert("Task Added");
                        $('#subTaskDescTxt').val("");
//                        $('#updateTaskDialog').dialog("close");
                        sendNotification(assignedUser, assignedName, assignedEmail);
                        alert('Task successfully created...');
                        location.reload();
                    },
                    error: function (data) {
                        alert("An error occured trying to save project: \n" + JSON.parse(data));
                    }
                });
            });
            
            function sendNotification(user, name, email)
            {
                $.ajax({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    Accept: "application/json",
                    contentType: "application/json",
                    method: "POST",
                    url: "../../notifications/task/email",
                    data: JSON.stringify({ notificationType : 'task_assignment',
                        project : {name: jsProject.name, createdDate: jsProject.createdDate, expectedDate: jsProject.expectedDate,
                        businessOwner: {fullNames: jsProject.businessOwner.fullNames},
                        projectManager: {fullNames: jsProject.projectManager.fullNames},
                        projectOwner: {fullNames: jsProject.projectOwner.fullNames}},
                        task: {assignedTo: {userName: user , fullNames: name, email: email},
                    }}),
                    dataType: 'json',
                    success: function (data) {
                                                            
                    },
                    error: function (data) {
                        alert("An error occured trying to send notification: \n" + JSON.parse(data));
                    }
                });
            }
            function assignResource(taskId, projectId, assignedTo) {
                //event.preventDefault();
                $('#addResourceDialog').dialog({
                    height: 850,
                    width: 700,
                    modal: true,
                    resizable: false,
                    dialogClass: 'no-close success-dialog',
                    create: function (event, ui) {
                        var widget = $(this).dialog("widget");
                        $(".ui-dialog-titlebar-close span", widget)
                                .removeClass("ui-icon-closethick")
                                .removeClass("ui-icon")
                                .addClass("ui-icon-closedia");
                    }
                });
                $('#addResourceBtn').click(function (event) {
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        Accept: "application/json",
                        contentType: "application/json",
                        method: "POST",
                        url: "../task/update",
                        data: JSON.stringify({"id": taskId, "assignedTo": {"userName": $("input[name='table_records']:checked").val()}, "projectId": projectId}),
                        dataType: 'json',
                        success: function (data) {

                        },
                        error: function (data) {
                            alert("An error occured trying to get project resources: \n" + JSON.parse(data));
                            $.loader.close(true);
                        }
                    });
                    $('#addResourceDialog').dialog("close");

                    location.reload();
                });
                $('#closeResourceBtn').click(function (event) {
                    //clear the form
                    $('#addResourceDialog').dialog("close");
                });
                //$('#resourceTable tbody').append('<tr class="child"><td>blahblah</td></tr>');
                if (newResourceWindow) {
                    var systems = jsProject.systems;
                    console.log(systems);
                    var systemSkills = [];
                    for (i = 0; i < systems.length; i++) {
                        for (x = 0; x < systems[i].skills.length; x++) {
                            var obj = {"id": systems[i].skills[x].id, "name": systems[i].skills[x].name}
                            systemSkills.push(obj);
                        }
                    }
                    $.ajax({
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        Accept: "application/json",
                        contentType: "application/json",
                        method: "POST",
                        url: "../resources",
                        data: JSON.stringify(systemSkills),
                        dataType: 'json',
                        success: function (data) {
                            newResourceWindow = false;
                            console.log(data);
                            for (i = 0; i < data.length; i++) {
                                var selectedValue = "";
                                console.log("resource username: " + data[i].userName.toLowerCase() + " - task assigned to: " + assignedTo.toLowerCase());
                                if (data[i].userName.toLowerCase() === assignedTo.toLowerCase()) {
                                    selectedValue = ' checked="true"';
                                }
                                $('#resourceTable tbody').append('<tr class="even pointer"><td class="a-center "><input' + selectedValue + ' data-projectid="' + task.id + '" value="' + data[i].userName + '" type="radio" class="flat,resourceCheckClass" name="table_records"></td><td class=" ">' + data[i].fullNames + '</td><td class=" ">' + data[i].role.role + '</td></tr>');
                            }

                        },
                        error: function (data) {
                            alert("An error occured trying to get project resources: \n" + JSON.parse(data));
                            $.loader.close(true);
                        }
                    });
                }

            }
            $(function () {
                var commentsList = [];
                var users = [];
               var project = ${resourceProject};
                var projectTeam = JSON.stringify(jsProject.resources);

                for (k = 0; k < project.tasks.length; k++) {
                    if ((project.tasks[k].id === task.id) || (project.tasks[k].parentId === task.id)) {
                        var convertedComments = JSON.stringify(project.tasks[k].comments);
                        $.each(JSON.parse(convertedComments), function (idx, cmnt) {
                            var object = {"id": cmnt.id, "parent": cmnt.parentId, "created": cmnt.creationDate, "modified": cmnt.toDate,
                                "content": cmnt.comment, "pings": [], "creator": 6, "fullname": cmnt.fullname, "profile_picture_url": "https://app.viima.com/static/media/user_profiles/user-icon.png",
                                "created_by_admin": false, "created_by_current_user": cmnt.username === username, "upvote_count": 0, "user_has_upvoted": false,
                                "is_new": false};
                            commentsList.push(object);
                        });
                    }
                }

                $.each(JSON.parse(projectTeam), function (index, team) {
                    var usr = {id: team.userName, fullname: team.fullNames, email: team.email,
                        profile_picture_url: "https://app.viima.com/static/media/user_profiles/user-icon.png"};
                    users.push(usr);
                });
                var saveComment = function (data) {

                    // Convert pings to human readable format
                    $(data.pings).each(function (index, id) {
                        var user = users.filter(function (user) {
                            return true;
                        })[0];
                        data.content = data.content.replace('@' + id, '@' + user.fullname);
                    });

                    return data;
                }
                $('#comments-container').comments({
                    profilePictureURL: 'https://viima-app.s3.amazonaws.com/media/user_profiles/user-icon.png',
                    currentUserId: 1,
                    roundProfilePictures: true,
                    textareaRows: 1,
                    enableAttachments: true,
                    enableHashtags: true,
                    enablePinging: true,
                    getUsers: function (success, error) {
                        setTimeout(function () {
                            success(users);
                        }, 500);
                    },
                    getComments: function (success, error) {
                        setTimeout(function () {
                            success(commentsList);
                        }, 500);
                    },
                    postComment: function (data, success, error) {
                        setTimeout(function () {
                            success(saveComment(data));
                        }, 500);
                    },
                    putComment: function (data, success, error) {
                        setTimeout(function () {
                            success(saveComment(data));
                        }, 500);
                    },
                    deleteComment: function (data, success, error) {
                        setTimeout(function () {
                            success();
                        }, 500);
                    },
                    upvoteComment: function (data, success, error) {
                        setTimeout(function () {
                            success(data);
                        }, 500);
                    },
                    uploadAttachments: function (dataArray, success, error) {
                        setTimeout(function () {
                            success(dataArray);
                        }, 500);
                    }
                });
            });

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
            
            function validateDailyUpdate() {
                console.log('Do we get here?');
                $('#dailyUpdateForm').validate({
                rules: {
                            fromDate: {
                                required: true
                            },
                            toDate: {
                                required: true
                            },
                            dailyUpdateCommentTxt: {
                                required: true
                            },
                            hoursWorkedTxt: {
                                required: true
                            },
                            agree: "required"
			},
			messages: {
                            fromDate: {
                                required: "Please select date"
                            },
                            toDate: {
                                required: "Please select date"
                            },
                            dailyUpdateCommentTxt: {
                                required: "Please add comment"
                            },
                            hoursWorkedTxt: {
                                required: "Please capture hours worked"
                            },
                            agree: "Please accept our policy"
			}
            });   
            }
            $(document).ready(function () {

        });
        </script>
    </body>
</html>
