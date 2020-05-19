<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_15thstreetpizza.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%-- Facebook sign button changes start 05/11/2019 start --%>
<script src="scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="https://connect.facebook.net/en_US/all.js" type="text/javascript"></script>
<script src="js/all.js" type="text/javascript"></script>

<asp:Label ID="Lblname" runat="server" Visible="false" Text=""></asp:Label>
<asp:Label ID="LblFBid" runat="server" Visible="false" Text=""></asp:Label>
<asp:Label ID="Lblemail" runat="server" Visible="false" Text=""></asp:Label>
<asp:Label ID="Lblgend" runat="server" Visible="false" Text=""></asp:Label>
<asp:Label ID="LblDOB" runat="server" Visible="false" Text=""></asp:Label>
<asp:LinkButton id="lnkFBcust" Visible="false" runat="server" CssClass="myLink" OnClick="lnkFBcust_Click" />

<%-- Facebook sign button changes start 05/11/2019 end --%>
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
                                                <img src="images/YouTube.png"></a>   </p>--%>
                    <div class="special">
                        <a><img src="images/Latupdat.png" class="img-responsive" /></a>
                        <a id="hrsct" runat="server" href="Register.aspx"><img src="images/Wehire.jpg" style="width:100%" title="Click to register"  class="img-responsive" /></a>
                        <ul>
                            <asp:Repeater ID="rptSpecials" runat="server" OnItemDataBound="rptSpecials_ItemDataBound">
                                <ItemTemplate>   
                                    <li><a href='<%#Eval("Link") %>#SPECIAL'><strong><%#Eval("Item") %></strong>
                                        <asp:Repeater ID="rptSubSpecials" runat="server">
                                            <ItemTemplate>
                                                <br />
                                                <%#Eval("SubItem") %>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <%--      <ul>
        <li><a href="#cntSection">NOW HIRING FOR COOKS! </a></li>
        <li><a href="https://goo.gl/eYQzN1" target="_blank">Current Beers List </a></li>
        <li><a href="SpecialSection.aspx">Don't forget our Specials Section! </a></li>
        <li><a href="http://www.15thstreetpizza.com/orderOnline.aspx" target="_blank"><strong>15th Street Online Ordering: </strong><br>
          Get $3 off any order of $30 or more by entering the code 3OFF30 The $30 has to be before tax, sorry computers rules, not ours! </a></li>
      </ul>--%>
                    </div>
             
                <div class="row menu-items">
                    <div class="col-lg-4 col-md-6 col-sm-8 col-xs-12">
                        <div class="submenu">
                            <h3>MENU ITEMS</h3>
                            <ul>
                                <li><a href="RegularMenu.aspx">
                                    <img src="images/regular-icon.png">
                                    Regular Menu</a></li>
                                <li><a href="CateringMenu.aspx">
                                    <img src="images/catering-icon.png">
                                    Catering Menu</a></li>
                                <li><a href="BeerMenu.aspx">
                                    <img src="images/beer-icon.png">
                                    Beer Menu</a></li>
                                <li><a href="WineMenu.aspx">
                                    <img src="images/wine-icon.png">
                                    Wine Menu</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 map-col">
                        <div class="welcome">
                            <h3>Welcome to 15th Street Pizza & Pub!</h3>
                            <p>Your locally owned and operated pizza joint. We pride ourselves on friendly service, quality ingredients and one heck of a beer selection. Our menu offers award winning pizzas, some darn good wings, fresh salads, subs and calzones. </p>
                            <div id="content-1" class="content">
                                <div class="item">
                                    <ul id="content-slider" class="content-slider">
                                        <li>
                                            <img src="images/img-1.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-3.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-4.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-5.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-7.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-8.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-10.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-11.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-12.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-13.jpg">
                                        </li>
                                        <li>
                                            <img src="images/img-14.jpg">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid content-section" id="cntSection">
            <div class="container">
                <div class="row text-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <ul>
                            <li><strong>We're Open:</strong></li>
                            <li runat="server" id="tim1"><asp:Label ID="Lbltim1" runat="server" Text=""></asp:Label> </li>
                            <li runat="server" id="tim2"><asp:Label ID="Lbltim2" runat="server" Text=""></asp:Label> </li>
                            <li runat="server" id="tim3"><asp:Label ID="Lbltim3" runat="server" Text=""></asp:Label></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 map-col">
                        <h3>Come on Over</h3>
                        <iframe width="98%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=15th+Street+Pizza+%26+Pub,+2130+Jodeco+Road,+McDonough,+GA+30253&amp;aq=0&amp;oq=15&amp;g=1481+Hudson+Bridge+Road,+Stockbridge,+GA+30281&amp;ie=UTF8&amp;hq=15th+Street+Pizza+%26+Pub,+2130+Jodeco+Road,+McDonough,+GA+30253&amp;hnear=&amp;radius=15000&amp;t=m&amp;cid=1783707317299069748&amp;ll=33.493665,-84.202824&amp;spn=0.025052,0.036564&amp;z=14&amp;output=embed"></iframe>
                        <h3 class="white">2130 Jodeco Road . McDonough, GA 30253<br>
                            <br>
                            <span>Phone:</span> 770-507-1478</h3>
                        <div class="recBtn">
                            <asp:Button ID="btnSignUp" CssClass="btn btn-lg btn-brand" runat="server" Text="Signup to receive Coupons & Event notices"  OnClick="btnSignUp_Click"/>
                        </div>

                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 map-col coupForm">
                        <h3>Signup to receive Coupons & Event notices</h3>
                      <a href="http://visitor.r20.constantcontact.com/manage/optin/ea?v=001l2E62PqC4Z0JrjYvXTqU7ki4Re5uW20w53Q6s2jw4GCJVJQfC0--KrCS-4r7GQdLWzhXnKw9NBSTEfQ5r1sevzv-JF2oVcnqzLrRBshlAeE%3D"><img src="images/15th streetSignUp.jpg" /></a>
                      
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid aboveFoot-section">
            <div class="container">
                <div class="row">
                   <%-- <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12  map-col">
                        <h3>Testimonials</h3>
                        <blockquote class="example-obtuse">
                            <div  class="row">
                                <div class="col-lg-2 col-md-3 col-sm-4 col-xs-4 text-center">
                                    <p>
                                        <asp:Label ID="lblTestimonialName" runat="server"></asp:Label></p>
                                    <p><i>
                                        <asp:Label ID="lblTestimonialDate" runat="server"></asp:Label></i> </p>
                                </div>
                                <div class="col-lg-10 col-md-9 col-sm-8 col-xs-8">
                                    <h4>
                                        <asp:Label ID="lblTestimonialTitle" runat="server"></asp:Label></h4>
                                    <p>
                                        <asp:Label ID="lblTestimonial" runat="server"></asp:Label></p>
                                    <p><a href="Testimonials.aspx">Read More</a></p>
                                </div>
                            </div>
                        </blockquote>
                    </div>--%>
                    <div class="col-xs-12  map-col">
                        <h3>Videos</h3>
                        <div class="text-center">
                            <asp:Repeater ID="rptVideo" runat="server">
                                <ItemTemplate>
                                    <iframe width="350" height="250" src='<%#Eval("VideoURL") %>' frameborder="1" allowfullscreen style="border-radius: 5px; margin: 0 10px;"></iframe>
                                </ItemTemplate>
                             </asp:Repeater>
