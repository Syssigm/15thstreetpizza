<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminGallery.aspx.cs" Inherits="PizzaV6.AdminGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server" ClientIDMode="Static">
    <table width="90%" align="center" id="tbl">
        <tr>
            <td align="center">
            <asp:Label ID="lblError" runat="server" ></asp:Label></td>
            </tr>
        <tr>
            <td>
               
                <div style="height: 44px;">
                    <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Image Category:&nbsp;
                        <asp:DropDownList ID="ddlImageCategory" AutoPostBack="true" runat="server" Width="154px" OnSelectedIndexChanged="ddlImageCategory_SelectedIndexChanged"></asp:DropDownList>
                    </h3>
                    </div>
                <div>
                    <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Image Sub Category:&nbsp;
                        <asp:DropDownList ID="ddlImageSubCategory" AutoPostBack="true" runat="server" Width="154px" OnSelectedIndexChanged="ddlImageSubCategory_SelectedIndexChanged"></asp:DropDownList>
                    </h3>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataGrid ID="dgImages" ShowFooter="True" runat="server"
                    DataKeyField="ID" AutoGenerateColumns="False"
                    CssClass="datagrid_style" CellPadding="3" Font-Bold="True" ForeColor="#000099" BackColor="White"
                    Width="100%" AllowSorting="True"
                    OnCancelCommand="dgImages_CancelCommand" OnDeleteCommand="dgImages_DeleteCommand"
                    oneditcommand="dgImages_EditCommand"
                    OnItemCommand="dgImages_ItemCommand" onupdatecommand="dgImages_UpdateCommand">
                    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid_header_style" VerticalAlign="Middle"></HeaderStyle>
                    <SelectedItemStyle CssClass="datagrid_selecteditem_style"></SelectedItemStyle>
                    <ItemStyle HorizontalAlign="Center" CssClass="datagrid_item_style" VerticalAlign="Middle"></ItemStyle>
                    <AlternatingItemStyle CssClass="datagrid_alternatingitemstyle"></AlternatingItemStyle>
                    <Columns>
                        
                        <asp:TemplateColumn HeaderText="Image Title" SortExpression="ImageHeader">
                            <ItemTemplate>
                                <asp:Label ID="lblImageHeader" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ImageHeader","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtImageHeaderF" runat="server" Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtImageHeaderFValidator" ForeColor="Red" ControlToValidate="txtImageHeaderF" runat="server" ErrorMessage="Please Enter Image Title"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtImageHeaderE" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ImageHeader","") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtImageHeaderEValidator" ForeColor="Red" ControlToValidate="txtImageHeaderE" runat="server" ErrorMessage="Please Enter Image Title"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Image Name" SortExpression="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblImageName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesF" runat="server" Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNamesFValidator" ForeColor="Red" ControlToValidate="txtNamesF" runat="server" ErrorMessage="Please Enter Image Name"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtNamesE" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name","") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNamesEValidator" ForeColor="Red" ControlToValidate="txtNamesE" runat="server" ErrorMessage="Please Enter Image Name"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Image URL" SortExpression="ImageUrl">
                            <ItemTemplate>
                                <asp:Label ID="lblImageURL" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ImageUrl","") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <FooterTemplate>
                                <asp:FileUpload ID="ImageuploadF" runat="server" text="Choose" />
                                <asp:RequiredFieldValidator ID="ImageuploadFValidator" ForeColor="Red" ControlToValidate="ImageuploadF" runat="server" ErrorMessage="Please Choose Image"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox MaxLength="50" SkinID="Full" ID="txtImageURLE" ReadOnly="true" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ImageUrl","") %>'></asp:TextBox><asp:FileUpload ID="ImageuploadE" runat="server" text="Choose" onchange="hi(this)"/>
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
								    CommandName="Update" CausesValidation="true"></ASP:LinkButton>&nbsp;&nbsp;
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
		        <asp:Button ID="btnClose" Runat="server" Text="Close" CausesValidation="false" PostBackUrl="~/AdminHome.aspx"></asp:Button>
		    </td>
	    </tr>
        </table>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        var file;
        <%--function showFileName() {
            for (var i = 0; i < 4; i++)
                {
                file = document.getElementById('<%=((FileUpload)dgImages.Items[i].FindControl("uploadF")).ClientID %>');
            }
            alert(file);
    }--%>

        function hi(ob) {
            debugger;
            var grid = document.getElementById("<%= dgImages.ClientID %>");
            var inputs = grid.getElementsByTagName("input");
            //alert(inputs.length);
            var fileUpload;
            //var strRowNo = ob.id.toString().split("_")[3];//get row number
            //alert(strRowNo);
            for (var i = 0; i < inputs.length; i++) {
                
                if (inputs[i].type == "file") {
                    fileUpload = inputs[i].value;
                    
                    if(fileUpload != "")
                    {
                        document.getElementById("txtImageURLE").style.display = 'none';
                    }
                    else {
                        
                        document.getElementById("txtImageURLE").style.display = '';
                    }
                }
            }
        }

</script>
</asp:Content>
