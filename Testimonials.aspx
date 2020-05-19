<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="_15thstreetpizza.Testimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
  <div class="container">
    <%--<p class="social"> <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank"><img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank"><img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank"><img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank"><img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank"><img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank"><img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a> </p>--%>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="welcome clearfix" id="PAST" style="background: #FFF url(images/restaurant.JPG) bottom center no-repeat; background-size: cover;">
          <h3>Testimonials </h3>
          <p class="text-right">
            <a href="WriteaReview.aspx" class="btn btn-info"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> Write a Review</a>
          </p>
		  <asp:Repeater ID="rptRepeater" runat="server">
              <ItemTemplate>
                  <div class="media testi">
                    <div class="media-left text-center"> <!--<a href="#"> <img class="" src="images/user-icon.png" alt="..."> </a>-->
                      <p><strong><%#Eval("Names") %></strong><br>
                        <i><%#DataBinder.Eval(Container.DataItem, "Dates", "{0:MM/dd/yyyy}")  %></i> </p>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading"><%#Eval("Title") %></h4>
                      <p><%#Eval("Review") %><asp:Label ID="Label1" runat="server"></asp:Label></p>
                    </div>
                  </div>
              </ItemTemplate>
		  </asp:Repeater>
          <%--<div class="media testi">
            <div class="media-left text-center"> <!--<a href="#"> <img class="" src="images/user-icon.png" alt="..."> </a>-->
              <p><strong>Angelina</strong><br>
                <i>9/24/2015</i> </p>
            </div>
            <div class="media-body">
              <h4 class="media-heading">First Experience and Amazing!!!</h4>
              <p>I had the wings (Garlic Parmesean) and fried pickles.. OMG sooooo good. I'm ordering now. I will definetely put the word out for this place. An the delivery was fast as well!!! Keep up the great work guys. </p>
            </div>
          </div>
		  
		  <div class="media testi">
            <div class="media-left text-center"> 
              <p><strong>Ernie</strong><br>
                <i>9/7/2015</i> </p>
            </div>
            <div class="media-body">
              <h4 class="media-heading">Amazing Experience</h4>
              <p>15th Street Team-You all went out of your way to make my experience amazing. From timely and courteous staff to great food and a awesome beverage selections. 15th Street is my new go to restaurant when ever I am in town. I will make sure to tell everyone I know to stop by when they are in town. ??????????.Thank you and see ya soon!-Ernie
</p>
            </div>
          </div>
		  
		  <div class="media testi">
            <div class="media-left text-center"> 
              <p><strong>Tom</strong><br>
                <i>5/6/2015</i> </p>
            </div>
            <div class="media-body">
              <h4 class="media-heading">Great Pub</h4>
              <p>Heading home to Indiana and had a last night to kill before flying out of Atlanta.This was the perfect place to dine and imbibe in a pint or two after a week and a half of seafood and low country cuisine in Charleston and Savannah.I needed a pizza fix and along with an excellent greek salad to go with the nice selection of craft brews on tap, the 15th Street Pizza and Pub covered all my needs. I am putting this place on my GPS for the next time I am passing through.</p>
            </div>
          </div>
		  
		  <div class="media testi">
            <div class="media-left text-center"> 
              <p><strong>Craig</strong><br>
                <i>11/7/2014</i> </p>
            </div>
            <div class="media-body">
              <h4 class="media-heading">Atmosphere</h4>
              <p>Great atmosphere with a neighborhood feel! Excellent food with a tremendous staff and Thad is a great manager!</p>
            </div>
          </div>
		  
		  <div class="media testi">
            <div class="media-left text-center"> 
              <p><strong>Ann</strong><br>
                <i>10/11/2014</i> </p>
            </div>
            <div class="media-body">
              <h4 class="media-heading">great food</h4>
              <p>The pizzas were great, Greek salad was terrific.</p>
            </div>
          </div>--%>
		  
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
