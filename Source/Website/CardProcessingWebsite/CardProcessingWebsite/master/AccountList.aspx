<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/masterPage.Master" AutoEventWireup="true" CodeBehind="AccountList.aspx.cs" Inherits="CardProcessingWebsite.master.AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageheader" runat="server">
    Danh sách Account
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <a href="javascript: " class="btn btn-primary" data-backdrop="false" data-toggle="modal" data-target="#addAccountModal">
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
                    Danh sách các Account
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <asp:ListView runat="server" ID="listAccount">
                        <LayoutTemplate>
                            <table style="width: 100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Tên người dùng</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Phân loại người dùng</th>
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
                                <td><%#Eval("Master_Agent_Merchant_Name") %></td>
                                <td><%#Eval("Username") %></td>
                                <td><%#Eval("Role") %></td>
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
    <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Thêm Merchant</h4>
                </div>
                <div class="modal-body form-horizontal">
                    <div class="form-group">
                        <label for="<%=txtUserName.ClientID %>" class="col-sm-2 control-label">Tên đăng nhập:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="Chưa nhập" Display="Dynamic">Bắt buộc</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="validatorUID" runat="server" ControlToValidate="txtUserName" ErrorMessage="Tên đăng nhập đã tồn tại" ForeColor="Red" Display="Dynamic"  ClientValidationFunction="check_user_exist" SetFocusOnError="True">Tên đăng nhập đã tồn tại</asp:CustomValidator>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="<%=txtPassword.ClientID %>" class="col-sm-2 control-label">Mật khẩu:</label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Chưa nhập" Display="Dynamic">Bắt buộc<br /></asp:RequiredFieldValidator>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="confirm" class="col-sm-2 control-label">Nhập lại mật khẩu:</label>

                        <div class="col-sm-10">
                            <asp:TextBox ID="txtNLMK" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNLMK" ForeColor="Red" ErrorMessage="Chưa nhập" Display="Dynamic">Bắt buộc<br /></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu nhập lại chưa đúng" ControlToCompare="txtPassword" ControlToValidate="txtNLMK" Font-Bold="False" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Mật khẩu nhập lại chưa đúng</asp:CompareValidator>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="<%=cboMaster.ClientID %>" class="col-sm-2 control-label">Master</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="cboMaster" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>

                        <div class="col-sm-1">
                            <asp:RadioButton ID="rdMaster" runat="server" GroupName="Role" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="<%=cboAgent.ClientID %>" class="col-sm-2 control-label">Agent</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="cboAgent" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-1">
                            <asp:RadioButton ID="rdAgent" runat="server" GroupName="Role" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="<%=cbMerchant.ClientID %>" class="col-sm-2 control-label">Merchant</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="cbMerchant" runat="server" CssClass="form-control selectpicker">
                            </asp:DropDownList>
                        </div>
                        <div class="col-sm-1">
                            <asp:RadioButton ID="rdMerchant" runat="server" GroupName="Role" />
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <asp:LinkButton ID="btnAddAccount" runat="server" CssClass="btn btn-primary" OnClick="btnAddAccount_Click" OnClientClick="a();">
                        <i class="fa fa-check"> Lưu</i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scriptFile" runat="server">
    <script>
        $('#addAccountModal').on('shown.bs.modal', function (e) {
            alert('a');
            $("#<%=txtUserName.ClientID%>").focus();
        });

        function check_user_exist(source, args) {
            
            var _url = 'http://localhost:20752/api/account/Check_Account_UserName_Exist/' + $('#<%=txtUserName.ClientID %>').val();
            // alert($('#<%=txtUserName.ClientID %>').val());
            //alert(_url);
            //var jsonToPost = JSON.stringify(dataToPost);
            //console.log(jsonToPost);

            $.ajax({
                type: 'GET',
                url: _url,
                //data: jsonToPost,
                dataType: 'json',
                async: false,
                //contentType: 'application/json',
                timeout: 30 * 1000
            })
                .done(function (data, textStatus, jqXHR) {
                    //console.log(data);
                    //console.log(jqXHR);
                    args.IsValid = true;
                    //alert("a");
                    return;
                   
                   
                })
                .fail(function (jqXHR, textStatus, error) {
                    //console.log(textStatus);
                    //console.log(error);
                    args.IsValid = false;
                    //alert("b");
                   
                    //args.IsValid = false;
                });
            <%--if ($('#<%=txtUserName.ClientID %>').val()  == "a")
            {
                alert("a1");
                args.IsValid = false;
            }
            else
            {
                alert("b1");
                args.IsValid = true;
            }--%>
            

        }
    </script>
    <script src="../assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../assets/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../assets/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/jquery-2.1.4.min.js"></script>
</asp:Content>
