<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminMPSI.aspx.cs" Inherits="PizzaV5.AdminMPSI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
     <table width="90%" align="center">
        <tr>
	        <td class="colhead">
		        Main Page - Sub Items
	        </td>
        </tr>
        <tr>
            <td>
	            <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Please select a Main Page Item to add/modify/delete sub items : &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlMainPageItem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMainPageItem_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
         <tr>
             <td>
                 <br />
             </td>
         </tr>
        <tr>
	        <td>
		        <ASP:DATAGRID id="dg" ShowFooter="True" runat="server" 
                    DataKeyField="SubItemID" AutoGenerateColumns="False"
			        CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
			        Width="100%" EnableViewState="True" AllowSorting="True" 
                    oncancelcommand="dg_CancelCommand" ondeletecommand="dg_DeleteCommand" 
                    oneditcommand="dg_EditCommand" onitemcommand="dg_ItemCommand" 
                    onsortcommand="dg_SortCommand" onupdatecommand="dg_UpdateCommand" 
                    onitemdatabound="dg_ItemDataBound">
			        <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
			        <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
			        <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
			        <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
			        <Columns>
				        <ASP:TemplateColumn HeaderText="SubItemID" SortExpression="SubItemID">
					        <ItemTemplate>
						        <ASP:Label ID="lblMPSubItemID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubItemID","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
				        </ASP:TemplateColumn>
		                <ASP:TemplateColumn HeaderText="Index" SortExpression="Indx" Visible="false">
			                <ItemTemplate>
				                <ASP:Label ID="lblIndex" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Indx","") %>'>
				                </ASP:Label>
			                </ItemTemplate>
			            </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="SubItem" SortExpression="SubItem">
					        <ItemTemplate>
						        <ASP:Label ID="lblMPSubItem" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubItem","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
						        <asp:TextBox MaxLength="250" SkinID="Full" ID="txtMPSubItemF" Runat="server" Text=""></asp:TextBox>
					        </FooterTemplate>
					        <EditItemTemplate>
						        <asp:TextBox MaxLength="250" SkinID="Full" ID="txtMPSubItemE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SubItem","") %>'>
						        </asp:TextBox>
					        </EditItemTemplate>
				        </ASP:TemplateColumn>
				        <ASP:TemplateColumn Visible="false" HeaderText="IsSubItemBulleted" SortExpression="IsSubItemBulleted">
					        <ItemTemplate>
						        <ASP:Label ID="lblMPIsSubItemBulleted" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IsSubItemBulleted","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
					            <asp:CheckBox ID="chkMPIsSubItemBulletedF" runat="server" />
					        </FooterTemplate>
					        <EditItemTemplate>
                                <asp:CheckBox ID="chkMPIsSubItemBulletedE" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container, "DataItem.IsSubItemBulleted","")) %>'/>
					        </EditItemTemplate>
				        </ASP:TemplateColumn>
			            <ASP:TemplateColumn HeaderText="UpDown">
				            <ItemTemplate>
					            <ASP:LinkButton ID="lnkUp" Runat="server" Text="<img border=0 src=../../images/Admin/dg_MoveUp.gif alt=Move Up>"
						            CommandName="MoveUp" CausesValidation="False"></ASP:LinkButton>
					            <ASP:LinkButton ID="lnkDown" Runat="server" Text="<img border=0 src=../../images/Admin/dg_MoveDown.gif alt=Move Down>"
						            CommandName="MoveDown" CausesValidation="False"></ASP:LinkButton>
				            </ItemTemplate>
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
	            <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminMPSI.aspx"></asp:Button>
	        </td>
        </tr>
    </table>
</asp:Content>
