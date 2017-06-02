<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="reportMaster.aspx.cs" Inherits="CardProcessingWebsite.master.reportPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Master Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Master Report
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <div class="col-lg-12">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Sale/Return Amount Chart</div>
                    <div class="panel-body">
                        <div id="baocao"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                &nbsp;
            </div>
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Sale/Return Count Chart</div>
                    <div class="panel-body">
                        <div id="baocao2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Báo cáo cái beep
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table style="width: 100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Rendering engine</th>
                                <th>Browser</th>
                                <th>Platform(s)</th>
                                <th>Engine version</th>
                                <th>CSS grade</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="odd gradeX">
                                <td>Trident</td>
                                <td>Internet Explorer 4.0</td>
                                <td>Win 95+</td>
                                <td class="center">4</td>
                                <td class="center">X</td>
                            </tr>
                        </tbody>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script type="text/javascript">
        function chart() {
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
        };

    </script>
</asp:Content>
