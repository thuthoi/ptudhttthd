<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="merchantOfAgent.aspx.cs" Inherits="CardProcessingWebsite.master.merchantOfAgent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Merchant in agent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="css" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageheader" runat="server">
    Merchant belong to agent "<asp:Label ID="lblAgentName" runat="server" Text=""></asp:Label>"
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">



<div class="row" id="resultTable" runat="server">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Merchant List
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
                                        <th class="text-center" style="width: 13.5%">Detail & Edit</th>
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
                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Detail & Edit" CssClass="btn btn-success btn-xs" CommandName="EditMerchant" CommandArgument='<%# Eval("MerchantID") %>'>
                                        <i class="fa fa-pencil"></i>
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
                                This agent does not have any merchants.
                            </div>

                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>


    <%-- Modal Update merchant--%>
    <div class="modal fade" id="editMerchantModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelE">Update Merchant</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtMerchantNameE.ClientID %>" class="col-sm-2 control-label">Merchant Name:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMerchantIDE" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtMerchantNameE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateMerchantGroup" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMerchantNameE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddressE.ClientID %>" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddressE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateMerchantGroup" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddressE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPhoneE.ClientID %>" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhoneE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <label for="<%=txtEmailE.ClientID %>" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtEmailE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboMerchantTypeE.ClientID %>" class="col-sm-2 control-label">Type:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantTypeE" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboMerchantRegionE.ClientID %>" class="col-sm-2 control-label">Region:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantRegionE" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboAgentE.ClientID %>" class="col-sm-2 control-label">Agent:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboAgentE" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=chbxActiveE.ClientID %>" class="col-sm-2 control-label">Active:</label>
                        <div class="col-sm-4">
                            <asp:CheckBox ID="chbxActiveE" Style="padding-left: 20px;" Checked="true" CssClass="checkbox" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:LinkButton ID="btnUpdate" ValidationGroup="UpdateMerchantGroup" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click">
                         Update
                    </asp:LinkButton>
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
        $('.selectpicker').selectpicker();
        $('#editMerchantModal').on('shown.bs.modal', function (e) {
            $("#<%=txtMerchantNameE.ClientID%>").focus();
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#tableMerchant').DataTable(
                {
                    "order": []

                });

        });
    </script>
</asp:Content>
