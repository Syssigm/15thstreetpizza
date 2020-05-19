<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="_15thstreetpizza.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container-fluid main-section">
            <div class="container">
                 <%--<p class="social">
                    <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                        <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                            <img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank">
                                <img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank">
                                    <img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                                        <img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                                            <img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a>
                </p>--%>
                <div class="row">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h4 class="brandcolor1 line-height-150">
		                <div class="welcome clearfix" style="height:320px;" id="EVENTS">
                            <h3>New & Events </h3>
                            <div style="padding-left:14px;">
                            <%--<h4 class="brandcolor1 line-height-150">
                                    <div class="orange">WISHES</div>
                                    <ul class="margin-left-20">
                                        <li><span>HAPPY NEW YEAR 2017 TO ALL OUR CUSTOMERS.</span></li>
                                    </ul>
                                </h4>--%>
                                <h4 class="brandcolor1 line-height-150">
                                    <div class="orange">EVENTS</div>
                                    <asp:Repeater ID="RepeaterEvents" runat="server">
                                     <ItemTemplate>
                                    <ul class="margin-left-20">
                                        <li><span><%#Eval("News") %></span></li>
                                    </ul>
                                      </ItemTemplate>
                                    </asp:Repeater>
                                </h4>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid content-section">
            <div class="container">
                <div class="row text-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <ul>
                            <li><strong>We're Open:</strong></li>
                            <li><span>Mon to Thu:</span> 11am-9:30pm</li>
                            <li><span>Fri & Sat:</span> 11am-10:30pm</li>
                            <li><span>Sun:</span> 11am-8:30pm</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