<%--                            <iframe width="200" height="150" src="https://www.youtube.com/embed/VtvoPIJ8hNA" frameborder="1" allowfullscreen style="border-radius: 5px; margin: 0 10px;"></iframe>
                            <iframe width="200" height="150" src="https://www.youtube.com/embed/kS6B8QbuPlI" frameborder="1" allowfullscreen style="border-radius: 5px; margin: 0 10px;"></iframe>
                            <iframe width="200" height="150" src="https://www.youtube.com/embed/T-Ar_Fqq_WY" frameborder="1" allowfullscreen style="border-radius: 5px; margin: 0 10px;"></iframe>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%-- Facebook sign button changes start 05/11/2019 start --%>
<script>
$("document").ready(function() 
         {
            // Initialize the SDK upon load
         FB.init({
                appId: '664279824091059', // App ID
                channelUrl: 'https://www.15thstreetpizza.com/Default.aspx', // Path to your 
                                                                   // Channel File
                scope: 'id,name,gender,user_birthday,email', // This to get the user details back 
                                                             // from Facebook
                status: true, // check login status
                cookie: true, // enable cookies to allow the server to access the session
                xfbml: true  // parse XFBML
            });
             // listen for and handle auth.statusChange events
             FB.Event.subscribe('auth.statusChange', OnLogin);
             FB.Event.subscribe('auth.login', function (response) {     
        // do something with response                   
        if (response.status === 'connected') {
            // user connected                        
            FB.api('/me', function (response) {
                alert(response.name + " " + response.id);
            });
        }
});
        });
   // This method will be called after the user login into facebook.

 FB.Event.subscribe('auth.login', function(response)
{
  console.log("login_event");
  console.log(response.status);
  console.log(response);
}
);
function OnLogin(response) {
    if (response.authResponse)
    {
        FB.api('/me?fields=id,name,gender,email,birthday', LoadValues);
    }
}

//This method will load the values to the labels
    function LoadValues(me)
    {
      
      if (me.name)
      {
          $("[id*=Lblname]").val() = me.name;
          $("[id*=LblFBid]").val() = me.id;
          $("[id*=Lblemail]").val() = me.email;
          $("[id*=Lblgend]").val() = me.gender;
          $("[id*=LblDOB]").val() = me.birthday;
          $("#<%= lnkFBcust.ClientID %>").trigger("click");
          
      }
    }
  </script>
    <%-- Facebook sign button changes start 05/11/2019 end --%>
</asp:Content>
