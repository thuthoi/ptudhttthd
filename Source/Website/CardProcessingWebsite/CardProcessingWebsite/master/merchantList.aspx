﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="merchantList.aspx.cs" Inherits="CardProcessingWebsite.merchantList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Merchant
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageheader" runat="server">
    Danh sách Merchant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#addMerchantModal">
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
                    Danh sách các Merchant
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listMerchant">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Tên</th>
                                        <th>Địa chỉ</th>
                                        <th>SĐT</th>
                                        <th>Email</th>
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
                                <td><%#Eval("MerchantID") %></td>
                                <td><%#Eval("MerchantName") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Email") %></td>
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
    <div class="modal fade" id="addMerchantModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Thêm Merchant</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtMerchantName.ClientID %>" class="col-sm-2 control-label">Tên Merchant:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMerchantName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtMerchantName" ForeColor="Red" ErrorMessage="Chưa nhập">Bắt buộc</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddress.ClientID %>" class="col-sm-2 control-label">Địa chỉ:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ForeColor="Red" ErrorMessage="Chưa nhập">Bắt buộc</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPhone.ClientID %>" class="col-sm-2 control-label">SĐT:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <label for="<%=txtEmail.ClientID %>" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboMerchantType.ClientID %>" class="col-sm-2 control-label">Loại:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantType" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboMerchantRegion.ClientID %>" class="col-sm-2 control-label">Khu vực:</label>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="cboMerchantRegion" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboAgent.ClientID %>" class="col-sm-1 control-label">Agent:</label>
                        <div class="col-sm-2">
                            <asp:DropDownList ID="cboAgent" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <asp:LinkButton ID="btnAddMerchant" runat="server" CssClass="btn btn-primary" OnClick="btnAddMerchant_Click">
                        <i class="fa fa-check"> Lưu</i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addMerchantModal').on('shown.bs.modal', function (e) {
            alert('a');
            $("#<%=txtMerchantName.ClientID%>").focus();
        });
    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>

</asp:Content>
