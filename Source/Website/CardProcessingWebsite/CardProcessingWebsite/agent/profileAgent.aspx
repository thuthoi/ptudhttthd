﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="profileAgent.aspx.cs" Inherits="CardProcessingWebsite.agent.profileAgent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Thông tin Agent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
     Thông tin của Agent: <asp:Label ID="lblAgentID" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">

     <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Thông tin
                </div>
                <div class="panel-body">
                    - Tên Agent:
                        <asp:Label runat="server" Font-Bold="true" ID="lblName"></asp:Label><br />
                    - Địa chỉ: 
                        <asp:Label runat="server" Font-Bold="true" ID="lblAddress"></asp:Label><br />
                    - Điện thoại: 
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