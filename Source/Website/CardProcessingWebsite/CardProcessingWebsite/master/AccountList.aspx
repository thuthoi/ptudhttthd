<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="AccountList.aspx.cs" Inherits="CardProcessingWebsite.master.AccountList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
     Danh sách Account
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#addAccountModal">
                <i class="fa fa-plus"></i>&nbsp;Thêm
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
                    Danh sách các Account
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listAccount">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã người dùng</th>
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
                                <td><%#Eval("UserID") %></td>
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
                    <h4 class="modal-title" id="myModalLabel">Thêm Merchant</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtUserName.ClientID %>" class="col-sm-2 control-label">Tên đăng nhập:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="Chưa nhập">Bắt buộc</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtPassword.ClientID %>" class="col-sm-2 control-label">Mật khẩu:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Chưa nhập">Bắt buộc</asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="confirm" class="col-sm-2 control-label"> Nhập lại mật khẩu:</label>
                        
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNLMK" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNLMK" ForeColor="Red" ErrorMessage="Chưa nhập" Display="Dynamic">Bắt buộc</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu nhập lại chưa đúng" ControlToCompare="txtPassword" ControlToValidate="txtNLMK" Font-Bold="False" ForeColor="Red" SetFocusOnError="True">Mật khẩu nhập lại chưa đúng</asp:CompareValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboRole.ClientID %>" class="col-sm-2 control-label">Loại người dùng:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboRole" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboUserID.ClientID %>" class="col-sm-2 control-label">Người dùng:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboUserID" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <%--<div class="col-sm-2">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>--%>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <asp:LinkButton ID="btnAddAccount" runat="server" CssClass="btn btn-primary" OnClick="btnAddAccount_Click">
                        <i class="fa fa-check"> Lưu</i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addAccountModal').on('shown.bs.modal', function (e) {
           <%-- alert('a');
            $("#<%=txtMerchantName.ClientID%>").focus();--%>
        });
    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
</asp:Content>
