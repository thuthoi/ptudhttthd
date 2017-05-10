<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="agentManagementMerchant.aspx.cs" Inherits="CardProcessingWebsite.master.agentManagementMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Phân quyền quản lý cho Agent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Phân quyền quản lý cho Agent
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="col-lg-12">
        <asp:RadioButton ID="rbtnGanQuyen" Text="Gán quyền" AutoPostBack="true" OnCheckedChanged="rbtnGanQuyen_CheckedChanged" CssClass="radio-inline" runat="server" />
        <asp:RadioButton ID="rbtnChuyenQuyen" Text="Chuyển quyền" AutoPostBack="true" OnCheckedChanged="rbtnChuyenQuyen_CheckedChanged" CssClass="radio-inline" runat="server" />
    </div>
    <div class="row">
        <div class="col-lg-12">&nbsp;</div>
    </div>
    <div class="row">
        <asp:Panel runat="server" ID="pnlGanQuyen">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="<%=cboAgentforAdd.ClientID %>" class="col-sm-2">Chọn agent:</label>
                            <div class="col-sm-2">
                                <asp:DropDownList ID="cboAgentforAdd" CssClass="form-control selecpicker" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">&nbsp;</div>
                    </div>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="<%=listMerchant.ClientID %>" class="col-sm-2">Chọn Merchant:</label>
                            <div class="col-sm-10">
                                <asp:ListView runat="server" ID="listMerchant" DataKeyNames="MerchantID">
                                    <LayoutTemplate>
                                        <table style="width: 100%" class="table table-striped table-bordered table-hover" id="tableMerchant">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">Mã</th>
                                                    <th style="text-align: center">>Tên</th>
                                                    <th style="text-align: center">>Địa chỉ</th>
                                                    <th style="text-align: center">>Chọn</th>
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
                                            <td style="vertical-align: central; text-align: center">
                                                <asp:CheckBox ID="chkPick" CausesValidation="false" CssClass="checkbox-inline" runat="server" />

                                            </td>
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
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlChuyenQuyen" Visible="false">
            <div class="col-lg-12">
                chuyen quyen
            </div>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
</asp:Content>
