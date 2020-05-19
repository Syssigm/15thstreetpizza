<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRegularSpecials.aspx.cs" Inherits="PizzaV5.AdminRegularSpecials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
<table width="90%" align="center">
	    <tr>
		    <td class="colhead">
			    Regular Specials
		    </td>
	    </tr>
	    <tr>
		    <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
	    </tr>
	    <tr>
		    <td>
			    <ASP:DATAGRID id="dg" ShowFooter="True" runat="server" 
                    DataKeyField="RegularID" AutoGenerateColumns="False"
				    CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
				    Width="100%" EnableViewState="True" AllowSorting="True" 
                    oncancelcommand="dg_CancelCommand" ondeletecommand="dg_DeleteCommand"
                    oneditcommand="dg_EditCommand" onitemcommand="dg_ItemCommand" 
                    onsortcommand="dg_SortCommand" onupdatecommand="dg_UpdateCommand">
				    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
				    <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
				    <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
				    <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
				    <Columns>
					    <ASP:TemplateColumn HeaderText="Item" SortExpression="Item">
						    <ItemTemplate>
							    <ASP:Label ID="lblItem" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Item","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="50" SkinID="Full" ID="txtItemF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="50" SkinID="Full" ID="txtItemE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Item","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Price" SortExpression="Price">
						    <ItemTemplate>
							    <ASP:Label ID="lblPrice" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Price","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="15" ID="txtPriceF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="15" ID="txtPriceE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Price","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Comment" SortExpression="Comment">
						    <ItemTemplate>
							    <ASP:Label ID="lblComment" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtCommentF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtCommentE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
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
					    <ASP:TemplateColumn HeaderText="Remove">
						    <ItemTemplate>
							    <ASP:LinkButton ID="lnkDelete" Runat="server" Text="<img border=0 src=../../images/Admin/dg_Delete.gif alt=delete>"
								    CommandName="Delete" CausesValidation="False"></ASP:LinkButton>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:Button ID="btnAddRow" Runat="server" Text="Add New" CommandName="AddANewRow"></asp:Button>
						    </FooterTemplate>
					    </ASP:TemplateColumn>
				    </Columns>
			    </ASP:DATAGRID>
		    </td>
	    </tr>
	    <tr>
		    <td class="colhead" align="center">
		        <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
		    </td>
	    </tr>
    </table>
</asp:Content>
