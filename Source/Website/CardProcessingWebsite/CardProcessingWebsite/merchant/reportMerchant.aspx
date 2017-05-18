<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="reportMerchant.aspx.cs" Inherits="CardProcessingWebsite.merchant.reportMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Báo cáo MERCHANT
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Báo cáo của Merchant:
    <asp:Label ID="lblMerchantID" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-2">

            <asp:DropDownList ID="dpnReportType" runat="server" CssClass="form-control selectpicker">
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
                    Thống kê
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listAccount">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tên người dùng</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Phân loại người dùng</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Master_Agent_Merchant_Name") %></td>
                                <td><%#Eval("Username") %></td>
                                <td><%#Eval("Role") %></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyItemTemplate>
                            Không có dữ liệu
                        </EmptyItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal Add merchant--%>
    <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Xem thống kê</h4>
                </div>
                <div class="modal-body form-horizontal">



                    <div class="form-group">
                        <label for="<%=txtCustomDay.ClientID %>" class="col-sm-2 control-label">Tên đăng nhập:</label>
                        <div class="col-sm-10">
                            <div class='input-group date' id='datetimepicker1'>
                                 <asp:TextBox ID="txtCustomDay" runat="server" CssClass="form-control"></asp:TextBox>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                           
                            <%-- <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="Chưa nhập" Display="Dynamic">Bắt buộc</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="validatorUID" runat="server" ControlToValidate="txtUserName" ErrorMessage="Tên đăng nhập đã tồn tại" ForeColor="Red" Display="Dynamic" ClientValidationFunction="check_user_exist" SetFocusOnError="True">Tên đăng nhập đã tồn tại</asp:CustomValidator>--%>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-10">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    Chọn loại thống kê
                                </div>
                                <div class="panel-body">

                                    <label class="radio-inline">
                                        <asp:RadioButton ID="rdMerchant" runat="server" GroupName="Role" />
                                        Đầu tháng cho tới sau ngày được chọn 1 ngày
                                    </label>
                                    <br />
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Role" />
                                        Đầu năm cho tới sau ngày được chọn 1 ngày
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <%--<asp:LinkButton ID="btnAddAccount" runat="server" CssClass="btn btn-primary" OnClick="btnAddAccount_Click" OnClientClick="a();">
                        <i class="fa fa-check"> Lưu</i>
                    </asp:LinkButton>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addAccountModal').on('shown.bs.modal', function (e) {
            //alert('a');
            $("#<%=txtCustomDay.ClientID%>").focus();
        });

        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                keepOpen: true,
                minDate: "5/18/2017"
            });
           
        });





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
