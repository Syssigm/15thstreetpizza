<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="PizzaV5.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <table width="90%" align="center">
        <tr>
            <td class="colhead">Admin Functionality
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="Use the navigation on left side"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="colhead" align="center">
                <asp:ImageButton runat="server" ID="imgHome" PostBackUrl="~/Default.aspx" ImageUrl="~/images/Default_on.jpg" OnClick="imgHome_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
