<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Specials.aspx.cs" Inherits="_15thstreetpizza.Specials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section" >
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 map-col">
        <div class="welcome clearfix">
          <h3>Specials @15thStreet </h3>
			
			
<div class="tab_content" style="display: block;">
    <%--<select class="form-control form-control-lg" style="max-width: 220px;">
        <option id="daily">Daily Specials</option>
        <option id="lunch">Lunch Specials</option>
        <option id="pizza">Pizza Specials</option>

    </select>--%>
    <asp:DropDownList ID="drpspllist" class="form-control form-control-lg" style="max-width: 220px;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpspllist_SelectedIndexChanged"></asp:DropDownList>
              <h4 class="orange margin-bottom-20"><p class="text-primary">Valid Thru:</p> 
                    <p><span style="min-width: 100px; display: inline-block; text-align: right; padding-right: 5px;">From: </span><asp:Label ID="lblstartdate" runat="server" Text=""></asp:Label></p>
                    <p><span style="min-width: 100px; display: inline-block; text-align: right; padding-right: 5px;">To: </span><asp:Label ID="lblenddate" runat="server" Text=""></asp:Label></p></h4>
<!-- <h4 class="orange margin-bottom-20"><span class="text-primary">Validity Period:</span> Start Date:<asp:Label ID="lslblstrtdt" runat="server" Text=""></asp:Label> End Date :<asp:Label ID="lslblendate" runat="server" Text=""></asp:Label></h4>
<h4 class="orange margin-bottom-20"><span class="text-primary">Validity Period:</span> Start Date:<asp:Label ID="pslblstrtdt" runat="server" Text=""></asp:Label> End Date: <asp:Label ID="pslblendate" runat="server" Text=""></asp:Label></h4>
	-->
    <div id="dailid" runat="server">
    <table class="table table-striped">
		  <tr>
			<%--<th>S.No</th>--%>
			<th>Day</th>
			<th>Special Name</th>
		  </tr>
            <asp:Repeater ID="Rptspecials" runat="server">
                <ItemTemplate>
		  <tr>
			<%--<td><%#(((RepeaterItem)Container).ItemIndex+1).ToString()%></td>--%>
			<td><%# Eval("daiday") %></td>
            <td><%# Eval("daispe") %></td>
		  </tr>
		 		                 </ItemTemplate>
</asp:Repeater>  
 
		</table>
   </div>

    <div id="LunchID" runat="server">
    <table class="table table-striped">
		  <tr>
			<%--<th>S.No</th>--%>
			<th>Day</th>
			<th>Item Name</th>
            <th>Item Price($)</th>
		  </tr>
            <asp:Repeater ID="Rptlunsp" runat="server">
                <ItemTemplate>
		  <tr>
			<%--<td><%#(((RepeaterItem)Container).ItemIndex+1).ToString()%></td>--%>
			<td><%# Eval("dailday") %></td>
            <td><%# Eval("dailitem") %></td>
            <td><%# Eval("dailprics") %></td>
		  </tr>
 </ItemTemplate>
</asp:Repeater>  
 
		</table>
   </div>

    <div id="PizzaID" runat="server">
    <table class="table table-striped">
		  <tr>
			<th>S.No</th>
			<th>Day</th>
            <th>Pizza Details</th>
			<th>Price $(Small)</th>
            <th>Price $(Personal)</th>
            <th>Price $(Medium)</th>
            <th>Price $(Large)</th>
		  </tr>
            <asp:Repeater ID="Rptpizza" runat="server">
                <ItemTemplate>
		  <tr>
			<td><%#(((RepeaterItem)Container).ItemIndex+1).ToString()%></td>
			<td><%# Eval("Pizzaday") %></td>
            <td><%# Eval("Pizzaitem") %></td>
            <td><%# Eval("Pizsmlpric") %></td>
            <td><%# Eval("Pizpersopric") %></td>
            <td><%# Eval("Pizzamedpric") %></td>
            <td><%# Eval("Pizzalargpric") %></td>
		  </tr>
 </ItemTemplate>
</asp:Repeater>  
 
		</table>
   </div>


</div>

</div></div>

        </div>
      </div>
   
   
    
</asp:Content>
