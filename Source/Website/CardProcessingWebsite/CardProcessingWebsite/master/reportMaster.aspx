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
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Filter</div>
                <div class="panel-body">
                    <div class="col-lg-2">
                        <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#changeFilter">
                            <i class="fa fa-plus"></i>&nbsp;Change Filter
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
                    <div class="col-lg-10">&nbsp;</div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnPrint" CssClass="btn btn-default" Font-Bold="true" runat="server" BackColor="Orange" Text="Print" />
                        <asp:Button ID="btnExport" CssClass="btn btn-default" runat="server" Font-Bold="true" BackColor="Green" Text="Export" />
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

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:LinkButton ID="btnAddMerchant" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script type="text/javascript">
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
    </script>
</asp:Content>
