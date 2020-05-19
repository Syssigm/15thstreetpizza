<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="_15thstreetpizza.Aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
  <div class="container">
    <%--<p class="social"> <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank"><img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank"><img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank"><img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank"><img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank"><img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank"><img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a> </p>--%>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="welcome clearfix" id="ABOUT">
          <h3>About Us </h3>
		  <div class="row">
		  <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
          <p class="margin-top-10">
              <asp:Label runat="server" ID="lblAboutUs"></asp:Label>
			<%--<strong>Patrick</strong> graduated from Florida State University in 2000 with a hospitality degree from the School of Business. He has worked in the hospitality field since 1994. --%>
          </p>
		  <%--<p><strong>Katie</strong> graduated from Florida Atlantic University in 2002 with a degree in English. She has worked in the hospitality field since 1997.
</p>
<p>They met in 1997 at Florida State University. After being best friends for 4 years, they began dating. On April 3rd 2004, they got married. They have 2 daughters, Mackenzie who is 10, and Caymen who is 6.
</p>
<p><strong>Dennis</strong> (Dad) is retired from IBM, financed the pub, and does the marketing.</p>--%>
</div>
		  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 padding-bottom-10">
		  <img src="images/aboutus.png" class="img-thumbnail img-responsive" />
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
