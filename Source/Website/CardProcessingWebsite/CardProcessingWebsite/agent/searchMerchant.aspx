﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="searchMerchant.aspx.cs" Inherits="CardProcessingWebsite.agent.searchMerchant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Search Merchant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
    <style>
input[type=radio] + label{
  margin-right:39px
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageheader" runat="server">
    Search Merchant
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">

    <div class="form-group input-group col-md-10" style="padding-left: 18px">
        

         <asp:TextBox ID="txtKeyword" onkeypress="return EnterEvent(event)" placeholder="Keywords" runat="server" class="form-control" autofocus="true"></asp:TextBox>

        <span class="input-group-btn">
          
                <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-default" OnClick="btnSearch_Click">
                    <i class="fa fa-search"></i>
                </asp:LinkButton>

        </span>
    </div>

    <div style="padding-left: 18px !important;">


        <div class="form-horizontal col-md-10" style="padding-left: 0 !important; padding-right: 0 !important;">
            <div class="form-group " style="padding-left: 13px;">


                <label class="col-md-1 control-label" style="padding-left: 0 !important; padding-right: 0 !important; padding-top: 7px; text-align: left; width: 6%; margin-right:-10px">Type</label>
                <div class="col-md-3" style="padding-left: 0 !important; text-align: left;">
                    <asp:DropDownList ID="cboMerchantType" runat="server" CssClass="form-control selectpicker">
                    </asp:DropDownList>
                </div>


                <label class="col-md-1 control-label" style="margin-left: 31px; margin-right:-10px">Region</label>
                <div class="col-md-3">
                    <asp:DropDownList ID="cboMerchantRegion" runat="server" CssClass="form-control selectpicker">
                    </asp:DropDownList>
                </div>

                <%-- <div class="col-md-1" style="margin-right: -6px; margin-left: 36px">
                    <asp:CheckBox CssClass="checkbox" Checked="true" ID="cbActive" runat="server" />
                </div>

                <div class="col-md-1" style="padding-top: 7px; margin-left: -66px">
                    <label for="<%=cbActive.ClientID %>">Active</label>
                </div>

                <div class="col-md-1" style="margin-right: -6px; margin-left: 36px">
                    <asp:CheckBox CssClass="checkbox" Checked="true" ID="cbInactive" runat="server" />
                </div>

                <div class="col-md-1" style="padding-top: 7px; margin-left: -66px">
                    <label for="<%=cbInactive.ClientID %>">Inactive</label>
                </div>--%>
                <div class="col-md-4">

                <asp:RadioButtonList ID="rbActive" CssClass="radio-inline"  runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Active" Value="1"  />
                        <asp:ListItem Text="Inactive" Value="0" />
                        <asp:ListItem Text="Both" Value="2" Selected="True"/>
                </asp:RadioButtonList>
                    </div>
            </div>


        </div>
    </div>


     <div class="row" id="resultTable" runat="server" style="display: none;">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Result
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listMerchant" DataKeyNames="MerchantID" OnItemCommand="listMerchant_ItemCommand">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover" id="tableMerchant">
                                <thead>
                                    <tr>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Address</th>
                                        <th class="text-center">Phone</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center" style="width: 13%">Detail</th>
                                        <th class="text-center" style="width: 10%">Report</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("MerchantName") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Email") %></td>
                                
                                <td style="vertical-align: middle; text-align: center">
                                    <asp:LinkButton ID="btnDetail" runat="server" ToolTip="Detail" CssClass="btn btn-success btn-xs" CommandName="DetailMerchant" CommandArgument='<%# Eval("MerchantID") %>'>
                                        <i class="fa fa-info-circle"></i>
                                    </asp:LinkButton>
                                </td>

                                <td style="vertical-align: middle; text-align: center">
                                    <asp:LinkButton ID="btnReport" runat="server" ToolTip="View Report" CssClass="btn btn-info btn-xs" CommandName="ReportMerchant" CommandArgument='<%# Eval("MerchantID") %>'>
                                        <i class="fa fa-bar-chart-o"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning">
                               Did not match any merchants.
                            </div>
                            
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>


     <%-- Modal Update merchant--%>
    <div class="modal fade" id="detailMerchantModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelE">Merchant Detail</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtMerchantNameE.ClientID %>" class="col-sm-2 control-label">Merchant Name:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMerchantIDE" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtMerchantNameE" runat="server" CssClass="form-control" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateMerchantGroup" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMerchantNameE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddressE.ClientID %>" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddressE" runat="server" CssClass="form-control" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateMerchantGroup" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddressE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPhoneE.ClientID %>" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhoneE" runat="server" CssClass="form-control" disabled="true"></asp:TextBox>
                        </div>
                        <label for="<%=txtEmailE.ClientID %>" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtEmailE" runat="server" CssClass="form-control" disabled="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboMerchantTypeE.ClientID %>" class="col-sm-2 control-label">Type:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantTypeE" runat="server" CssClass="form-control selectpicker" disabled="true">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboMerchantRegionE.ClientID %>" class="col-sm-2 control-label">Region:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantRegionE" runat="server" CssClass="form-control selectpicker" disabled="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboAgentE.ClientID %>" class="col-sm-2 control-label">Agent:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboAgentE" runat="server" CssClass="form-control selectpicker" disabled="true">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=chbxActiveE.ClientID %>" class="col-sm-2 control-label">Active:</label>
                        <div class="col-sm-4">
                            <asp:CheckBox ID="chbxActiveE" Style="padding-left: 20px;" CssClass="checkbox" runat="server" onclick="return false;"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="scriptFile" runat="server">
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>



    <script>
        $(document).ready(function () {
            $('#tableMerchant').DataTable(
                {
                    "searching": false,
                    
                    "order": []
                    
                });

        });

        function EnterEvent(e) {
            if (e.keyCode == 13) {
                __doPostBack('<%=btnSearch.UniqueID%>', "");
            }
        }

    </script>

</asp:Content>
