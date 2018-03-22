<div id="updateCapexOpexDialog" title="Capex Opex Update" style="display:none">

    <div class="box-info" id="updateDetailsForm">                      
        <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">ProjectName :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="projectName"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Sub-ProjectName :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="subProjectName"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">TaskName :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="taskName"></p>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">ResourceName :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="resourceName"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">TimeSpent :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="timeSpent"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Previous Capex :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="prevCapex"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Previous Opex :</label>
                    <div class="col-sm-9">
                        <p class="form-control-static" id="prevOpex"></p>
                    </div>
                </div>
        </div>
        
            <div class="radio-inline">
                <label>
                  <input type="radio" name="billingRadios" id="billingRadios" value="Capex">
                  Capex
                </label>
            </div>
            <div class="radio-inline">
                <label>
                  <input type="radio" name="billingRadios" id="billingRadios" value="Opex">
                  Opex
                </label>
            </div>
            <div class="radio-inline">
                <label>
                  <input type="radio" name="billingRadios" id="billingRadios" value="Split">
                  Split
                </label>
            </div>
        
        <!--form-horizontal row-border start-->
        <div class="form-horizontal row-border">
            <div class="form-group">
                <label class="col-sm-3 control-label">Rand Value</label>
                <div class="col-sm-8">
                    <input type="number" id="randValueTxt" class="form-control" >
                </div>
            </div>    
            <div class="form-group" id="splitDiv" style="display: none;">
                <label class="col-sm-3 control-label">Split percent</label>
                <div class="col-sm-8">
                    <input type="number" id="splitPercent" class="form-control">
                </div>
            </div>                
        </div>
        <div class="form-horizontal row-border">
            <div class="form-group">
                <label class="col-sm-3 control-label">Capex Value :</label>
                <div class="col-sm-8">
                    <p id="resCapexVal" class="form-control-static"></p>
                </div>
            </div> 
            <div class="form-group">
                <label class="col-sm-3 control-label">Opex Value :</label>
                <div class="col-sm-8">
                    <p id="resOpexVal" class="form-control-static"></p>
                </div>
            </div> 
        </div>
        <!--form-horizontal row-border end--> 
        <!--row start-->
        <div class="row">
            <div class="col-sm-8 col-sm-offset-4">
                <div class="btn-toolbar">
                    <button id="updateBtn" class="btn-primary btn">update</button>
                    <button id="cancelUpdateTaskBtn" class="btn-default btn">Cancel</button>
                </div>
            </div>
        </div>
        <!--row end--> 
        
    </div>

</div>
