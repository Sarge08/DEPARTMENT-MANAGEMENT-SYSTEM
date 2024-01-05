<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Login  ITM Ravenshaw University</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <link rel="shortcut icon" type="image/x-icon" href="img/logo.png" />
    <link href="css/LoginCss.css" rel="stylesheet" />
    <link href="css/ChecBoxStyleSheet.css" rel="stylesheet" />
    <link href="css/select2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <asp:Label ID="lblUserType" runat="server" Visible="true"></asp:Label>
        <asp:Panel ID="Panel1" DefaultButton="btnSignIn" runat="server">
            <div class="container">
                <div class="loginform">
                <header class="header">
                     <img src="img/ravlogo.jpg" class="img-responsive" style="height: 100px;" />
                    <h2 class="title">ITM Account Login</h2>
                    <asp:Label ID="lblMessage" runat="server" Width="100%" EnableViewState="false"></asp:Label>
                </header>
                <div name="signin" class="form">
                    <label for="email" class="label-email">
                        <span class="email-span">Email address
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="pull-right" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtUserName" SetFocusOnError="true" ForeColor="Yellow" Font-Size="10" Display="Dynamic"></asp:RequiredFieldValidator></label>
                    </span>
                        <div class="input-email-container">
                            <i class="ph-envelope"></i>
                            <asp:TextBox ID="txtUserName" CssClass="input-email" placeholder="Enter your email" runat="server"></asp:TextBox>
                        </div>
                    <label for="password" class="label-password">
                        <span class="password-span">Password
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="pull-right" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" SetFocusOnError="true" ForeColor="Yellow" Font-Size="10" Display="Dynamic"></asp:RequiredFieldValidator></label>
                    </span>
                        <div class="input-password-container">
                            <i class="ph-lock"></i>
                            <asp:TextBox ID="txtPassword" TextMode="Password" autocomplete="off" CssClass="input-password" placeholder="*************" runat="server"></asp:TextBox>
                        </div>
                    <%-- <label for="email" class="label-email">
                                <span class="email-span">User Type
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="pull-right" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtUserName" SetFocusOnError="true" ForeColor="Yellow" Font-Size="10" Display="Dynamic"></asp:RequiredFieldValidator></label>
                            </span>
                              <div class="input-email-container">
                                  <i class="ph-user"></i>
                                  <asp:DropDownList ID="DropDownListUserType" CssClass="DropDown form-control select2" runat="server">
                                      <asp:ListItem>Choose UserType</asp:ListItem>
                                      <asp:ListItem>Admin</asp:ListItem>
                                      <asp:ListItem>Training Centre</asp:ListItem>
                                  </asp:DropDownList>
                              </div>--%>
                    <div class="coloured">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="CheckBox1" runat="server" /><span class="checkbox-material"><span class="check"></span></span> Remember Me
                            </label>
                        </div>
                    </div>
                    <asp:LinkButton ID="btnSignIn" OnClick="btnSignIn_Click" ValidationGroup="Error" CssClass="btn-sign-in" runat="server"><i class="ph-sign-in"></i> Sign In</asp:LinkButton>
                </div>
                <footer class="footer">
                    <a href="Home/Default.aspx">Home</a>
                    <a href="#" class="footer-link">Don't have an account yet? Sign Up!</a>
                </footer>
                    </div>
            </div>
        </asp:Panel>
        <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src='https://unpkg.com/phosphor-icons'></script>
    <script src="js/select2.full.js"></script>
    <script>
        $(function () {
            $(".select2").select2();
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            $(function () {
                $(".select2").select2();
            });
        });
    </script>
</body>
</html>
