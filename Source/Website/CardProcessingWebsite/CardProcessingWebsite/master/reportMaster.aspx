<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="reportMaster.aspx.cs" Inherits="CardProcessingWebsite.master.reportPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Master Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Master Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <asp:HiddenField ID="hdSaleAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdSaleCount" Value="0" runat="server" />
    <asp:HiddenField ID="hdReturnAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdReturnCount" Value="0" runat="server" />
    <asp:HiddenField ID="temp" Value="1" runat="server" />
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Filter</div>
                <div class="panel-body">
                    <div class="col-lg-2">
                        <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#changeFilter">
                            <i class="fa fa-bars" aria-hidden="true"></i>&nbsp;Change Filter
                        </a>
                    </div>
                    <div class="col-lg-10">
                        <table style="width: 100%" class="table table-striped table-bordered table-hover" id="data">
                            <thead>
                                <tr>
                                    <th>Report Type</th>
                                    <th>Value</th>
                                    <th>View (Agent/Merchant)</th>
                                    <th>View (Region)</th>
                                    <th>View (Merchant Type)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>Daily</td>
                                    <td>02/06/2017</td>
                                    <td>Merchant 01</td>
                                    <td>None</td>
                                    <td>None</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Report Chart</div>
                <div class="panel-body">
                    <div class="col-lg-1">
                        &nbsp;
                    </div>
                    <div class="col-lg-4">
                        <div id="baocao" style="height: 300px;"></div>
                    </div>
                    <div class="col-lg-2">
                        &nbsp;
                    </div>
                    <div class="col-lg-4">
                        <div id="baocao2" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Report Table</div>
                <div class="panel-body">
                    <table style="border: 1px solid #337AB7" class="table table-bordered" id="dataTables">
                        <tr style="font-weight: bold;" class="bg-primary">
                            <td>Sale Amount</td>
                            <td>Return Amount</td>
                            <td>Sale Count</td>
                            <td>Return Count</td>
                            <td>Net Amount</td>
                        </tr>
                        <tr>
                            <td>100.000</td>
                            <td>100.000</td>
                            <td>43</td>
                            <td>43</td>
                            <td>0</td>
                        </tr>
                    </table>
                    <div>&nbsp;</div>
                    <table style="border: 1px solid #337AB7" class="table table-bordered" id="data2">
                        <tr style="font-weight: bold;" class="bg-primary">
                            <td colspan="3">Card Sale Amount</td>
                            <td colspan="3">Card Sale Count</td>
                            <td colspan="3">Card Return Amount</td>
                            <td colspan="3">Card Return Count</td>
                        </tr>
                        <tr style="font-weight: bold;" class="bg-success">
                            <td>Visa</td>
                            <td>Master</td>
                            <td>Debit</td>
                            <td>Visa</td>
                            <td>Master</td>
                            <td>Debit</td>
                            <td>Visa</td>
                            <td>Master</td>
                            <td>Debit</td>
                            <td>Visa</td>
                            <td>Master</td>
                            <td>Debit</td>
                        </tr>
                        <tr>
                            <td>100.000</td>
                            <td>100.000</td>
                            <td>100.000</td>
                            <td>43</td>
                            <td>43</td>
                            <td>43</td>
                            <td>100.000</td>
                            <td>100.000</td>
                            <td>100.000</td>
                            <td>43</td>
                            <td>43</td>
                            <td>43</td>
                        </tr>
                    </table>
                    <div class="col-lg-5">&nbsp;</div>
                    <div class="col-lg-5">
                        <asp:LinkButton ID="btnPrint" CssClass="btn btn-warning" runat="server"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print</asp:LinkButton>
                        <asp:LinkButton ID="btnExport" CssClass="btn btn-success" runat="server"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Export</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--#Filter Modal --%>
    <div class="modal fade" id="changeFilter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Change Filter</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label for="<%=ddlMerchant.ClientID %>" class="col-sm-2 control-label">Merchant:</label>
                                    <div class="col-sm-10">
                                        <asp:DropDownList CssClass="form-control selectpicker" ID="ddlMerchant" placeholder="Merchant" runat="server"></asp:DropDownList>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <label for="<%=ddlAgent.ClientID %>" class="col-sm-2 control-label">Agent:</label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList CssClass="form-control selectpicker" ID="ddlAgent" placeholder="Agent" runat="server"></asp:DropDownList>
                                    </div>
                                    <label for="<%=ddlType.ClientID %>" class="col-sm-2 control-label">Merchant Type:</label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList CssClass="form-control selectpicker" ID="ddlType" placeholder="Merchant" runat="server"></asp:DropDownList>
                                    </div>
                                    <label for="<%=ddlRegion.ClientID %>" class="col-sm-2 control-label">Region:</label>
                                    <div class="col-sm-2">
                                        <asp:DropDownList CssClass="form-control selectpicker" ID="ddlRegion" placeholder="Agent" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <div class="col-sm-9">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <label id="lblType"></label>
                                        <div class='input-group date' id='datetimepicker1'>
                                            <asp:TextBox ID="txtCustomDay" runat="server" CssClass="form-control"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                        <div>&nbsp;</div>
                                        <div class='input-group date' id='datetimepicker2'>
                                            <asp:TextBox ID="txtCustomMonth" runat="server" CssClass="form-control"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                        <div>&nbsp;</div>
                                        <div class='input-group date' id='datetimepicker3'>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <asp:RadioButton runat="server" ID="rdDaily" Checked="true" onclick="checkDaily()" GroupName="radioA" />
                                        <label for="rdDaily">Daily</label>
                                        <br />
                                        <asp:RadioButton runat="server" ID="rdMonthly" onclick="checkMonthly()" GroupName="radioA" />
                                        <label for="rdMonthly">Monthly</label>
                                        <br />
                                        <asp:RadioButton runat="server" ID="rdYearly" onclick="checkYearly()" GroupName="radioA" />
                                        <label for="rdYearly">Yearly</label>
                                        <br />
                                        <asp:RadioButton runat="server" ID="rdMtDate" onclick="checkMtDate()" GroupName="radioA" />
                                        <label for="rdMtDate">Month to Date</label>
                                        <br />
                                        <asp:RadioButton runat="server" ID="rdYtDate" onclick="checkYtDate()" GroupName="radioA" />
                                        <label for="rdYtDate">Year to Date</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:LinkButton ID="btnAddMerchant" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script type="text/javascript">
        $(function () {
            var temp = $(<%=temp.ClientID%>).val();
            //alert(temp);
            if (temp == '1') {
                alert('yeah');
            }
        });

        $(function chart() {
            Morris.Donut({
                element: 'baocao2',
                colors: ['#ff0000', '#3A89C9'],
                data: [{ label: "Return Amount", value: 15 },
                    { label: "Sale Amount", value: 21 }],
            });

            Morris.Donut({
                element: 'baocao',
                colors: ['#ff0000', '#3A89C9'],
                data: [{ label: "Return Count", value: 10000000000.00 },
                   { label: "Sale Count", value: 30000000000.00 }],
            });
        });

        function checkDaily() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });
            document.getElementById('lblType').innerHTML = '1';
            var date = new Date();
            var pre_date = new Date(date.setDate(date.getDate() - 1));
            $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
        };
        function checkMonthly() {
            $('#datetimepicker2').datetimepicker({
                viewMode: 'months',
                format: 'MM/YYYY',
                keepOpen: true
            });
            document.getElementById('lblType').innerHTML = '2';
            var date = new Date();
            var pre_date = new Date(date.setDate(0, date.getMonth() - 1, 0));
            $('#datetimepicker2').data("DateTimePicker").maxDate(pre_date);
        };
        function checkYearly() {
            document.getElementById('lblType').innerHTML = '3';
            $('#datetimepicker3').datetimepicker({
                viewMode: 'years',
                format: 'YYYY',
                keepOpen: true
            });
            var year = new Date(Date.now()).getFullYear() - 1;
            var pre_date = new Date(year, 1, 1);
            $('#datetimepicker3').data("DateTimePicker").maxDate(pre_date);
        };
        function checkMtDate() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });
            document.getElementById('lblType').innerHTML = '4';
            var date = new Date();
            var pre_date = new Date(date.setDate(date.getDate() - 1));
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            $('#datetimepicker1').data("DateTimePicker").minDate(firstDay);
            $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
        };
        function checkYtDate() {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });
            document.getElementById('lblType').innerHTML = '5';
            var date = new Date();
            var pre_date = new Date(date.setDate(date.getDate() - 1));
            var firstDay = new Date(date.getFullYear(), 0, 1);
            $('#datetimepicker1').data("DateTimePicker").minDate(firstDay);
            $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
        };
    </script>
    <link href="../Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/bootstrap-datetimepicker.js"></script>
</asp:Content>
