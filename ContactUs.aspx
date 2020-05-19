<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="_15thstreetpizza.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
  <div class="container">
    <%--<p class="social"> <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank"><img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank"><img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank"><img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank"><img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank"><img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank"><img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a> </p>--%>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="welcome clearfix" id="CONTACT">
          <h3>Contact Us </h3>
		  <div class="row">
		  <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
			
			        <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=15th+Street+Pizza+%26+Pub,+2130+Jodeco+Road,+McDonough,+GA+30253&amp;aq=0&amp;oq=15&amp;g=1481+Hudson+Bridge+Road,+Stockbridge,+GA+30281&amp;ie=UTF8&amp;hq=15th+Street+Pizza+%26+Pub,+2130+Jodeco+Road,+McDonough,+GA+30253&amp;hnear=&amp;radius=15000&amp;t=m&amp;cid=1783707317299069748&amp;ll=33.493665,-84.202824&amp;spn=0.025052,0.036564&amp;z=14&amp;output=embed"> </iframe>

			
			</div>
		  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 padding-bottom-10 padding-left-20">
		  
		          <h4 class="brandcolor1 line-height-150">
				 	<div class="orange">Find us at</div>
                      <asp:Label ID="lblLine1" runat="server"></asp:Label><br />
                      <asp:Label ID="lblLine2" runat="server"></asp:Label><br />
                      <asp:Label ID="lblLine3" runat="server"></asp:Label> <%--15th Street Pizza & Pub, 2130 Jodeco Rd McDonough, GA 30253--%> 
				  </h4>
				  <h4 class="brandcolor1 line-height-150">
				  <div class="orange">Call us at:</div><a href="tel:770-507-1478"><asp:Label ID="lblCall" runat="server"></asp:Label></a> <%--770-507-1478--%></h4>
				  
			  <h4 class="brandcolor1 line-height-150">
				  <div class="orange">E-Mail us at:</div>
                  <asp:Literal ID="lblEmails" runat="server"></asp:Literal> 
				  <%--<a href="mailto:contact@15thstreetpizza.com">contact@15thstreetpizza.com</a>--%></h4>
				  
        <h4 class="brandcolor1 line-height-150">
		<div class="orange">We're Open</div>
		<ul class="margin-left-20">
          <li runat="server" id="time1"><%--<span>Mon to Thu:</span> 11am-9:30pm--%><asp:Label ID="lblHour1" runat="server"></asp:Label></li>
          <li runat="server" id="time2"><%--<span>Fri & Sat:</span> 11am-10:30pm--%><asp:Label ID="lblHour2" runat="server"></asp:Label></li>
          <li runat="server" id="liid"><%--<span>Sun:</span> 11am-8:30pm--%><asp:Label ID="lblHour3" runat="server"></asp:Label></li>
        </ul>
		</h4>

		  
</div>
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
