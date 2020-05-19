<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Videos_Admin.aspx.cs" Inherits="PizzaV5.Videos_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <table width="90%" align="center">
        <tr>
            <td class="colhead">Vedios
            </td>
        </tr>
        <tr>
            <asp:Label ID="lblError" runat="server" SkinID="Error"></asp:Label>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="dgVedios" ShowFooter="True" runat="server"
                    DataKeyField="ID" AutoGenerateColumns="False"
                    CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
                    Width="100%" EnableViewState="True" AllowSorting="True"
                    OnCancelCommand="dgVedios_CancelCommand" OnDeleteCommand="dgVedios_DeleteCommand"
                    oneditcommand="dgVedios_EditCommand"
                    OnItemCommand="dgVedios_ItemCommand" onupdatecommand="dgVedios_UpdateCommand"
                    OnSortCommand="dgVedios_SortCommand" OnSelectedIndexChanged="dgVedios_SelectedIndexChanged">
                    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
                    <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
                    <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="Video Name" SortExpression="Names">
                            <ItemTemplate>
                                <asp:Label ID="lblVideoName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesF" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesE" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name","") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Video URL" SortExpression="VideoURL">
                            <ItemTemplate>
                                <asp:Label ID="lblVideoURL" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.VideoUrl","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtVideoURLF" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtVideoURLE" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.VideoUrl","") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                       <%-- <asp:TemplateColumn HeaderText="Preview" SortExpression="Preview">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnPreview" runat="server" CommandArgument='<%# Eval("Name") %>' ImageUrl="~/Images/preview1.png" OnClick="btnPreview_Click"/>
                            </ItemTemplate>
                        </asp:TemplateColumn>--%>
                        <ASP:TemplateColumn HeaderText="Modify">
						    <ItemTemplate>
							    <ASP:LinkButton ID="lnkEdit" Runat="server" Text="<img border=0 src=../../images/Admin/dg_Edit.gif alt=edit>"
								    CommandName="Edit" CausesValidation="False"></ASP:LinkButton>
						    </ItemTemplate>
						    <EditItemTemplate>
							    <ASP:LinkButton ID="lnkUpdate" Runat="server" Text="<img border=0 src=../../images/Admin/dg_OK.gif alt=save/update>"
								    CommandName="Update" CausesValidation="False"></ASP:LinkButton>&nbsp;&nbsp;
							    <ASP:LinkButton ID="lnkCancel" Runat="server" Text="<img border=0 src=../../images/Admin/dg_Cancel.gif alt=cancel>"
								    CommandName="Cancel" CausesValidation="False"></ASP:LinkButton>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
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
		        <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
		    </td>
	    </tr>
    </table>   
</asp:Content>
