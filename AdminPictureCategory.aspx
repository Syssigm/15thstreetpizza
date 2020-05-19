﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPictureCategory.aspx.cs" Inherits="PizzaV6.AdminPictureCategory" %>
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
                <asp:LinkButton ID="lnkNewCategory" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" OnClick="lnkNewCategory_Click" CausesValidation="False" >Add New Category</asp:LinkButton>
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
                <asp:Button ID="btnCategorySave" runat="server" Text="Save" Visible="False" OnClick="btnCategorySave_Click" />
                
                <asp:Button ID="btnCategoryCancel" runat="server" Text="Cancel" OnClick="btnCategoryCancel_Click" Visible="False" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td rowspan="5" class="auto-style5">
                &nbsp;</td>
            <td rowspan="5" class="auto-style4">
                <asp:LinkButton ID="lnkNewSubCategory" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" OnClick="lnkNewSubCategory_Click" CausesValidation="False">Add New Sub Category</asp:LinkButton>
            </td>
            <td class="auto-style3">
                <asp:Label ID="lblSelectCategory" runat="server" Text="Select category name :" Visible="False" Font-Bold="True" Font-Size="Medium"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddlCategory" runat="server" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblnewSubCategory" runat="server" Text="Enter subcategory name :" Visible="False" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TxtNewSubcategory" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtSubCategory0" ValidationGroup="B" runat="server" ControlToValidate="TxtNewSubcategory" ErrorMessage="Please Enter Sub Category Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnSubCategorySave" runat="server" Text="Save" Visible="False" OnClick="btnSubCategorySave_Click" />
&nbsp;
                <asp:Button ID="btnSubCategoryCancel" runat="server" Text="Cancel" Visible="False" OnClick="btnSubCategoryCancel_Click" CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
