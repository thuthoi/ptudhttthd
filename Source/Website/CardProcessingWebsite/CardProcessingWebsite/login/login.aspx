<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CardProcessingWebsite.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="../assets/dist/css/sb-admin-2.css" rel="stylesheet" />
    <link href="../assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <title></title>
</head>
<body>
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <%--                            <form role="form">--%>
                            <fieldset>
                                <div class="form-group">
                                    <%--<input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>--%>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Username" autofocus></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <%--<input class="form-control" placeholder="Password" name="password" type="password" value="">--%>
                                    <asp:TextBox ID="txtPassWord" runat="server" CssClass="form-control" placeholder="Password" type="password"></asp:TextBox>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <%--<input name="remember" type="checkbox" value="Remember Me">Remember Me--%>
                                        <asp:CheckBox ID="ckRemember" runat="server" />Remember Me
                                    </label>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lbErr" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <%--<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>--%>
                                <asp:LinkButton ID="btnLogin" runat="server" CssClass="btn btn-lg btn-success btn-block" OnClick="btnLogin_Click">
                                        Login                      
                                </asp:LinkButton>
                            </fieldset>
                            <%-- </form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/vendor/metisMenu/metisMenu.min.js"></script>
    <script src="../assets/dist/js/sb-admin-2.js"></script>
</body>
</html>
