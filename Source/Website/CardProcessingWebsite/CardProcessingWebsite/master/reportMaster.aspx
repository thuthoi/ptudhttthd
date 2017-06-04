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
                    <div class="col-lg-9">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group">
                                        <label style="padding-top: 7px;" for="<%=ddlMerchant.ClientID %>" class="col-sm-2 control-label">Merchant:</label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList CssClass="form-control selectpicker" Enabled="false" ID="ddlMerchant" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">&nbsp;</div>
                                <div class="row">
                                    <div class="form-group">
                                        <label style="padding-top: 7px;" for="<%=ddlAgent.ClientID %>" class="col-sm-2 control-label">Agent:</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList CssClass="form-control selectpicker" ID="ddlAgent" Enabled="false" runat="server"></asp:DropDownList>
                                        </div>
                                        <label style="padding-top: 7px;" for="<%=ddlMaster.ClientID %>" class="col-sm-3 control-label">Master:</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList CssClass="form-control selectpicker" ID="ddlMaster" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">&nbsp;</div>
                                <div class="row">
                                    <div class="form-group">
                                        <label style="padding-top: 7px;" for="<%=ddlRegion.ClientID %>" class="col-sm-2 control-label">Region:</label>
                                        <div class="col-sm-3">
                                            <asp:DropDownList CssClass="form-control selectpicker" ID="ddlRegion" runat="server"></asp:DropDownList>
                                        </div>
                                        <label style="padding-top: 7px;" for="<%=ddlType.ClientID %>" class="col-sm-3 control-label">Merchant Type:</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList CssClass="form-control selectpicker" ID="ddlType" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="col-sm-3">&nbsp;</div>
                                        <div class="col-sm-6">
                                            <asp:Panel ID="panelDate" Style="display: block" runat="server">
                                                <div class='input-group date' id='datetimepicker1'>
                                                    <asp:TextBox ID="txtCustom1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panelMonth" Style="display: none" runat="server">
                                                <div class='input-group date' id='datetimepicker2'>
                                                    <asp:TextBox ID="txtCustom2" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panelYear" Style="display: none" runat="server">
                                                <div class='input-group date' id='datetimepicker3'>
                                                    <asp:TextBox ID="txtCustom3" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">&nbsp;</div>
                            <div class="col-sm-4">
                                <asp:LinkButton ID="btnChangeFilter"  OnClick="btnChangeFilter_Click" class="btn btn-primary" runat="server"><i class="fa fa-bars" aria-hidden="true"></i>&nbsp;Change Filter</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <asp:RadioButton runat="server" ID="rbMaster" onclick="view3Click()" Checked="true" GroupName="radioView" />
                                <label for="rbMaster">View by Master</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbMerchant" onclick="view1Click()" GroupName="radioView" />
                                <label for="rbMerchant">View by Merchant</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbOther" onclick="view2Click()"  GroupName="radioView" />
                                <label for="rbOther">View by Agent</label>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <asp:RadioButton runat="server" ID="rbDaily" onclick="checkDaily()" Checked="true" GroupName="radioA" />
                                <label for="rbDaily">Daily</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbMonthly" onclick="checkMonthly()" GroupName="radioA" />
                                <label for="rbMonthly">Monthly</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbYearly" onclick="checkYearly()" GroupName="radioA" />
                                <label for="rbYearly">Yearly</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbMtDate" onclick="checkMtDate()" GroupName="radioA" />
                                <label for="rbMtDate">Month to Date</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbYtDate" onclick="checkYtDate()" GroupName="radioA" />
                                <label for="rbYtDate">Year to Date</label>
                            </div>
                        </div>
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
    <div class="row">&nbsp;</div>
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
    <label style="visibility: hidden;" id="lblType"></label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#" + "<%=ddlMerchant.ClientID%>").select2({
                placeholder: "Select a Subject",
                allowClear: false
            });
        });

        $(function () {
            if (document.getElementById('<%=rbDaily.ClientID %>').checked == true) {
                checkDaily();
            }
            if (document.getElementById('<%=rbMonthly.ClientID %>').checked == true) {
                checkMonthly();
            }
            if (document.getElementById('<%=rbYearly.ClientID %>').checked == true) {
                checkYearly();
            }
            if (document.getElementById('<%=rbMtDate.ClientID %>').checked == true) {
                checkMtDate();
            }
            if (document.getElementById('<%=rbYtDate.ClientID %>').checked == true) {
                checkYtDate();
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

        function view1Click() {
            $('#<%=ddlAgent.ClientID %>').prop('disabled', true);
            $('#<%=ddlType.ClientID %>').prop('disabled', true);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', true);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', false);
            $('#<%=ddlMaster.ClientID %>').prop('disabled', true);
        }

        function view2Click() {
            $('#<%=ddlAgent.ClientID %>').prop('disabled', false);
            $('#<%=ddlType.ClientID %>').prop('disabled', false);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', false);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', true);
            $('#<%=ddlMaster.ClientID %>').prop('disabled', true);
        };

        function view3Click() {
            $('#<%=ddlAgent.ClientID %>').prop('disabled', true);
            $('#<%=ddlType.ClientID %>').prop('disabled', false);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', false);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', true);
            $('#<%=ddlMaster.ClientID %>').prop('disabled', false);
        }

        function checkDaily() {
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
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
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
            $('#<%=panelYear.ClientID %>').hide();
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
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'block';
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
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
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
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
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
    <link href="../Content/select2.min.css" rel="stylesheet" />
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/bootstrap-datetimepicker.js"></script>
    <script src="../Content/select2.min.js"></script>
</asp:Content>
