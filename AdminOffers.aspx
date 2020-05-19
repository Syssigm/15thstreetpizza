<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminOffers.aspx.cs" Inherits="PizzaV5.AdminOffers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .style{
             background-color:#5F6E83; 
             border-color:#c0c0c0;
             Font-Weight: bold;
        }
        .gditem{
            Font-Size: 9pt;
            Font-Family: tahoma,Helvetica,sans-serif;
            Background-Color: #EEF5FF;
            Border-Color: #c0c0c0;
            Border-Width: 1;
            Color: #000000;
            height: 100px;
        }
        .gdAlternateStyle{
            Background-Color: #ffffff;
            Color: #000000;
            height: 100px;
        }
        .tdStyle{
            background-color:#2A3B52; 
            height:18px; 
            color:white;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
     <table width="90%" align="center">
        <tr>
	        <td class="tdStyle">
		        Offer - Admin
	        </td>
        </tr>
        <tr>
	        <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
        </tr>
        <tr>
	        <td>
		        <ASP:DATAGRID id="dg" ShowFooter="True" runat="server" 
                    DataKeyField="OfferID" AutoGenerateColumns="False"
			        CssClass="style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
			        Width="100%" EnableViewState="True" AllowSorting="True" 
                    oncancelcommand="dg_CancelCommand" ondeletecommand="dg_DeleteCommand"
                    oneditcommand="dg_EditCommand" onitemcommand="dg_ItemCommand"  
                    onupdatecommand="dg_UpdateCommand">
			        <HeaderStyle HorizontalAlign="Center" CssClass="style"  VerticalAlign="Middle"></HeaderStyle>
			        <SelectedItemStyle CssClass="gditem"></SelectedItemStyle>
			        <ItemStyle HorizontalAlign="Center" CssClass="gditem" VerticalAlign="Middle"></ItemStyle>
			        <AlternatingItemStyle CssClass="gditem"></AlternatingItemStyle>
			        <Columns>
			            <asp:BoundColumn DataField="OfferID" HeaderText="OfferID" Visible="false"></asp:BoundColumn>
				        <ASP:TemplateColumn HeaderText="Heading" SortExpression="Heading">
					        <ItemTemplate>
						        <ASP:Label ID="lblHeading" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Heading","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
					            <asp:TextBox MaxLength="50" ID="txtHeadingF" Runat="server" Text=""></asp:TextBox>
					        </FooterTemplate>
					        <EditItemTemplate>
						        <asp:TextBox MaxLength="50" ID="txtHeadingE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Heading","") %>'>
						        </asp:TextBox>
					        </EditItemTemplate>
				        </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="Offer" SortExpression="Offer">
					        <ItemTemplate>
						        <ASP:Label ID="lblOffer" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Offer","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
						        <asp:TextBox MaxLength="255" SkinID="MultilineText" ID="txtOfferF" Runat="server" Text=""></asp:TextBox>
					        </FooterTemplate>
					        <EditItemTemplate>
						        <asp:TextBox MaxLength="255" SkinID="MultilineText" ID="txtOfferE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Offer","") %>'>
						        </asp:TextBox>
					        </EditItemTemplate>
				        </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="EndLine" SortExpression="EndLine">
					        <ItemTemplate>
						        <ASP:Label ID="lblEndLine" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.EndLine","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
						        <asp:TextBox MaxLength="50" ID="txtEndLineF" Runat="server" Text=""></asp:TextBox>
					        </FooterTemplate>
					        <EditItemTemplate>
						        <asp:TextBox MaxLength="50" ID="txtEndLineE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.EndLine","") %>'>
						        </asp:TextBox>
					        </EditItemTemplate>
				        </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="Active" SortExpression="Active">
					        <ItemTemplate>
						        <ASP:Label ID="lblActive" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Active","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
					            <asp:CheckBox ID="chkActiveF" runat="server" />
					        </FooterTemplate>
					        <EditItemTemplate>
                                <asp:CheckBox ID="chkActiveE" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container, "DataItem.Active","")) %>'/>
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
	        <td   class="tdStyle" align="center">
	            <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
	        </td>
        </tr>
    </table>
</asp:Content>
