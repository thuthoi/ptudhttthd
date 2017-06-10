<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="reportAgent.aspx.cs" Inherits="CardProcessingWebsite.agent.reportPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Agent Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
 <asp:HiddenField ID="hdSaleAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdSaleCount" Value="0" runat="server" />
    <asp:HiddenField ID="hdReturnAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdReturnCount" Value="0" runat="server" />
    <asp:HiddenField ID="hdVisaAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdMasterAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdDebitAmount" Value="0" runat="server" />
    <asp:HiddenField ID="hdVisaCount" Value="0" runat="server" />
    <asp:HiddenField ID="hdMasterCount" Value="0" runat="server" />
    <asp:HiddenField ID="hdDebitCount" Value="0" runat="server" />
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
                                        <div class="col-sm-5">
                                            <asp:Panel ID="panelDate" Style="display: block" runat="server">
                                                <div class='input-group date' id='datetimepicker1'>
                                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panelMonth" Style="display: none" runat="server">
                                                <div class='input-group date' id='datetimepicker2'>
                                                    <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panelQuarter" Style="display: none" runat="server">
                                                <div class="form-group">
                                                    <div class="col-sm-5">
                                                        <asp:DropDownList ID="ddlQuarter" CssClass="form-control selectpicker" runat="server"></asp:DropDownList>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <asp:DropDownList ID="ddlYear" onChange="ddlYear_Change()" CssClass="form-control selectpicker" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="panelYear" Style="display: none" runat="server">
                                                <div class='input-group date' id='datetimepicker3'>
                                                    <asp:TextBox ID="txtYear" runat="server" CssClass="form-control"></asp:TextBox>
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
                                <asp:LinkButton ID="btnChangeFilter" OnClick="btnChangeFilter_Click" class="btn btn-primary" runat="server"><i class="fa fa-bars" aria-hidden="true"></i>&nbsp;Change Filter</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            
                                <asp:RadioButton runat="server" ID="rbMerchant" onclick="view1Click()" Checked="true" GroupName="radioView" />
                                <label for="rbMerchant">View by Merchant</label>
                                <br />
                                <asp:RadioButton runat="server" ID="rbOther" onclick="view2Click()" GroupName="radioView" />
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
                                <asp:RadioButton runat="server" ID="rbQuarterly" onclick="checkQuarterly()" GroupName="radioA" />
                                <label for="rbQuarterly">Quarterly</label>
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
                <div class="panel-heading">Amount & Count Report</div>
                <div class="panel-body">
                    <div class="col-lg-1">&nbsp;</div>
                    <div class="col-lg-4">
                        <div id="baocao2" style="height: 300px;"></div>
                    </div>
                    <div class="col-lg-2">&nbsp;</div>
                    <div class="col-lg-4">
                        <div id="baocao" style="height: 300px;"></div>
                    </div>
                    <div>&nbsp;</div>
                    <table style="border: 1px solid #337AB7; width: 100%" class="table table-bordered" id="dataTables">
                        <tr style="font-weight: bold;" class="bg-primary">
                            <td>Sale Amount</td>
                            <td>Return Amount</td>
                            <td>Sale Count</td>
                            <td>Return Count</td>
                            <td>Net Amount</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSaleAmount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblReturnAmount" runat="server" ForeColor="Red" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblSaleCount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblReturnCount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblNetAmount" Font-Bold="true" Font-Size="Large" runat="server" Text="0"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Amount & Count By Card Report</div>
                <div class="panel-body">
                    <div class="col-lg-1">&nbsp;</div>
                    <div class="col-lg-4">
                        <div id="baocao3" style="height: 300px;"></div>
                    </div>
                    <div class="col-lg-2">&nbsp;</div>
                    <div class="col-lg-4">
                        <div id="baocao4" style="height: 300px;"></div>
                    </div>
                    <div>&nbsp;</div>
                    <table style="border: 1px solid #337AB7; width: 100%" class="table table-bordered" id="data2">
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
                            <td>
                                <asp:Label ID="lblVisaSaleAmount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMasterSaleAmount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebitSaleAmount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblVisaSaleCount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMasterSaleCount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebitSaleCount" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblVisaReturnAmount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMasterReturnAmount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebitReturnAmount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblVisaReturnCount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMasterReturnCount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebitReturnCount" ForeColor="Red" runat="server" Text="0"></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div>&nbsp;</div>
                <div class="col-lg-5">&nbsp;</div>
                <div class="col-lg-5">
                    <asp:LinkButton ID="btnPrint" OnClick="btnPrint_Click" CssClass="btn btn-warning" runat="server"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;Print</asp:LinkButton>
                    <asp:LinkButton ID="btnExport" OnClick="btnExport_Click" CssClass="btn btn-success" runat="server"><i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;Export</asp:LinkButton>
                </div>
                <div class="panel-body"></div>
            </div>
        </div>
    </div>
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
            ddlYear_Change();
            
            if (document.getElementById('<%=rbMerchant.ClientID%>').checked == true) {
                view1Click();
            }
            if (document.getElementById('<%=rbOther.ClientID%>').checked == true) {
                view2Click();
            }
            if (document.getElementById('<%=rbDaily.ClientID %>').checked == true) {
                checkDaily();
            }
            if (document.getElementById('<%=rbMonthly.ClientID %>').checked == true) {
                checkMonthly();
            }
            if (document.getElementById('<%=rbQuarterly.ClientID %>').checked == true) {
                checkQuarterly();
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
            var _saleAmount = parseFloat($(<%=hdSaleAmount.ClientID%>).val()).toFixed(2);
            var _returnAmount = parseFloat($(<%=hdReturnAmount.ClientID%>).val()).toFixed(2);
            var _saleCount = parseFloat($(<%=hdSaleCount.ClientID%>).val()).toFixed(2);
            var _returnCount = parseFloat($(<%=hdReturnCount.ClientID%>).val()).toFixed(2);
            var _visaAmount = parseFloat($(<%=hdVisaAmount.ClientID%>).val()).toFixed(2);
            var _masterAmount = parseFloat($(<%=hdMasterAmount.ClientID%>).val()).toFixed(2);
            var _debitAmount = parseFloat($(<%=hdDebitAmount.ClientID%>).val()).toFixed(2);
            var _visaCount = parseFloat($(<%=hdVisaCount.ClientID%>).val()).toFixed(2);
            var _masterCount = parseFloat($(<%=hdMasterCount.ClientID%>).val()).toFixed(2);
            var _debitCount = parseFloat($(<%=hdDebitCount.ClientID%>).val()).toFixed(2);

            Morris.Donut({
                element: 'baocao2',
                colors: ['#ff0000', '#3A89C9'],
                data: [{ label: "Return Amount", value: _returnAmount },
                    { label: "Sale Amount", value: _saleAmount }],
            });

            Morris.Donut({
                element: 'baocao',
                colors: ['#ff0000', '#3A89C9'],
                data: [{ label: "Return Count", value: _returnCount },
                   { label: "Sale Count", value: _saleCount }],
            });

            Morris.Donut({
                element: 'baocao3',
                colors: ['#FF5B33', '#3368FF', '#F9FF33'],
                data: [{ label: "Visa Amount", value: _visaAmount },
                        { label: "Master Amount", value: _masterAmount },
                        { label: "Debit Amount", value: _debitAmount }],
            });

            Morris.Donut({
                element: 'baocao4',
                colors: ['#FF5B33', '#3368FF', '#F9FF33'],
                data: [{ label: "Visa Count", value: _visaCount },
                        { label: "Master Count", value: _masterCount },
                        { label: "Debit Count", value: _debitCount }],
            });

        });

        function ddlYear_Change() {
            var dYear = document.getElementById('<%=ddlYear.ClientID %>');
            var dQuarter = document.getElementById('<%=ddlQuarter.ClientID %>');
            var quy = Math.floor((new Date(Date.now()).getMonth() + 3) / 3);
            if (dYear.options[dYear.selectedIndex].value != new Date(Date.now()).getFullYear()) {
                for (i = 0; i < dQuarter.length; i++) {
                    dQuarter[i].disabled = false;
                }
            }
            else {
                if (quy <= 1) {
                    dQuarter.value = "4";
                } else {
                    if (quy <= 2) {
                        dQuarter.value = "1";
                        dQuarter[1].disabled = true;
                        dQuarter[2].disabled = true;
                        dQuarter[3].disabled = true;
                    }
                    else {
                        if (quy <= 3) {
                            dQuarter.value = "2";
                            dQuarter[2].disabled = true;
                            dQuarter[3].disabled = true;
                        }
                        else {
                            dQuarter.value = "3";
                            dQuarter[3].disabled = true;
                        }
                    }
                }
            }
        }

        function view1Click() {
           
            $('#<%=ddlType.ClientID %>').prop('disabled', true);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', true);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', false);
          
           <%-- document.getElementById('<%=lblMaster.ClientID%>').style.backgroundColor = '#eaeaea';--%>
        }

        function view2Click() {
           
            $('#<%=ddlType.ClientID %>').prop('disabled', false);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', false);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', true);
           
            <%--document.getElementById('<%=lblMaster.ClientID%>').style.backgroundColor = '#eaeaea';--%>
        };

     <%--   function view3Click() {
            $('#<%=ddlAgent.ClientID %>').prop('disabled', true);
            $('#<%=ddlType.ClientID %>').prop('disabled', false);
            $('#<%=ddlRegion.ClientID %>').prop('disabled', false);
            $('#<%=ddlMerchant.ClientID %>').prop('disabled', true);
            $('#<%=ddlMaster.ClientID %>').prop('disabled', false);
            document.getElementById('<%=lblMaster.ClientID%>').style.backgroundColor = '';
        }--%>

        function checkDaily() {
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'none';
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });

            var date = new Date();
            var pre_date = new Date(date.setDate(date.getDate() - 1));
            $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
        };
        function checkMonthly() {
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'none';
            $('#<%=panelYear.ClientID %>').hide();
            $('#datetimepicker2').datetimepicker({
                viewMode: 'months',
                format: 'MM/YYYY',
                keepOpen: true
            });
            var date = new Date();
            var pre_date = new Date(date.setDate(0, date.getMonth() - 1, 0));
            $('#datetimepicker2').data("DateTimePicker").maxDate(pre_date);
        };
        function checkQuarterly() {
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'block';
        };
        function checkYearly() {
            document.getElementById('<%=panelDate.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelMonth.ClientID %>').style.display = 'none';
            document.getElementById('<%=panelYear.ClientID %>').style.display = 'block';
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'none';

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
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'none';
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });

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
            document.getElementById('<%=panelQuarter.ClientID %>').style.display = 'none';
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
            });

            var date = new Date();
            var pre_date = new Date(date.setDate(date.getDate() - 1));
            var firstDay = new Date(date.getFullYear(), 0, 1);
            $('#datetimepicker1').data("DateTimePicker").minDate(firstDay);
            $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
        };

        function getSesionPrint() {
            $.ajax({
                type: "POST",
                url: "reportMaster.aspx/fn_Print",
                data: '{ }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    OnSuccess(response);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function OnSuccess(response) {
            var docCnt = response.d;
            var pos = docCnt.search("<div>");
            if (pos != -1) {
                var docType = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/loose.dtd">';
                var docHead = '<head><title>Master Report</title><style>body{margin:5;padding:0;}</style></head>';
                var winAttr = "location=yes,statusbar=no,directories=no,menubar=no,titlebar=no,toolbar=no,dependent=no,width=800,height=600,resizable=yes,screenX=250,screenY=50,personalbar=no,scrollbars=yes";;
                var newWin = window.open("", "_blank", winAttr);
                var docFooter = "<foo";
                writeDoc = newWin.document;
                writeDoc.open();
                writeDoc.write(docType + '<html>' + docHead + '<body onload="window.print();">' + docCnt + '</body></html>');
                writeDoc.close();

                // The print event will fire as soon as the window loads
                newWin.focus();
                // uncomment to autoclose the preview window when printing is confirmed or canceled.
                // newWin.close();
            }
        }

    </script>
    <link href="../Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="../Content/select2.min.css" rel="stylesheet" />
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/bootstrap-datetimepicker.js"></script>
    <script src="../Content/select2.min.js"></script>
   
</asp:Content>
