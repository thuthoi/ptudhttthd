<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="profileMaster.aspx.cs" Inherits="CardProcessingWebsite.master.profileMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Master Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
     Master ID: <asp:Label ID="lblMasterID" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">

     <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Profile
                </div>
                <div class="panel-body">
                    - Master Name:
                        <asp:Label runat="server" Font-Bold="true" ID="lblName"></asp:Label><br />
                    - Phone: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblPhone"></asp:Label><br />
                    - Email: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblEmail"></asp:Label><br />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
</asp:Content>
