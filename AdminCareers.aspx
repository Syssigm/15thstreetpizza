<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCareers.aspx.cs" Inherits="PizzaV5.AdminCareers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <center> <asp:Label ID="lblmsg" align="center" runat="server" Text="Career Page-Admin." ForeColor="#006600" Font-Names="Arial"></asp:Label></center>
    <br />
    <table style="width:35%;bottom:10px; padding-left: 10px; height:100px; background:#EEF5FF;  border-style: solid;
    border-color: #0000ff;" align="center">
        <tr>
            <td> Enable Career Page: <asp:RadioButton ID="Enablerradio" runat="server" GroupName = "a" /></td>
             
            <td>Disable Career Page: <asp:RadioButton ID="Disableradio" runat="server" GroupName = "a" TabIndex="1" /></td>
         </tr>
         <tr>
            <td align="center" style="padding-left:120px">
                <asp:Button ID="Save" runat="server" Width="50" Height="30" Text="Save" OnClick="Submit_Click" />
                </td>
        </tr>
    </table>
    <table style="width:25%; background:#EEF5FF;" align="center">
   
   </table>
    <br />
    <br />
     
     
</asp:Content>
