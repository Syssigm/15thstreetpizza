<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminEventsNews.aspx.cs" Inherits="PizzaV5.AdminEventsNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
   .HeadStyle
   {
           background-color: #2A3B52;
           height: 18px;
           color: #ffffff;
   }
   .SubHead
   {
            background-color: #5F6E83;
            Border-Color: #c0c0c0;
            Border-Width: 2;
            Font-Weight: bold;
            Color: #FFFFFF;
   }
   .ItemStyle{
        Font-Size: 9pt;
        Font-Family: tahoma,Helvetica,sans-serif;
        Background-Color: #EEF5FF;
        Border-Color: #c0c0c0;
        Border-Width: 1;
        Color: #000000;
        height: 100px;
   }
   .FooterStyle{
       font: 9pt;
        color: #ffffff;
        font-family: tahoma,Helvetica,sans-serif;
        background-color: #2A3B52;
        height: 18px;
}
   .datagrid_style
{
	Font-Size:9pt;
	Font-Family: tahoma,Helvetica,sans-serif;
	background-color: #EEF5FF;
	Border-Color :#c0c0c0;
	Color: #ffffff;
}
   .datagrid_selecteditem_style
{
	Font-Size:9pt;
	Font-Family: tahoma,Helvetica,sans-serif;
	Background-Color: #b0c4de;
	Border-Color :#c0c0c0;
	Border-Width :1;
	Color: #666699; 
}
   .datagrid_alternatingitemstyle
{
	Font-Size:9pt;
	Font-Family: tahoma,Helvetica,sans-serif;
	Background-Color: #ffffff;
	Color: #000000; 
	height:100px;
}

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
     <table width="90%" align="center">
        <tr>
	        <td class="HeadStyle">
		        News & Events - Admin
	        </td>
        </tr>
        <tr>
	        <asp:Label ID="lblError" Runat="server" SkinID="Error"></asp:Label>
        </tr>
        <tr>
	        <td>
		        <ASP:DATAGRID id="dg" ShowFooter="True" runat="server" 
                    DataKeyField="NewsID" AutoGenerateColumns="False"
			        CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
			        Width="100%" EnableViewState="True" AllowSorting="True" 
                    oncancelcommand="dg_CancelCommand" ondeletecommand="dg_DeleteCommand" 
                    oneditcommand="dg_EditCommand" onitemcommand="dg_ItemCommand" 
                    onsortcommand="dg_SortCommand" onupdatecommand="dg_UpdateCommand">
			        <HeaderStyle HorizontalAlign="Center" CssClass="SubHead" VerticalAlign="Middle"></HeaderStyle>
			        <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
			        <ItemStyle HorizontalAlign="Center" CssClass="ItemStyle" VerticalAlign="Middle"></ItemStyle>
			        <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
			        <Columns>
			            <asp:BoundColumn DataField="NewsID" HeaderText="NewsID" Visible="false"></asp:BoundColumn>
			            <asp:BoundColumn DataField="Indx" HeaderText="Index" Visible="false"></asp:BoundColumn>
				        <ASP:TemplateColumn HeaderText="NewsID" SortExpression="NewsID" Visible="false">
					        <ItemTemplate>
						        <ASP:Label ID="lblNewsID" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.NewsID","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					    </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="Index" SortExpression="Indx" Visible="false">
					        <ItemTemplate>
						        <ASP:Label ID="lblIndex" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Indx","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					    </ASP:TemplateColumn>
				        <ASP:TemplateColumn HeaderText="News" SortExpression="News">
					        <ItemTemplate>
						        <ASP:Label ID="lblNews" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.News","") %>'>
						        </ASP:Label>
					        </ItemTemplate>
					        <FooterStyle HorizontalAlign="Center"></FooterStyle>
					        <FooterTemplate>
						        <asp:TextBox MaxLength="250" SkinID="MultilineText" ID="txtNewsF" Runat="server" Text=""></asp:TextBox>
					        </FooterTemplate>
					        <EditItemTemplate>
						        <asp:TextBox MaxLength="250" SkinID="MultilineText" ID="txtNewsE" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.News","") %>'>
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
	        <td class="FooterStyle" align="center">
	            <asp:Button ID="btnClose" Runat="server" Text="Close" PostBackUrl="~/AdminHome.aspx"></asp:Button>
	        </td>
        </tr>
    </table>
</asp:Content>
