<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="reportMerchant.aspx.cs" Inherits="CardProcessingWebsite.merchant.reportMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Báo cáo Merchant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Báo cáo của Merchant:
    <asp:Label ID="lblMerchantID" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-2">

            <asp:DropDownList ID="dpnReportType" runat="server" CssClass="form-control selectpicker" OnTextChanged="dpnReportType_TextChanged" AutoPostBack="True">
            </asp:DropDownList>

        </div>
        <div class="col-lg-2">
            <a href="javascript: " class="btn btn-info" data-backdrop="false" data-toggle="modal" data-target="#addAccountModal">
                <i class="fa fa-bar-chart-o "></i>&nbsp;Ngày bất kỳ
            </a>
        </div>

    </div>
    <div class="row">
        <br />
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="lbReport" runat="server" Text="Thống kê chung"></asp:Label>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="list_Report_general">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tiền bán hàng</th>
                                        <th>Tiền trả hàng</th>
                                        <th>Số lượng bán hàng</th>
                                        <th>Số lượng trả hàng</th>
                                        <th>Tổng tiền bán, trả hàng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("SaleAmount","{0:#,##0.00}") %></td>
                                <td><%#Eval("ReturnAmount","{0:#,##0.00}") %></td>
                                <td><%#Eval("SaleCount") %></td>
                                <td><%#Eval("ReturnCount") %></td>
                                <td><%#Eval("NetAmount","{0:#,##0.00}") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <p>Không có dữ liệu.</p>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="lbReport_Debit" runat="server" Text="Thống kê theo loại Card"></asp:Label>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="list_Report_Debit">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tiền bán hàng</th>
                                        <th>Tiền trả hàng</th>
                                        <th>Số lượng bán hàng</th>
                                        <th>Số lượng trả hàng</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("DebitCardSaleAmount","{0:#,##0.00}") %></td>
                                <td><%#Eval("DebitCardReturnAmount","{0:#,##0.00}") %></td>
                                <td><%# Convert.ToInt32(Eval("DebitCardSaleCount")) %></td>
                                <td><%# Convert.ToInt32(Eval("DebitCardReturnCount")) %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <p>Không có dữ liệu.</p>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="lbReport_Visa" runat="server" Text="Thống kê theo loại Card"></asp:Label>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="list_Report_Visa">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tiền bán hàng</th>
                                        <th>Tiền trả hàng</th>
                                        <th>Số lượng bán hàng</th>
                                        <th>Số lượng trả hàng</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("VisaCardSaleAmount","{0:#,##0.00}") %></td>
                                <td><%#Eval("VisaCardReturnAmount","{0:#,##0.00}") %></td>
                                <td><%# Convert.ToInt32(Eval("VisaCardSaleCount")) %></td>
                                <td><%# Convert.ToInt32(Eval("VisaCardReturnCount")) %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <p>Không có dữ liệu.</p>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="lbReport_Master" runat="server" Text="Thống kê theo loại Card"></asp:Label>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="list_Report_Master">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tiền bán hàng</th>
                                        <th>Tiền trả hàng</th>
                                        <th>Số lượng bán hàng</th>
                                        <th>Số lượng trả hàng</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("MasterCardSaleAmount","{0:#,##0.00}") %></td>
                                <td><%#Eval("MasterCardReturnAmount","{0:#,##0.00}") %></td>
                                <td><%# Convert.ToInt32(Eval("MasterCardSaleCount")) %></td>
                                <td><%# Convert.ToInt32(Eval("MasterCardReturnCount")) %></td>
                                
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <p>Không có dữ liệu.</p>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
    <%-- Modal Add merchant--%>
    <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Xem thống kê</h4>
                </div>
                <div class="modal-body form-horizontal">

                     <div class="form-group">
                       

                        

                        <div class="col-sm-12">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    Chọn loại thống kê
                                </div>
                                <div class="panel-body">

                                    <label class="radio-inline">
                                        <asp:RadioButton ID="rdMonthToDate" runat="server" GroupName="Role" Checked ="true"/>
                                        Đầu tháng cho tới sau ngày được chọn 1 ngày
                                    </label>
                                    <br />
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="rdYearToDate" runat="server" GroupName="Role"/>
                                        Đầu năm cho tới sau ngày được chọn 1 ngày
                                    </label>
                                </div>
                            </div>
                        </div>

          <div class="col-sm-12">
                            <div class='input-group date' id='datetimepicker1'>
                                <asp:TextBox ID="txtCustomDay" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>

                     
                        </div>
                       

                    </div>



                   
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnViewReport_customDay" runat="server" CssClass="btn btn-primary" OnClick="btnViewReport_customDay_Click">
                        Xem Thống Kê
                    </asp:LinkButton>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addAccountModal').on('shown.bs.modal', function (e) {
            //alert('a');
           // $("#<%=txtCustomDay.ClientID%>").focus();
        });

        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true
               
            });
            handleClick();
        });
        function handleClick() {
            var rates = document.getElementById('<%=rdMonthToDate.ClientID %>').checked;
            if (rates == true) {
                var date = new Date();
                var pre_date = new Date(date.setDate(date.getDate() - 1));
                var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
                $('#datetimepicker1').data("DateTimePicker").minDate(firstDay);
                $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
            }
            else {
                var date = new Date();
                var pre_date = new Date(date.setDate(date.getDate() - 1));
                var firstDay = new Date(date.getFullYear(), 0, 1);
                $('#datetimepicker1').data("DateTimePicker").minDate(firstDay);
                $('#datetimepicker1').data("DateTimePicker").maxDate(pre_date);
            }

        }

    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/jquery-2.1.4.min.js"></script>

    <link href="../Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/bootstrap-datetimepicker.js"></script>
</asp:Content>
