<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="agentList.aspx.cs" Inherits="CardProcessingWebsite.master.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Agent Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Agent Management
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#addMerchantModal">
                <i class="fa fa-plus"></i>&nbsp;Add
            </a>
            <asp:LinkButton runat="server" CssClass="btn btn-info" ID="btnPhanQuyen" OnClick="btnPhanQuyen_Click">
                <i class="fa fa-pencil-square-o"></i>&nbsp;Decentralization</asp:LinkButton>
        </div>
    </div>
    <div class="row">
        <br />
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Agent List
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listMerchant" OnItemCommand="listMerchant_ItemCommand">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover" id="tableAgent">
                                <thead>
                                    <tr>
                                        <%--<th class="text-center">Mã</th>--%>
                                        <th class="text-center" style="width: 10%">Name</th>
                                        <th class="text-center">Address</th>
                                        <th class="text-center">Phone</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center" style="width: 10%">Active</th>
                                        <th class="text-center" style="width: 13.5%">Detail & Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <%--<td><%#Eval("AgentID") %></td>--%>
                                <td><%#Eval("AgentName") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Email") %></td>
                                <td style="vertical-align: middle; text-align: center">
                                    <asp:CheckBox ID="chkID" CssClass="center-block" AutoPostBack="false" runat="server" Enabled="false" Checked='<%#Eval("Status").ToString()=="True"?true:false %>' /></td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Update" CssClass="btn btn-success btn-xs" CommandName="EditAgent" CommandArgument='<%# Eval("AgentID") %>'>
                                        <i class="fa fa-pencil"></i>
                                    </asp:LinkButton>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            No Record
                        </EmptyDataTemplate>
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
                    <h4 class="modal-title" id="myModalLabel">Add Agent</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtAgentName.ClientID %>" class="col-sm-2 control-label">Agent Name:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAgentName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="AddAgentGroup" ID="rfv" runat="server" ControlToValidate="txtAgentName" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddress.ClientID %>" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="AddAgentGroup" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPhone.ClientID %>" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <label for="<%=txtEmail.ClientID %>" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:LinkButton ID="btnAddAgent" ValidationGroup="AddAgentGroup" runat="server" CssClass="btn btn-primary" OnClick="btnAddAgent_Click">
                        Add
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

        <%-- Modal Update agent--%>
    <div class="modal fade" id="editAgentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelE">Update Agent</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtAgentNameE.ClientID %>" class="col-sm-2 control-label">Agent Name:</label>
                        <div class="col-sm-8">
                             <asp:TextBox ID="txtAgentIDE" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtAgentNameE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateAgentGroup" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAgentNameE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddressE.ClientID %>" class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddressE" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="UpdateAgentGroup" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddressE" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
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
                         <label for="<%=chbxActiveE.ClientID %>" class="col-sm-2 control-label">Active:</label>
                        <div class="col-sm-5">
                            <asp:CheckBox ID="chbxActiveE" Style="padding-left: 20px;" CssClass="checkbox" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:LinkButton ID="btnViewDetailMerchant" runat="server" CssClass="btn btn-info" OnClick="btnViewDetailMerchant_Click">
                        <i class="fa fa-info-circle"></i>&nbsp;
                        View Detail Merchant
                    </asp:LinkButton>
                    </div>
                        <div class="col-sm-9">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:LinkButton ID="btnUpdate" ValidationGroup="UpdateAgentGroup" runat="server" CssClass="btn btn-primary" OnClick="btnUpdate_Click">
                        Update
                    </asp:LinkButton>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addMerchantModal').on('shown.bs.modal', function (e) {
            $("#<%=txtAgentName.ClientID%>").focus();
        });
    </script>
    <script>
        $('.selectpicker').selectpicker();
        $('#editAgentModal').on('shown.bs.modal', function (e) {
            $("#<%=txtAgentNameE.ClientID%>").focus();
        });
    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script>
        $(document).ready(function () {
            $('#tableAgent').DataTable({
                "order": []

            });
        });
    </script>
</asp:Content>
