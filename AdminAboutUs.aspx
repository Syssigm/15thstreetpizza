<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAboutUs.aspx.cs" Inherits="PizzaV5.AdminAboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
     <table width="90%" align="center">
        <tr style="background-color:#2A3B52; height:18px; color:white">
	        <td class="colhead">
		        AboutUs - Admin
	        </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
            </td>
        </tr>
        <tr style="background-color:#5F6E83; color:white; font-weight:bold;">
            <td colspan="2">
                Change Text
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox Rows="8" ID="txtAboutUs" Width="99%" runat="server" 
                    SkinID="MultilineFull" TextMode="MultiLine" style="background-color:azure"></asp:TextBox>                            
            </td>
        </tr>
        <tr>
	        <td style="background-color:#2A3B52; height:18px;" align="center">
	            <asp:Button ID="btnSave" Runat="server" Text="Save" onclick="btnSave_Click"
                    style="height: 26px"></asp:Button>&nbsp;&nbsp;&nbsp;
	            <asp:Button ID="btnClose" Runat="server" Text="Cancel" PostBackUrl="~/AdminHome.aspx"></asp:Button>
	        </td>
        </tr>
    </table>
</asp:Content>
