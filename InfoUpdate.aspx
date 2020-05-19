<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="InfoUpdate.aspx.cs" Inherits="_15thstreetpizza.InfoUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 75%;
        }
        .auto-style3 {
        width: 186px;
    }
    .auto-style4 {
        width: 244px;
    }
    .auto-style5 {
        width: 136px;
    }
    .auto-style6 {
        width: 144px;
    }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <div align="center">
        <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
    </div>
    <table class="auto-style1">
         <tr>
            <td rowspan="4" class="auto-style5">
                &nbsp;</td>
            <td rowspan="4" class="auto-style4">
                <asp:LinkButton ID="lnkupdtCategory" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" OnClick="lnkupdtCategory_Click" CausesValidation="False" >Update Info Category</asp:LinkButton>
            </td>
            <td class="auto-style3">
                <asp:Label ID="lblCategory" runat="server" Text="Enter new category name :" Visible="False" Font-Bold="True" Font-Size="Medium"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TxtCategory" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
         <tr>
        <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtCategory" runat="server" ControlToValidate="TxtCategory" ErrorMessage="Please Enter Category Name" ValidationGroup="A" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnCategoryupdate" runat="server" Text="Update" Visible="False" OnClick="btnCategoryupdate_Click" />
                
                <asp:Button ID="btnCategoryCancel" runat="server" Text="Cancel" OnClick="btnCategoryCancel_Click" Visible="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
