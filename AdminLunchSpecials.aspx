<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminLunchSpecials.aspx.cs" Inherits="PizzaV5.AdminLunchSpecials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
<div class="mainTbl_grid">
    
   <h4 class="subHead">
    <asp:Label ID="lblmsg" align="center" runat="server" Text="Lunch Specials Page-Admin." ForeColor="#006600" Font-Names="Arial"></asp:Label>
       </h4>
    </div>

    <table style="width:90%; margin-bottom:10px; padding-left: 10px; height:100px; background:#EEF5FF;  border-style: solid;
    border-color: #0000ff; font-family: Verdana;" align="center">
        <tr>
            <td>Select the item: <asp:DropDownList ID="Itmdrplist" AutoPostBack="true" Width="60px" class="form-control" runat="server" OnSelectedIndexChanged="Itmdrplist_SelectedIndexChanged"></asp:DropDownList></td>
            <td>Validity Start Date: <input type="date" runat="server" id="TxtVldst" visible="true" class="form-control" placeholder="Select Start Date" style=" font-size: 14px;" /></td>
            
            <td>Validity End Date: <input type="date" runat="server" id="TxtVldend" visible="true" class="form-control" placeholder="Select End Date" style=" font-size: 14px;" /></td>
            <td align="center">
                <asp:Button ID="Save" runat="server" class="btn btn-primary" Text="Save" style="padding: 5px; min-width: 100px; border: 1px solid green; background: green; color: #FFF; font-size: 14px;" OnClick="Save_Click"  />
                </td>
        </tr>
    </table>
    <table width="90%" align="center">
	    <tr>
		    <td class="colhead">
			   <h4 class="subHead"> Lunch Specials </h4>
		    </td>
	    </tr>
	    <tr>
		    <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
	    </tr>
	    <tr>
		    <td>
			    <ASP:DATAGRID id="dg" ShowFooter="True" runat="server" 
                    DataKeyField="LunchID" AutoGenerateColumns="False"
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
					    <ASP:TemplateColumn HeaderText="LunchID" SortExpression="LunchID" Visible="false">
						    <ItemTemplate>
							    <ASP:Label ID="lblLunchID" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LunchID","") %>'>
							    </ASP:Label>
						    </ItemTemplate>

						</ASP:TemplateColumn>
			            <ASP:TemplateColumn HeaderText="Indx" SortExpression="Indx" Visible="false">
				            <ItemTemplate>
					            <ASP:Label ID="lblIndex" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Indx","") %>'>
					            </ASP:Label>
				            </ItemTemplate>
				        </ASP:TemplateColumn>
                        <ASP:TemplateColumn HeaderText="Day" SortExpression="Day">
						    <ItemTemplate>
							    <ASP:Label ID="lblDay" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Day","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtdayF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
                             <EditItemTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtdayE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Day","") %>'>
							    </asp:TextBox>
						    </EditItemTemplate>
                        </ASP:TemplateColumn>
					    <ASP:TemplateColumn HeaderText="Item" SortExpression="Item">
						    <ItemTemplate>
							    <ASP:Label ID="lblItem" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Item","") %>'>
							    </ASP:Label>
						    </ItemTemplate>
						    <FooterStyle HorizontalAlign="Center"></FooterStyle>
						    <FooterTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtItemF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="100" SkinID="Full" ID="txtItemE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Item","") %>'>
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
							    <asp:TextBox MaxLength="20" ID="txtPriceF" Runat="server" Text=""></asp:TextBox>
						    </FooterTemplate>
						    <EditItemTemplate>
							    <asp:TextBox MaxLength="20" ID="txtPriceE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Price","") %>'>
							    </asp:TextBox>
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
		        <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
		    </td>
	    </tr>
    </table>
</asp:Content>
