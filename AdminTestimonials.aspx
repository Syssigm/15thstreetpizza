<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" ValidateRequest="false"  CodeBehind="AdminTestimonials.aspx.cs" Inherits="PizzaV5.AdminTestimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <table width="90%" align="center">
	    <tr>
		    <td class="colhead">
			    Testimonials
		    </td>
	    </tr>
	    <tr>
		    <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
	    </tr>
	    <tr>
		    <td>
			    <ASP:DATAGRID id="dg1" ShowFooter="True" runat="server" 
                    DataKeyField="ID" AutoGenerateColumns="False"
				    CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
				    Width="100%" EnableViewState="True" AllowSorting="True" 
                    oncancelcommand="dg1_CancelCommand" ondeletecommand="dg1_DeleteCommand"
                    oneditcommand="dg1_EditCommand" onitemcommand="dg1_ItemCommand"
                    onsortcommand="dg1_SortCommand" onupdatecommand="dg1_UpdateCommand">
				    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
				    <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
				    <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
				    <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
				    <Columns>
					    <ASP:TemplateColumn HeaderText="Date" SortExpression="Dates">
						    <ItemTemplate>
							    <ASP:Label ID="lblDates" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Dates","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
					    </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Name" SortExpression="Names">
						    <ItemTemplate>
							    <ASP:Label ID="lblNames" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Names","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Names","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Title" SortExpression="Title">
						    <ItemTemplate>
							    <ASP:Label ID="lbltitle" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Title","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="50" ID="txttitleF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="50" ID="txttitleE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Title","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Review" SortExpression="Review">
						    <ItemTemplate>
							    <ASP:Label ID="lblReview" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Review","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="500" SkinID="Full" ID="txtReviewF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="500" SkinID="Full" ID="txtReviewE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Review","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
					    </ASP:TemplateColumn>
                        <ASP:TemplateColumn HeaderText="IsVerified" SortExpression="IsVerified">
						    <ItemTemplate>
                                <asp:CheckBox ID="cbverify" runat="server" Checked='<%#Convert.ToBoolean(Eval("IsVerified"))%>'/>
							    <%--<ASP:Label ID="lblReview" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IsVerified","") %>'>
							    </ASP:Label>--%>
						    </ItemTemplate>
						     <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							   <%-- <asp:TextBox MaxLength="100" SkinID="Full" ID="txtVerifyF" Runat="server" Text=""></asp:TextBox>--%>
                                <asp:CheckBox MaxLength="100"   ID="cbVerifyF" runat="server"  Checked="" />
						    </FooterTemplate>
						    <EditItemTemplate>
                            <asp:CheckBox MaxLength="100" ID="cbVerifyE" runat="server" Checked='<%#Convert.ToBoolean(Eval("IsVerified"))%>' />
							   <%-- <asp:TextBox MaxLength="100" SkinID="Full" ID="txtVerifyE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IsVerified","") %>'>
							    </asp:TextBox>--%>
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
