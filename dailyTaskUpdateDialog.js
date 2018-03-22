
<div id="dailyTaskUpdateDialog" title="Daily Update" style="display:none;height:250px;">
    <div class="box-info" id="dailyTaskUpdateForm">
        <h3>Daily Update</h3>
        <hr>
        <!--form-horizontal row-border start-->
        <div class="form-horizontal row-border">
            <form id="dailyUpdateForm">
            <div class="form-group">
                <label class="col-sm-3 control-label">Task Name</label>
                <div class="col-sm-8">
                    <input id="dailyUpdateTaskNameTxt" class="form-control" disabled>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Task Description</label>
                <div class="col-sm-8">
                    <textarea id="dailyUpdateTaskDescTxt" class="form-control" disabled></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Task Status</label>
                <div class="col-sm-8">
                    <div class="">
                        <select id="dailyUpdateTaskStatusSelect" class="select2_single form-control" tabindex="-1">
                        </select>
                    </div>
                    <input id="dailyUpdateTaskStatusTxtHidden" type="hidden">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">How many hours did you work on the task(*)</label>
                <div class="col-sm-8">
                    <input id="hoursWorkedTxt" class="form-control" type="number" required>
                    <label id="hoursWorkedmsg"></label>
                </div>
            </div>   
            <!--<div class="form-group">
                <label class="col-sm-3 control-label">Which date did you work on the task(*)</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="dailyUpdateDate" required>
                </div>
            </div> -->
            <div id="fromDateDiv" class="col-md-12 col-sm-12 col-xs-12 pull-left" >
                <label class="col-sm-3 control-label">From Date:</label>
                <div class="col-md-8">
                    <fieldset>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" id="fromDate" aria-describedby="inputSuccess2Status3" style="margin-left:-10px;">
                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="false"></span>
                                    <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div id="toDateDiv" class="col-md-12 col-sm-12 col-xs-12 pull-left" >
                <label class="col-sm-3 control-label">To Date:</label>
                <div class="col-md-8">
                    <fieldset>
                        <div class="control-group">
                            <div class="controls">
                                <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" id="toDate" aria-describedby="inputSuccess" style="margin-left:-10px;">
                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="false"></span>
                                    <span id="inputSuccess" class="sr-only">(success)</span>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Comment(*)</label>
                <div class="col-sm-8">
                    <textarea id="dailyUpdateCommentTxt" class="form-control" required></textarea>
                </div>
            </div>  
        </form>   
    </div>

    </div>
    <!--row start-->
    <div class="row">
        <div class="col-sm-8 col-sm-offset-4">
            <div class="btn-toolbar">
                <button id="saveDailyUpdateBtn" class="btn-primary btn" type="submit" form="dailyUpdateForm">Update</button>
                <button id="cancelDailyUpdateBtn" class="btn-default btn">Cancel</button>
            </div>
        </div>
    </div>
</div>
