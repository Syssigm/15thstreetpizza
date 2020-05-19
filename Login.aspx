<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_15thstreetpizza.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script type="text/javascript">
        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);
    </script>
    <script language="JavaScript" type="text/javascript">

        javascript: window.history.forward(1);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <br />
            <br />
            <br />
            <br />
            <table width="30%" align="center">
                <tr>
                    <td colspan="2" align="center" valign="bottom"><a href="#">
                        <img src="images/15thstreetpizza-logo.png" border="0" /></a><img src="images/TopCoaster.gif" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="colhead">Please Login To Proceed</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lblErrorMsg" runat="server" SkinID="Error"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">User Name :</td>
                    <td align="left">
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requser" runat="server" ControlToValidate="txtUserName" ErrorMessage="*Pleae Enter User Name" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">Password :</td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" AutoComplete="off" TextMode="password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqpass" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Pleae Enter Password" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" class="colhead">
                        <asp:Button ID="btnLogin" runat="server"
                            Text="Login" OnClick="btnLogin_Click" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" CausesValidation="false" PostBackUrl="~/AdminHome.aspx" runat="server"
                        Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
