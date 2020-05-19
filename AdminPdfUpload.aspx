<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPdfUpload.aspx.cs" Inherits="PizzaV5.AdminPdfUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <center><asp:Label ID="lblmsg" runat="server" Text="Welcome to the Pdf File Upload Page. Please select your Pdf File." ForeColor="#006600" Font-Names="Arial"></asp:Label></center>
   <br/>
    <table style="width:90%; border-style:solid; border-color:#0000ff;" align="center">
        <tr style="background-color:#EEF5FF; height:100px;" align="center">
            <td> 
                <asp:Label ID="lblerror" runat="server" Text=""></asp:Label><br/>
                <br/>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            </td>
            
        </tr>
     </table>
</asp:Content>
