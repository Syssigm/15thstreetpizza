<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Keywords.aspx.cs" Inherits="PizzaV5.Admin_Keywords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <table width="90%" align="center">
        <tr>
            <td class="colhead">Keywords
            </td>
        </tr>
        <tr>
            <asp:Label ID="lblError" runat="server" SkinID="Error"></asp:Label>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="dg" ShowFooter="True" runat="server"
                    DataKeyField="ID" AutoGenerateColumns="False"
                    CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
                    Width="100%" EnableViewState="True" AllowSorting="True"
                    oneditcommand="dg_EditCommand" onupdatecommand="dg_UpdateCommand" oncancelcommand="dg_CancelCommand"
                    onitemcommand="dg_ItemCommand" ondeletecommand="dg_DeleteCommand">
                    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
                    <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
                    <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="Keyword" SortExpression="Keyword">
                            <ItemTemplate>
                                <asp:Label ID="lblKeyword" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Keyword","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtKeywordF" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtKeywordE" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Keyword","") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Modify">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" Text="<img border=0 src=../../images/Admin/dg_Edit.gif alt=edit>"
                                    CommandName="Edit" CausesValidation="False"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="<img border=0 src=../../images/Admin/dg_OK.gif alt=save/update>"
                                    CommandName="Update" CausesValidation="False"></asp:LinkButton>&nbsp;&nbsp;
							    <asp:LinkButton ID="lnkCancel" runat="server" Text="<img border=0 src=../../images/Admin/dg_Cancel.gif alt=cancel>"
                                    CommandName="Cancel" CausesValidation="False"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Remove">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" Text="<img border=0 src=../../images/Admin/dg_Delete.gif alt=delete>"
                                    CommandName="Delete" CausesValidation="False"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:Button ID="btnAddRow" runat="server" Text="Add New" CommandName="AddANewRow"></asp:Button>
                            </FooterTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
        <tr>
            <td class="colhead" align="center">
                <asp:Button ID="btnClose" runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
            </td>
        </tr>
    </table>
</asp:Content>
