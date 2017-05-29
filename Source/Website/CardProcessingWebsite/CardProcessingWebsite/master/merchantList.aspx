<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="merchantList.aspx.cs" Inherits="CardProcessingWebsite.merchantList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Merchant Management
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageheader" runat="server">
    Merchant Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#addMerchantModal">
                <i class="fa fa-plus"></i>&nbsp;Add
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
                    Merchant List
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listMerchant" DataKeyNames="MerchantID" OnItemDeleting="listMerchant_ItemDeleting" OnItemCommand="listMerchant_ItemCommand">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover" id="tableMerchant">
                                <thead>
                                    <tr>
                                        <%-- <th class="text-center">Mã</th>--%>
                                        <th class="text-center">Name</th>
                                        <th class="text-center" >Address</th>
                                        <th class="text-center">Phone</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center" style="width: 10%">Active</th>
                                        <th class="text-center" style="width: 8%">Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder"></tr>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <%--<td><%#Eval("MerchantID") %></td>--%>
                                <td><%#Eval("MerchantName") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Email") %></td>
                                <td style="vertical-align: middle; width: 60px; text-align: center">
                                    <asp:CheckBox ID="chkID" CssClass="center-block" AutoPostBack="false" runat="server" Enabled="false" Checked='<%#Eval("Status").ToString()=="True"?true:false %>' /></td>
                                <td style="vertical-align: middle; text-align: center">
                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Chỉnh sửa" CssClass="btn btn-success btn-xs" CommandName="EditMerchant" CommandArgument='<%# Eval("MerchantID") %>'>
                                        <i class="fa fa-pencil"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyItemTemplate>
                            No Record
                        </EmptyItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal Add merchant--%>
    <div class="modal fade" id="addMerchantModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add Merchant</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtMerchantName.ClientID %>" class="col-sm-2 control-label">Merchant Name:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMerchantName" placeholder="Merchant Name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="AddMerchantGroup" ID="rfv" runat="server" ControlToValidate="txtMerchantName" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="<%=txtAddress.ClientID %>" class="col-sm-2 control-label">Address:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtAddress" placeholder="Address" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ValidationGroup="AddMerchantGroup" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ForeColor="Red" ErrorMessage="Required">Required</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=txtPhone.ClientID %>" class="col-sm-2 control-label">Phone:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhone" placeholder="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <label for="<%=txtEmail.ClientID %>" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtEmail" placeholder="Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboMerchantType.ClientID %>" class="col-sm-2 control-label">Type:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantType" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=cboMerchantRegion.ClientID %>" class="col-sm-2 control-label">Region:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboMerchantRegion" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="<%=cboAgent.ClientID %>" class="col-sm-2 control-label">Agent:</label>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="cboAgent" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <label for="<%=chbxActive.ClientID %>" class="col-sm-2 control-label">Active:</label>
                        <div class="col-sm-4">
                            <asp:CheckBox ID="chbxActive" Style="padding-left: 20px;" Checked="true" CssClass="checkbox" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:LinkButton ValidationGroup="AddMerchantGroup" ID="btnAddMerchant" runat="server" CssClass="btn btn-primary" OnClick="btnAddMerchant_Click">
                        Add
                    </asp:LinkButton>
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
                        <div class="col-sm-5">
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
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addMerchantModal').on('shown.bs.modal', function (e) {
            $("#<%=txtMerchantName.ClientID%>").focus();
        });
    </script>
    <script>
        $('.selectpicker').selectpicker();
        $('#editMerchantModal').on('shown.bs.modal', function (e) {
            $("#<%=txtMerchantNameE.ClientID%>").focus();
        });
    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script>
        $(document).ready(function () {
            $('#tableMerchant').DataTable();
        });
    </script>
</asp:Content>

