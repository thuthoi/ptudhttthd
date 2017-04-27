<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="profileMerchant.aspx.cs" Inherits="CardProcessingWebsite.merchant.profileMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Thông tin Merchant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Thông tin của Merchant: MERCH00001
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Thông tin
                </div>
                <div class="panel-body">
                    - Tên Merchant:
                        <asp:Label runat="server" Font-Bold="true" ID="lblName"></asp:Label><br />
                    - Địa chỉ: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblAddress"></asp:Label><br />
                    - Điện thoại: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblPhone"></asp:Label><br />
                    - Email: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblEmail"></asp:Label><br />
                    <br />
                    <asp:Button runat="server" CssClass="btn btn-primary" Text="Cập nhật thông tin" ID="btnUpdateProfile" />
                    <asp:HiddenField ID="hdMerchantID" runat="server" Value="MERCH00001" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
</asp:Content>
