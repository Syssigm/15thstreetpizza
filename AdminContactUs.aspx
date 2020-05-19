<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminContactUs.aspx.cs" Inherits="PizzaV5.AdminContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <table width="90%" align="center">
        <tr style="background-color: #2A3B52; height:18px; color:white;">
            <td class="colhead">Contact Us - Admin
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" SkinID="Error"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table width="80%" align="center">
                    <tr style="background-color:#5F6E83; color:white;">
                        <td colspan="2">Call us at:
                        </td>
                    </tr>
                    <tr style="background-color:#EEF5FF; height:100px;">
                        <td width="40%" align="right">
                            <asp:Label ID="lblCall" runat="server" Text="Call in Number :"></asp:Label>
                        </td>
                        <td width="60%" align="left">
                            <asp:TextBox MaxLength="25" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtCall" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#5F6E83; color:white;">
                        <td colspan="2">Find us at:
                        </td>
                    </tr>
                    <tr style="background-color:#EEF5FF; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblFind1" runat="server" Text="Line 1 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtFind1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblFind2" runat="server" Text="Line 2 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtFind2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#EEF5FF; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblFind3" runat="server" Text="Line 3 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtFind3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblFind4" runat="server" Text="Line 4 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtFind4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <%--<tr style="background-color:#EEF5FF; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblFind5" runat="server" Text="Line 5 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtFind5" runat="server"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr style="background-color:#5F6E83; color:white;">
                        <td colspan="2">Hours:
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblHours1" runat="server" Text="Hours Line1:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtHours1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#EEF5FF; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblHours2" runat="server" Text="Hours Line2 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtHours2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblHours3" runat="server" Text="Hours Line3 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtHours3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <%--<tr style="background-color:#EEF5FF; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblHours4" runat="server" Text="Hours Line4 :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtHours4" runat="server"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr style="background-color:#5F6E83; color:white;">
                        <td colspan="2">E-Mail us at:
                        </td>
                    </tr>
                    <tr style="background-color:#ffffff; height:100px;">
                        <td align="right">
                            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox MaxLength="50" style="color: #2A3B52; background-color: #EEF5FF; font-family: Verdana; font-size: Small; height: 18px; width: 97%;" SkinID="Full" ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="colhead" align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"></asp:Button>&nbsp;&nbsp;&nbsp;
			        <asp:Button ID="btnClose" runat="server" Text="Cancel" PostBackUrl="~/AdminHome.aspx"></asp:Button>
            </td>
        </tr>
    </table>
</asp:Content>
