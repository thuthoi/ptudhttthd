<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="agentSearch.aspx.cs" Inherits="CardProcessingWebsite.master.agentSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Search Agent
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="css" runat="server">
    <style>
input[type=radio] + label{
  margin-right:39px
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Search Agent
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-md-3" style="padding-top: 7px; margin-left: 16px">

            <asp:RadioButtonList ID="rbActive" CssClass="radio-inline" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Active" Value="1" />
                <asp:ListItem Text="Inactive" Value="0" />
                <asp:ListItem Text="Both" Value="2" Selected="True" />
            </asp:RadioButtonList>
        </div>

        <div class="form-group input-group col-md-6">
            <asp:TextBox ID="txtKeyword" onkeypress="return EnterEvent(event)" placeholder="Keywords" runat="server" class="form-control" autofocus="true"></asp:TextBox>

            <span class="input-group-btn">

                <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-default" OnClick="btnSearch_Click">
                    <i class="fa fa-search"></i>
                </asp:LinkButton>

            </span>
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
                    <asp:ListView runat="server" ID="listAgent" OnItemCommand="listAgent_ItemCommand">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover" id="tableAgent">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 10%">Name</th>
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
                                <td><%#Eval("AgentName") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("Phone") %></td>
                                <td><%#Eval("Email") %></td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Detail & Edit" CssClass="btn btn-success btn-xs" CommandName="EditAgent" CommandArgument='<%# Eval("AgentID") %>'>
                                        <i class="fa fa-pencil"></i>
                                    </asp:LinkButton>
                                </td>
                                <td style="vertical-align: middle; text-align: center">
                                    <asp:LinkButton ID="btnReport" runat="server" ToolTip="View Report" CssClass="btn btn-info btn-xs" CommandName="ReportAgent" CommandArgument='<%# Eval("AgentID") %>'>
                                        <i class="fa fa-bar-chart-o"></i>
                                    </asp:LinkButton>
                                </td>
                              
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div class="alert alert-warning">
                                Did not match any agents.
                            </div>
                        </EmptyDataTemplate>
                    </asp:ListView>
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
                        <div class="col-sm-3">
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

    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>



    <script>
        $(document).ready(function () {
            $('#tableAgent').DataTable(
                {
                    "searching": false,
                    "lengthChange": false,
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
